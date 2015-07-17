<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Usuarios extends CI_Controller{

	public function cadastro() {
		$usuario = array(
			"nome" => $this->input->post("nome"),
			"email" => $this->input->post("email"),
			"senha" => md5($this->input->post("senha"))
		);

		
		if($this->form_validation->run() == TRUE) {
			
			$this->load->model("usuarios_model");
			$this->usuarios_model->salva($usuario);
		}
		$this->load->view("usuarios/cadastro");
			
	}

	public function login() {

		if($this->form_validation->run() == FALSE) {

			$this->load->template("usuarios/login");
		}

		
	}


}