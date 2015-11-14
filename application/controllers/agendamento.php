<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Agendamento extends CI_Controller {

	public function novo() {
		$this->load->model("eventos_model");

		$evento = $this->input->post("evento");
		$quantidade = $this->input->post("quantidade");
		$this->_novoAgendamento($evento, $quantidade);
	}

	public function realizaTransacao() {
		echo "Codigo " . $this->input->post('evento_codigo');
		echo "<br>";
		echo "Quantidade " . $this->input->post('quantidade');
		echo "<br>";
		echo "Tipo de pagamento " . $this->input->post('tipo_pagamento');
	}

	public function aguardaPagamento() {
		$this->load->template("eventos/aguardando_pagamento");
	}

	public function realizaTransacoesPagamentos(){
		if($this->input->post('tipo_pagamento') == '#card'){
			$this->realizaTransacaoCartao();
		}
		else $this->realizaTransacaoBoleto();

	}

	public function realizaTransacaoBoleto() {
		$this->load->model("desconto_model");
		$this->load->model("eventos_model");
		$this->load->model("usuarios_model");
		$this->load->model("faturas_model");
		$this->load->library('form_validation');
		$this->load->helper('pqr_email');
		$this->load->helper('iugu');

		$evento = $this->input->post('evento_codigo');
		$quantidade = $this->input->post('quantidade');
		$atividade_codigo = $this->input->post('atividade_codigo');
		
		$cupom_desconto = $this->input->post('cupom_desconto');
		$desconto = $this->desconto_model->buscarDesconto($cupom_desconto, $atividade_codigo);
		if(empty($desconto)){
			$desconto_porcentagem = 0;
			$preco_desconto = 0;
		}else{
			$desconto_porcentagem = $desconto['porcentagem']/100;
		}

		$dados_validados = $this->_validacao();
		if ($dados_validados) {
			$email = $this->input->post('email');
			$nome = $this->input->post('nome');
			$celular = $this->input->post('celular');
			$requisitos_especiais = $this->input->post('requisicoes_especiais');
			$preco = $this->input->post('preco_raw');
			if($desconto_porcentagem != 0){
				$preco_desconto = $preco*$quantidade;
				$preco_desconto = str_replace(".", "",number_format($preco_desconto*$desconto_porcentagem, 2));
			}
			$preco_formatado = str_replace('.', '', $preco);
			$descricao = $this->input->post('descricao');
			$data_horario = $this->input->post('data_horario');
			$forma_pagamento = 'boleto bancario';

			$disponivel = $this->_verificaDisponibilidade($evento, $quantidade);

			if ($disponivel != 0) {
				$resultado = $this->_criaBoleto($email, $descricao, $quantidade, $preco_formatado, $preco_desconto);
				
				if (!array_key_exists("errors", $resultado)) {
					$invoice_id = $resultado["invoice_id"];
					$usuario = $this->_getUsuarioId($nome, $celular, $email);

					$vagas_atualizados = $this->_atualizaVagas($resultado["success"], $evento, $disponivel, $quantidade, $atividade_codigo);
					if(!empty($desconto))
					$this->desconto_model->atualizaCupom($desconto["codigo"], $desconto["quantidade"], $desconto["usados"]);
					//add fatura
					$fatura = array(
						'id' => $invoice_id,
						'evento_codigo' => $evento,
						'usuario_id' => $usuario,
						'data' => datetime_now(),
					);

					$this->faturas_model->salva($fatura);
					//verificar gatilho que aciona o salvamento de faturas

					//gerar voucher
					//gerar qrcode

					/*Inicio de dados para email*/
					$dados_atividade = $this->_dadosAtividade($evento);
					$dados_compra = array(
						'data_compra' => datetime_now(),
						'quantidade' => $quantidade,
						//'preco' => $preco_confirmacao,
						'voucher' => $invoice_id,
						'forma_pagamento' => $forma_pagamento,
					);
					/*Fim de dados para email*/


					$total = str_replace('.', ',', ($preco*$quantidade));
					if(substr($preco, strlen($preco)-2, 2) == '00'){
						$total = $total.",00";
					}

					$dados_email = array(
						'atividade' => $dados_atividade,
						'nome' => $nome,
						'celular' => $celular,
						'email' => $email,
						'preco' => str_replace('.', ',', $preco),
						'total' => $total,
						'url' => $resultado['url'],
						'compra' => $dados_compra,
					);

					//send email de confirmação(com voucher e qrcode)
					$this->_sendEmailToClientWaiting($email, $dados_email);
					//pegar email do organizador
					//$this->_sendEmailToOrganizer();
					$this->_sendEmailToPQRWaiting($dados_email);
					//load page de sucesso no agendamento
					//$this->load->view("eventos/sucesso");
					//redirect(base_url("fatura/novo"));
					$url_boleto_iugu = $resultado['url'];
					echo "<script language='javascript'>window.location.replace('$url_boleto_iugu');</script>";

					echo json_encode(array('success' => $resultado['success'],
						'url_boleto' => $resultado['url'], 'errors' => $resultado['errors'],
						'url_aguardando' => base_url("agendamento/aguardaPagamento")));
				} else {
					echo json_encode(array('success' => false,
						'errors' => 'erros na criação do boleto'));
				}
			} else {
				echo json_encode(array('success' => false,
					'errors' => 'vagas indesponiveis'));
			}
		} else {
			$this->_novoAgendamento($evento, $quantidade);
			/*echo json_encode(array('success' => false,
				'errors' => 'dados invalidos'));*/
		}
	}

	public function realizaTransacaoCartao() {
		$this->load->model("desconto_model");
		$this->load->model("eventos_model");
		$this->load->model("usuarios_model");
		$this->load->model("faturas_model");
		$this->load->library('form_validation');
		$this->load->helper('pqr_email');
		$this->load->helper('iugu');
		$this->load->helper('lr');

		$evento = $this->input->post('evento_codigo');
		$quantidade = $this->input->post('quantidade');
		$atividade_codigo = $this->input->post('atividade_codigo');

		$cupom_desconto = $this->input->post('cupom_desconto');
		$desconto = $this->desconto_model->buscarDesconto($cupom_desconto, $atividade_codigo);
		if(empty($desconto)){
			$desconto_porcentagem = 0;
			$preco_desconto = 0;
		}else{
			$desconto_porcentagem = $desconto['porcentagem']/100;
		}

		$dados_validados = $this->_validacao();
		if ($dados_validados) {
			$token = $this->input->post('token');
			$nome_completo = $this->input->post('nome');
			$celular = $this->input->post('celular');
			$requisitos_especiais = $this->input->post('requisicoes_especiais');
			$email = $this->input->post('email');
			$preco = $this->input->post('preco_raw');
			if($desconto_porcentagem != 0){
				$preco_desconto = $preco*$quantidade;
				$preco_desconto = str_replace(".", "",number_format($preco_desconto*$desconto_porcentagem, 2));
			}
			$preco_formatado = str_replace('.', '', $preco);
			$preco_confirmacao = $this->input->post('preco_str');
			$descricao = $this->input->post('descricao');
			$data_horario = $this->input->post('data_horario');
			$forma_pagamento = $this->input->post('tipo_pagamento');
			
			$parcelas = $this->input->post('parcelas');
			if($forma_pagamento == '#card')$forma_pagamento = 'Cartão de Crédito';

			$disponivel = $this->_verificaDisponibilidade($evento, $quantidade);
			
			if ($disponivel != 0) {
				$result_pgto = $this->_pagar($token, $email, $descricao, $quantidade, $preco_formatado, $parcelas, $preco_desconto);

				if ($result_pgto->success) {
					$invoice_id = $result_pgto["invoice_id"];

					$vagas_atualizados = $this->_atualizaVagas($result_pgto["success"],	$evento, $disponivel, $quantidade,$atividade_codigo);
					if(!empty($desconto))
					$this->desconto_model->atualizaCupom($desconto["codigo"], $desconto["quantidade"], $desconto["usados"]);
					//retorna usuario_id, se nao existir, cria um usuario anonimo
					$usuario = $this->_getUsuarioId($nome_completo, $celular, $email);

					//add fatura
					$fatura = array(
						'id' => $invoice_id,
						'evento_codigo' => $evento,
						'usuario_id' => $usuario,
						'data' => datetime_now(),
					);

					$this->faturas_model->salva($fatura);
					//verificar gatilho que aciona o salvamento de faturas

					//gerar voucher
					//gerar qrcode

					/*Inicio de dados para email*/
					$dados_atividade = $this->_dadosAtividade($evento);
					$dados_usuario = $this->_dadosUsuario($usuario);
					$dados_compra = array(
						'data_compra' => datetime_now(),
						'quantidade' => $quantidade,
						'preco' => $preco_confirmacao,
						'voucher' => $invoice_id,
						'forma_pagamento' => $forma_pagamento,
					);
					/*Fim de dados para email*/

					$total = str_replace('.', ',', ($preco*$quantidade));
					if(substr($preco, strlen($preco)-2, 2) == '00'){
						$total = $total.",00";
					}

					$dados_email = array(
						'atividade' => $dados_atividade,
						'usuario' => $dados_usuario,
						'compra' => $dados_compra,
						'preco' => str_replace('.', ',', $preco),
						'total' => $total,
					);
					//send email de confirmação(com voucher e qrcode)
					
					//$this->_sendEmailToClient($email, $dados_email);

					//pegar email do organizador
					//$this->_sendEmailToOrganizer();

					//$this->_sendEmailToPQR($dados_email);

					$this->load->template('eventos/sucesso', $dados_email);

					//redirect(base_url("fatura/novo"));
				} else {
					$error = getMessageErrorByLR($result_pgto->LR);
					$this->_novoAgendamento($evento, $quantidade, $error);
				}
			} else {
				//nao tem vagas disponiveis
				//colocar mensagem no flash_session
				$error = "Não há vagas disponiveis!";
				$this->_novoAgendamento($evento, $quantidade, $error);
			}
		} else {
			$this->_novoAgendamento($evento, $quantidade);
		}
	}

	function _sendEmailToClient($to, $data) {
		$subject = "Confirmação de pagamento!";
		$conteudo = $this->load->view('emails/confirmacaoPagamento', $data, TRUE);
		send_email($to, $subject, $conteudo);
	}

	function _sendEmailToClientWaiting($to, $data) {
		$subject = "Aguardando de pagamento!";
		$conteudo = $this->load->view('emails/aguardando_pagamento', $data, TRUE);
		send_email($to, $subject, $conteudo);
	}

	function _sendEmailToOrganizer($to, $subject, $conteudo) {
		send_email($to, $subject, $conteudo);
	}

	function _sendEmailToPQR($data) {
		$subject = "Pagamento realizado!";
		$conteudo = $this->load->view('emails/venda_realizada', $data, TRUE);
		send_email("comercial@praquerumo.com.br", $subject, $conteudo);
	}

	function _sendEmailToPQRWaiting($data) {
		$subject = "Aguardando Pagamento!";
		$conteudo = $this->load->view('emails/aguardando_pagamento', $data, TRUE);
		send_email("comercial@praquerumo.com.br", $subject, $conteudo);
	}

	function _getUsuarioId($nome_completo, $celular, $email) {
		$nomes = explode(" ", $nome_completo, 2);

		$usuario = $this->usuarios_model->buscaUsuarioId($email);

		//cadastra como anonimo se nao estiver no bd
		if (empty($usuario)) {
			$cliente_iugu = $this->_addClienteIugu($email, $nome_completo);

			$usuario = array(
				'nome' => $nomes[0],
				'sobrenome' => $nomes[1],
				'telefone' => $celular,
				'username' => $email,
				'email' => $email,
				'senha' => md5($nomes[0]),
				'cliente' => true,
				'organizador' => false,
				'revendedor' => false,
				'anonimo' => true,
				'id_iugu' => $cliente_iugu['id'],
				'dt_criacao' => datetime_now(),
				'dt_atualizacao' => datetime_now(),
			);

			$this->usuarios_model->salva($usuario);
			$usuario = $this->usuarios_model->buscaUsuarioId($email);
		}

		return $usuario['id'];
	}

	function _dadosUsuario($usuario_id) {

		return $this->usuarios_model->buscaUsuario($usuario_id);
	}

	/*validacao dos campos do formulario*/
	function _validacao() {
		//validar nome para que tenha nome + sobrenome
		$this->form_validation->set_rules('nome', 'Nome', 'trim|required|min_length[5]|max_length[60]|xss_clean');
		$this->form_validation->set_rules('celular', 'Celular', 'required');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
		$this->form_validation->set_rules('confirmacao', '"Concorda com os termos"', 'required');

		$this->form_validation->set_error_delimiters("<p class='alert alert-danger'>", "</p>");

		return $this->form_validation->run();
	}

	function _dadosAtividade($codigo_evento) {
		$evento = $this->eventos_model->buscarEventoDetalhes($codigo_evento);
		$dados_atividade = array(
			'titulo' => $evento['titulo'],
			'ponto_encontro' => $evento['ponto_encontro'],
			'data' => $evento['data_inicio'],
			'horario' => $evento['hora_inicio'],
		);

		return $dados_atividade;
	}

	/** remove acentos do titulo do evento. 
	** dependendo da configuração do servidor, o controller pega a string vazia (se houver acentos) 
	**/

	private function _removeUTF($titulo) {
		$titulo = strtr(utf8_decode($titulo),
                 utf8_decode('ŠŒŽšœžŸ¥µÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýÿ'),
                             'SOZsozYYuAAAAAAACEEEEIIIIDNOOOOOOUUUUYsaaaaaaaceeeeiiiionoooooouuuuyy');
		return $titulo;
	}

	private function _verificaBloqueioBoleto($dataFim){
		$dataAtualPhp = strtotime("+3 days");
		$dataFim = strtotime($dataFim);
		
		$bloquear = false;
		if($dataAtualPhp > $dataFim){
			$bloquear = true;
		}
		return $bloquear;
	}

	function _novoAgendamento($codigo_evento, $quantidade, $error = null) {
		$evento = $this->eventos_model->buscarEventoDetalhes($codigo_evento);
		$precoTotal = $evento['preco'] * $quantidade;
		$str_preco = numeroEmReais($precoTotal);

		$descricao = getDayData($evento['data_inicio']) .
		" de " . getMonthFullNameData($evento['data_inicio']) . " " .
		getSessionTime($evento['hora_inicio']) . " - " . getSessionTime($evento['hora_fim']);
		
		// remove acentos do titulo do evento. 
		$evento['titulo'] = $this->_removeUTF($evento['titulo']);

		$bloquear_boleto = $this->_verificaBloqueioBoleto($evento['visivel_fim']);
		$valoresParcelados = $this->_calculaParcelaIugu($precoTotal);
		$data = array(
			"evento" => $evento,
			"quantidade" => $quantidade,
			"error" => $error,
			"preco" => $str_preco,
			"preco_unit" => numeroEmReais($evento['preco']),
			"preco_raw" => $evento['preco'],
			"preco_avg" => numeroEmReais($precoTotal / $quantidade),
			"preco_total" => $precoTotal,
			"parcelas"  => $valoresParcelados,
			"descricao_pgto" => $evento['titulo'] . ", " . $descricao,
			"descricao" => $descricao,
			'bloquear_boleto' => $bloquear_boleto,
		);
		$this->load->template("agendamento/index", $data);
	}

	// calculo de juros
	private function _calculaParcelaIugu($valor) {
		
		$this->load->helper("currency");
		
		// vezes => juros
		$parcelasComJuros = array(
			"3" => "0.10",
			"4" => "0.11"
		);

		$valoresParcelados = array();
		

		if($valor >= 60 && $valor <= 100) {
			$limite = 2;
		} else if($valor > 100) {
			$limite = 4;
		} else {
			$limite = 1;
		}

		for($i=1;$i <= $limite; $i++) {
			
			if($i <= 2) {
				$novoValor = $valor/$i;
				$valoresParcelados[$i] = number_format($novoValor,3);
			} else {
				
				$novoValor = $valor * ((1-0.06) / (1-$parcelasComJuros[$i]));
				
				$valoresParcelados[$i] = number_format($novoValor/$i,3);
			}
		}
		
		return $valoresParcelados;

	}

	/*descontar de disponiveis do evento*/
	function _atualizaVagas($result_success, $evento, $vagas_disponiveis, $quantidade, $atividade_codigo) {
		if ($result_success) {
			$vagas = (int) $vagas_disponiveis - $quantidade;
			$vagas_restantes = ($vagas > 0) ? $vagas : 0;
			$dados = array('disponivel' => $vagas_restantes);
			$this->eventos_model->atualizaVagasDisponiveis($evento, $dados);
			$maxVagas = $this->eventos_model->buscaMaxVagasDisponiveis($atividade_codigo);
			if($maxVagas['disponivel'] == 0){
				$this->eventos_model->atualizaStatusVendivel($atividade_codigo);
			}
			return true;
		} else {
			//erro na operação bancaria
			return false;
		}
	}

	/*Verifica se ainda existem vagas disponiveis*/
	function _verificaDisponibilidade($evento, $quantidade) {
		$vagas_array = $this->eventos_model->buscaVagasDisponiveis($evento);
		$vagas_disponiveis = $vagas_array['disponivel'];

		return ($quantidade <= (int) $vagas_disponiveis) ? $vagas_disponiveis : 0;
	}

	/* Cria cliente iugu */
	function _addClienteIugu($email, $nome_completo) {
		setIuguAPIToken();

		$cliente = array(
			'email' => $email,
			'name' => $nome_completo,
		);

		return Iugu_Customer::create($cliente);
	}


	/*Realiza o pagamento pelo iugu*/
	function _pagar($token, $email, $descricao, $quantidade, $preco, $parcelas, $desconto) {

		setIuguAPIToken();
		$carrinho = array(
			"token" => $token,
			"email" => $email,
			"months" => $parcelas,
			"discount_cents" => $desconto,
			"items" => array(
				array(
					"description" => $descricao,
					"quantity" => $quantidade,
					"price_cents" => $preco,
				),
			),
		);

		return Iugu_Charge::create($carrinho);
	}

	function _criaBoleto($email, $descricao, $quantidade, $preco, $desconto) {
		setIuguAPIToken();
		$carrinho = array(
			"method" => "bank_slip",
			"email" => $email,
			"due_date" => date("d/m/Y"),
			"discount_cents" => $desconto,
			"items" => array(
				array(
					"description" => $descricao,
					"quantity" => $quantidade,
					"price_cents" => $preco,
				),
			));

		return Iugu_Charge::create($carrinho);
	}

	function teste(){
		$this->load->model("desconto_model");

		$cupom_desconto = $this->input->post("cupom_desconto");
		$atividade_codigo = $this->input->post("atividade_codigo");
		$atividade_preco = $this->input->post("atividade_preco");

		$desconto = $this->desconto_model->buscarDesconto($cupom_desconto, $atividade_codigo);
	 		
		if(empty($desconto)){
			$preco = $atividade_preco;
		}else{
			$porcentagemDesconto = $desconto["porcentagem"]/100;
			$preco = number_format($atividade_preco - ($atividade_preco*$porcentagemDesconto), 2);
		}

		$valoresParcelados = $this->_calculaParcelaIugu($preco);

		$data = array(
			'preco' => floatval($preco),
			'valoresParcelados' => $valoresParcelados
		);
		echo json_encode($data);
	}
}
