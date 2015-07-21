<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller{

	public function index() {
		$this->load->view("login/index");
	}
	
	public function autenticar() {
		//$this->output->enable_profiler(TRUE);
		
		$this->load->model("usuarios_model");
				
		$email = $this->input->post("email");
		$senha = md5($this->input->post("senha"));
		$usuario = $this->usuarios_model->buscaPorEmailESenha($email,$senha);
		
		if ($usuario) {
			$this->session->set_userdata("usuario_logado", $usuario);			
			$this->session->set_flashdata("success", "Logado com sucesso");
		}
		else {
			$this->session->set_flashdata("danger", "Usuário ou senha inválido(a)");
		}
		
		redirect('/');
	}
	
	public function logout() {
		$this->session->unset_userdata("usuario_logado");
		$this->session->set_flashdata("success", "Deslogado com sucesso");
		redirect('/');
	}

	public function teste() {

		
		// $this->form_validation->set_rules('senha', 'Password', 'required');
  //       $this->form_validation->set_rules('email', 'email', 'required|valid_email');
			$usuario = array(
				"email" => $this->input->post('email'),
				"senha" => md5($this->input->post('senha'))
			);

		if($this->form_validation->run() == TRUE) {
		} else {
			$this->load->template("login/index");
		}
	}
}