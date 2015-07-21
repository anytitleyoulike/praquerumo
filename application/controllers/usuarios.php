<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Usuarios extends CI_Controller{

	public function cadastro() {
		
		$this->load->model("usuarios_model","usuario");
		$this->form_validation->set_error_delimiters('<div class = "error">', '</div>');
		
		if($this->form_validation->run() == TRUE) {
			
			$usuario = array(
			"nome"     => $this->input->post("nome"),
			"email"    => $this->input->post("email"),
			"telefone" => $this->input->post("telefone"),
			"username" => $this->input->post("username"),
			"senha"    => md5($this->input->post("senha"))
			);

			//checar se usuario já existe
			if($this->usuario->checkUsuario($usuario['email']) == TRUE) {
				$data['msg'] = "Seu endereço de email já existe";
				$this->load->template("usuarios/cadastro", $data);

			} else {
				$this->usuario->salva($usuario);
				// $this->load->template("usuarios/perfil");
			}

		} else {

			$this->load->template("usuarios/cadastro");
		}

			
	}

	public function perfil() {
		$this->load->template("usuarios/perfil");
	}

	public function login() {

		if($this->form_validation->run() == FALSE) {
			$a['erro'] = "n passou validação";
			$this->load->template("login/index", $a);
		} else {
			//buscar usuario no banco
			$usuario = array(
				"email" => $this->input->post('email'),
				"senha" => md5($this->input->post('senha'))
			);
			var_dump($usuario);
			// $this->load->model("usuarios_model", "usuario");
			// $result = $this->usuario->buscarUsuario($usuario);
			

		}
	
	}

	public function teste() {
		$this->form_validation->set_rules('senha', 'Password', 'required');
        $this->form_validation->set_rules('email', 'email', 'required');
			$usuario = array(
				"email" => $this->input->post('email'),
				"senha" => md5($this->input->post('senha'))
			);
			var_dump($usuario);
		if($this->form_validation->run() == TRUE) {
		} else {
			echo "aaaa";
		}
	}

}