<?php
if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Newsletter extends CI_Controller {

	public function novo() {

		$this->load->library("form_validation");
		$this->load->model("newsletter_model");
		$this->form_validation->set_rules('newsletter', 'e-mail', 'trim|required|valid_email|callback_ja_cadastrado');

		$sucesso = $this->form_validation->run();

		if ($sucesso) {
			$email = array('email' => $this->input->post('newsletter'));
			$this->newsletter_model->salvar($email);
			$this->load->template('newsletter/obrigado');

			//$this->session->set_flashdata("success", "Novo Produto Cadastrado com sucesso!");
			//redirect('/');
		} else {
			$this->load->model("eventos_model");
			$eventos = $this->eventos_model->buscarEventos(6);
			$eventos_destaque = $this->eventos_model->buscarEventosDestaque(4);
			$data = array("eventos" => $eventos, "destaques" => $eventos_destaque);

			//redirect(base_url());
			$this->load->template("eventos/index", $data);
		}
	}

	public function ja_cadastrado($email) {

		if ($this->newsletter_model->estaSalvo($email)) {
			$this->form_validation->set_message("ja_cadastrado", "O email {$email} já está cadastrado!");
			return FALSE;
		} else {
			return TRUE;
		}

	}

	public function sugereOutrasDatas() {
		$this->load->library('form_validation');
		$this->load->helper('pqr_email');
		$this->load->model("usuarios_model");

		$nome = $this->input->post('nome');
		$email = $this->input->post('email');
		$telefone = $this->input->post('telefone');
		$organizador = $this->input->post('organizador');
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