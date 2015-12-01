<?php
if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Newsletter extends CI_Controller {

	public function novo() {

		$this->load->model("newsletter_model",'newsletter');
		$this->form_validation->set_rules('newsletter', 'e-mail', 'trim|required|valid_email|callback_ja_cadastrado');

		$sucesso = $this->form_validation->run();
		
		if ($sucesso) {
			$this->db->trans_begin();
			$email = $this->input->post('newsletter');
			
			$dados = array(
				'email' 			 => $email,
				'codigo_verificacao' => md5(uniqid($email . rand())),
				'ativo'              => false
			);
			
			$this->newsletter->salvar($dados);

			if($this->_enviaEmailVerificacao($email)) {
				$data = array(
					"success" => true,
					"msg"     => "Obrigado por se cadastrar! Aguarde nosso email de confirmação"
				);
				$this->db->trans_commit();
			} else {
				//caso o email não seja enviado, o insert é desfeito.
				$this->db->trans_rollback();
				$data = array(
					"success" => false,
					"msg"     => "Houve um problema com envio do email. Tente novamente"
				);
			}
			

			echo json_encode($data);

		} else {
			$data = array(
				"success" => false,
				"msg"     => "Email incorreto ou já cadastrado"
			);
		 echo json_encode($data);
		}
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

				$this->load->template('newsletter/obrigado_ebook');

			} else {
				$this->load->view("newsletter/adicionar_email");	
			}
		} else {
			$this->load->view("newsletter/adicionar_email");
		}
	}

	public function _enviaEmailVerificacao($email) {

		$this->load->model("newsletter_model",'newsletter');
		$this->load->library('email');
		$this->load->helper("pqr_email");
		
		$user = $this->newsletter->buscaEmail($email);
		$data['link'] = base_url('/verifica/'.$user->codigo_verificacao);
		
		$content = $this->load->view("emails/confirmacaoNewsletter", $data, TRUE);
		$subject = "Confirmação de Email";
		
		return sendgrid_newsletter($email,$subject,$content);
		
	}

	public function disparaEmail() {
		$this->db->where("ativo", 0);
		$query = $this->db->get('newsletter')->result();

		foreach ($query as $users) {
			$result = $this->_enviaEmailVerificacao($users->email);
			if($result > 0) {
				print_r("email enviado para: " . $users->email."\n");
			} else {
				print_r("falha no envio: " . $users->email."\n");
			}
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
				// $this->_enviaEmailVerificacao($users->email);
				print_r("codigo gerado para o email: " . $users->email."\n");

			} else {
				print("codigo já existente para o email: " . $users->email . "\n");
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