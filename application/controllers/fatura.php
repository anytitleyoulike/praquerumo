<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Fatura extends CI_Controller {

	//web hook de notificacao para nova fatura
	public function Novo() {
		$this->load->model("faturas_model");
		$this->load->model("status_model");
		$this->load->model("historico_model");

		if ($this->input->server("REQUEST_METHOD") == "POST") {
			$event = $this->input->post('event');
			$data = $this->input->post('data');

			$status = $this->status_model->getStatusId($data['status']);

			$fatura = array(
				'fatura_id' => $data['id'],
				'status_id' => $status['id'],
				'data' => datetime_now(),
			);

			$this->historico_model->salva($fatura);
		}
	}

	public function Test(){
		$event = $this->input->post('event');
		$data = $this->input->post('data');
		echo '<pre>';
	    var_dump($event);
	    var_dump($data);
	    echo '</pre>';
	}

	public function sendTest(){
		$url = "http://www.praquerumo.com.br/fatura/test";

	    $data = array('event' => 'Eventos', 'data' => 'Faturas');

	    $options = array(
	        'http' => array(
	            'header'  => "Content-type: application/x-www-form-urlencoded",
	            'method'  => 'POST',
	            'content' => http_build_query($data),
	        ),
	    );
	    $context  = stream_context_create($options);
	    $result = file_get_contents($url, false, $context);
	    echo '<pre>';
	    var_dump($result);
	    echo '</pre>';
	}

	public function sendTestFatura(){
		$url = base_url('fatura/mudanca');

	    $data = array(
	    	'event' => 'Eventos',
	    	'data' => array(
	    		'status' => 'paid',
	    		'id' => '3636478125D34EFCBAC3CFE11F0745C1',
	    		)
	    	);

	    $options = array(
	        'http' => array(
	            'header'  => "Content-type: application/x-www-form-urlencoded",
	            'method'  => 'POST',
	            'content' => http_build_query($data),
	        ),
	    );
	    $context  = stream_context_create($options);
	    $result = file_get_contents($url, false, $context);
	    echo '<pre>';
	    var_dump($result);
	    echo '</pre>';
	}

	//web hook de notificacao para mudanca de estado da fatura
	public function Mudanca() {
		$this->load->model("faturas_model");
		$this->load->model("status_model");
		$this->load->model("historico_model");
		$this->load->model("eventos_model");
		$this->load->model("usuarios_model");
		$this->load->helper("iugu");
		$this->load->helper('pqr_email');

		if ($this->input->server("REQUEST_METHOD") == "POST") {
			/* DEBUG
			_debugWebHook();
			 */
			$this->_debugWebHook();
			$this->_logger("*******Começando webhook***********");
			$event = $this->input->post('event');
			$data = $this->input->post('data');

			//libera vaga quando boleto eh cancelado ou expira
			if ($data['status'] == "canceled" ||
				$data['status'] == "expired") {
				$this->_logger("Webhook de cancelamento/expiracao realizado");
				$this->_freeAgendamento($data['id']);
				$this->_logger("Liberacao de agendamento....ok!");
				//envia email de cancelamento/expiracao da fatura
				$dados_email = $this->_getEmailData($data['id']);
				$dados_cancelamento = array('nome' => $data_email['usuario']['nome']);
				$this->_sendEmailToClientCancelExPiration($dados_email['usuario']['email'], $dados_cancelamento);
				$this->_sendEmailToPQRCancelExpiration($dados_email);
			} elseif ($data['status'] == "paid") {
				//envia confirmacao de pagamento
				$this->_logger("Webhook de pagamento realizado");
				$dados_email = $this->_getEmailData($data['id']);
				$this->_logger("fim do getmaildata");
				$this->_sendEmailToClientConfirmacao($dados_email['usuario']['email'], $dados_email);
				$this->_sendEmailToPQRConfirmacao($dados_email);
				$this->_logger("fim emails de paid");
			} else {
				//outros tipos de fatura
				$this->_logger("outros status de pagamento");
				$this->_logger($data['id']);
				$this->_logger($data['email']);
				$this->_logger($data['status']);
			}
			$this->_logger("salvando fatura!");
			$status = $this->status_model->getStatusId($data['status']);
			$fatura = array(
				'fatura_id' => $data['id'],
				'status_id' => $status['id'],
				'data' => datetime_now(),
			);
			//verificar se a fatura ja esta salva com este status
			$this->_logger("Salvando no historico");
			$this->historico_model->salva($fatura);
			$this->_logger("*******Finalizando webhook***********");
		}

	}

	function _debugWebHook() {
		$data = print_r($_POST, 1);
		$fd = @fopen("webhook.log", "a");
		fwrite($fd, "\n");
		fwrite($fd, "**** Iniciando Web Hook logger ****" . datetime_now());
		fwrite($fd, "\n");
		fwrite($fd, $data);
		fwrite($fd, "**** Finalizando Web Hook logger ****" . datetime_now());
		fclose($fd);
	}

	function _logger($message) {

		echo '<pre>';
	    var_dump( "[" . datetime_now() . "]" . $message);
	    echo '</pre>';

		$fd = @fopen("logger.log", "a");
		fwrite($fd, "\n");
		fwrite($fd, $message);
		fclose($fd);
	}

	/*liberar de disponiveis do evento*/
	function _freeAgendamento($fatura_id) {
		setIuguAPIToken();
		$fatura = Iugu_Invoice::fetch($fatura_id);

		$itens = $fatura['items'];

		//pega o evento para a fatura
		$evento_array = $this->faturas_model->getEvento($fatura_id);
		$evento = $evento_array['evento_codigo'];

		//pega a quantidade comprada
		$quantidade = 0;
		foreach ($itens as $item) {
			$quantidade += $item->quantity;
		}
		//atualiza as vagas do evento
		$disponivel = $this->_verificaDisponibilidade($evento);
		$vagas = (int) $disponivel + $quantidade;
		$vagas_restantes = ($vagas > 0) ? $vagas : 0;
		$dados = array('disponivel' => $vagas_restantes);
		$this->eventos_model->atualizaVagasDisponiveis($evento, $dados);
	}

	/*Verifica se ainda existem vagas disponiveis*/
	function _verificaDisponibilidade($evento) {
		$vagas_array = $this->eventos_model->buscaVagasDisponiveis($evento);
		$vagas_disponiveis = $vagas_array['disponivel'];

		return $vagas_disponiveis;
	}

	function _sendEmailToClientCancelExPiration($to, $data) {
		//email de cancelamento ou expiracao de boleto
		$subject = "Fatura cancelada ou expirada!";
		$conteudo = $this->load->view('emails/fatura_cancelada', $data, TRUE);
		send_email($to, $subject, $conteudo);
	}

	function _sendEmailToPQRCancelExpiration($data) {
		//email de cancelamento ou expiracao de boleto
		$subject = "Cancelamento ou expiração de fatura!";
		$conteudo = $this->load->view('emails/fatura_cancelada', $data, TRUE);
		send_email("comercial@praquerumo.com.br", $subject, $conteudo);
	}

	function _sendEmailToClientConfirmacao($to, $data) {
		//email de confirmacao de pagamento de boleto
		$subject = "Confirmação de pagamento!";
		$conteudo = $this->load->view('emails/confirmacaoPagamentoBoleto', $data, TRUE);
		send_email($to, $subject, $conteudo);
	}

	function _sendEmailToPQRConfirmacao($data) {
		$subject = "Pagamento realizado!";
		$conteudo = $this->load->view('emails/vendaRealizada', $data, TRUE);
		send_email("comercial@praquerumo.com.br", $subject, $conteudo);
	}

	function _getEmailData($fatura_id) {
		//implementacao provisoria de obtendcao de dados

		//obtem informacoes para envio de email
		setIuguAPIToken();
		$fatura = Iugu_Invoice::fetch($fatura_id);

		$email = $fatura->email;
		############dados da compra##################
		//pega o evento para a fatura
		$evento_array = $this->faturas_model->getEvento($fatura_id);
		$codigo_evento = $evento_array['evento_codigo'];
		$evento = $this->eventos_model->buscarEventoDetalhes($codigo_evento);

		$dados_atividade = array(
			'titulo' => $evento['titulo'],
			'ponto_encontro' => $evento['ponto_encontro'],
			'data' => dataMysqlParaPtBr($evento['data_inicio']),
			'horario' => substr($evento['hora_inicio'], 0, 5),
		);
		############dados da compra##################
		$dados_compra['voucher'] = $fatura_id;
		$dados_compra['data_compra'] = $fatura->created_at;
		$dados_compra['desconto'] = $fatura->discount;
		//pega a quantidade comprada
		$itens = $fatura['items'];

		foreach ($itens as $item) {
			$dados_compra['quantidade'] = $item->quantity;
			$dados_compra['preco'] = $item->price;
			$dados_compra['subtotal'] = number_format($fatura->item_total_cents/100, 2, ",", ".");
			$dados_compra['total'] = $fatura->total;
		}

		############dados do usuario##################
		$usuario = $this->usuarios_model->buscaUsuarioId($email);
		if (empty($usuario)) {
			//send_email_error
			$this->_logger("Usuario inexistente, id: " . $usuario['id']);
		} else {
			$dados_usuario = $this->usuarios_model->buscaUsuario($usuario['id']);
		}
		$dados_email = array(
			'atividade' => $dados_atividade,
			'usuario' => $dados_usuario,
			'compra' => $dados_compra,
		);

		return $dados_email;
	}
}