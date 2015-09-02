<?php
if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Newsletter extends CI_Controller {

	public function novo() {

		$this->load->model("newsletter_model",'newsletter');
		$this->form_validation->set_rules('inputEmail', 'e-mail', 'trim|required|valid_email|callback_ja_cadastrado');

		$sucesso = $this->form_validation->run();

		if ($sucesso) {
			
			$email = $this->input->post('inputEmail');
			
			$dados = array(
				'email' 			 => $email,
				'codigo_verificacao' => md5(uniqid($email . rand())),
				'ativo'              => false
			);
			
			$this->newsletter->salvar($dados);

			$this->_enviaEmailVerificacao($email);

			$this->load->template('newsletter/obrigado');

		} else {

			$this->load->template("newsletter/adicionar_email");
		}
	}

	public function oi() {
		$data = array("msg" => "blablabla", "status" => true);
		$this->load->template("newsletter/confirmacao",$data);
	}

	public function addEmail() {
		
		if($this->input->server("REQUEST_METHOD") == "POST") {
			$this->load->model("newsletter_model",'newsletter');
			$this->form_validation->set_rules('inputEmail', 'e-mail', 'trim|required|valid_email|callback_ja_cadastrado');
			$this->form_validation->set_error_delimiters("<p class='alert alert-danger' style='width:42%; margin-left:30%'>", "</p>");
			$sucesso = $this->form_validation->run();

			if ($sucesso) {
				$email = $this->input->post('inputEmail');
				
				$dados = array(
					'email' 			 => $email,
					'codigo_verificacao' => md5(uniqid($email . rand())),
					'ativo'              => false
				);
				
				$this->newsletter->salvar($dados);

				$this->_enviaEmailVerificacao($email);

				$this->load->template('newsletter/obrigado');

			} else {
				$this->load->template("newsletter/adicionar_email");	
			}
		} else {
			$this->load->template("newsletter/adicionar_email");
		}
	}

	public function _enviaEmailVerificacao($email) {

		$this->load->model("newsletter_model",'newsletter');
		$this->load->library('email');

				$this->email->initialize(array(
				'protocol' => 'smtp',
				'smtp_host' => 'smtp.sendgrid.net',
				'smtp_user' => 'praquerumo',
				'smtp_pass' => '@tt171423',
				'smtp_port' => 587,
				'crlf' => "\r\n",
				'newline' => "\r\n"
			));
		
		$user = $this->newsletter->buscaEmail($email);

		$this->email->from('suporte@praquerumo.com', 'Suporte PQR');
		$this->email->subject('Confirmação de Email');

		$this->email->to($email);
		$this->email->message("Caro usuário este é seu link de confirmação de email ". base_url('/verifica/'.$user->codigo_verificacao . "\n
			Clique para obter acesso ao nosso E-BOOK\nObrigado!\n Equipe PraQueRumo"));
		$this->email->send();
		
	}

	public function disparaEmail() {
		$this->db->where("ativo", 0);
		$result = $this->db->get('newsletter')->result();

		foreach ($result as $users) {
			$this->_enviaEmailVerificacao($users->email);
		}
	}

	public function geradorCodigo() {

		$this->load->model("newsletter_model", "newsletter");

		$result = $this->newsletter->getAllUsers();

		foreach ($result as $users) {
			
			if($users->ativo == "" && empty($users->codigo_verificacao)){

				$codigo = md5(uniqid($users->email . rand()));
				
				$this->db->set('codigo_verificacao', $codigo);
				$this->db->set('ativo', FALSE);
				$this->db->where('id', $users->id);
				$this->db->update('newsletter');
				$this->_enviaEmailVerificacao($users->email);
				echo "codigo gerado para o email: " . $users->email."\n";

			} else {
				echo "codigo já existente para o email: " . $users->email . "\n";
			}
		}

	}

	public function ja_cadastrado($email) {

		if ($this->newsletter->estaSalvo($email)) {
			$this->form_validation->set_message("ja_cadastrado", "O email {$email} já está cadastrado!");
			return FALSE;
		} else {
			return TRUE;
		}

	}

	public function atualizaStatus($codigoVerificacao = NULL){

		$this->load->model('newsletter_model', 'newsletter');

		$result = $this->newsletter->atualizaStatusConta($codigoVerificacao);
		
		if($result) {
			//criar template pra exibir a mensagem;
			$data = array("msg" => "Conta Ativada com Sucesso!",
						  "status" => false); 
		} else {
			$data = array("msg" => "Sua conta já está ativada!",
						  "status" => true);
		}

		$this->load->template('newsletter/confirmacao', $data);

	}

	public function sugereOutrasDatas() {
		$this->load->library('form_validation');
		$this->load->helper('pqr_email');
		$this->load->model("usuarios_model");

		$nome = $this->input->post('nome');
		$email = $this->input->post('email');
		$telefone = $this->input->post('telefone');
		$organizador = $this->input->post('organizador');
		$atividade = $this->input->post('atividade');
		$descricao = $this->input->post('descricao');

		$dados_validos = $this->_validacao();

		$result = array('success' => 'false');

		if ($dados_validos) {

			#Get organizer email#
			$organizer = $this->usuarios_model->buscaUsuario($organizador);

			$dados_email = array(
				'nome' => $nome,
				'email' => $email,
				'telefone' => $telefone,
				'descricao' => $descricao,
				'organizador' => $organizer['nome'],
				'atividade' => $atividade,
			);

			#send emails#
			$this->_sendEmailToOrganizer($organizer['email'], $dados_email);
			$this->_sendEmailToPQR($dados_email);
			$this->_sendEmailToClient($email, $dados_email);

			#configure result
			$result['success'] = 'true';
		} else {
			$msg = "Preencha os campos corretamente!";
			$result['success'] = 'false';
			$result['message'] = $msg;
		}

		echo json_encode($result);
	}

	/*validacao dos campos do formulario*/
	function _validacao() {
		//validar nome para que tenha nome + sobrenome
		$this->form_validation->set_rules('nome', 'Nome', 'trim|required|min_length[5]|max_length[60]|xss_clean');
		$this->form_validation->set_rules('telefone', 'Telefone', 'required');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
		$this->form_validation->set_rules('descricao', 'Descrição', 'required');

		$this->form_validation->set_error_delimiters("<p class='alert alert-danger'>", "</p>");

		return $this->form_validation->run();
	}

	function _sendEmailToPQR($data) {
		$subject = "Praquerumo News";
		$conteudo = $this->load->view('emails/outra_data_pqr', $data, TRUE);
		send_email("contato@praquerumo.com.br", $subject, $conteudo);
	}

	function _sendEmailToClient($email, $data) {
		$subject = "Praquerumo News";
		$conteudo = $this->load->view('emails/outra_data_cliente', $data, TRUE);
		send_email($email, $subject, $conteudo);
	}

	function _sendEmailToOrganizer($email, $data) {
		$subject = "Praquerumo News";
		$conteudo = $this->load->view('emails/outra_data_organizador', $data, TRUE);
		send_email($email, $subject, $conteudo);
	}
}