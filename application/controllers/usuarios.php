<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Usuarios extends CI_Controller{

	public function cadastro() {
		
		$this->load->model("usuarios_model","usuario");
		$this->form_validation->set_error_delimiters('<div class = "error">', '</div>');
		
		if($this->form_validation->run('cadastro') == TRUE) {
			
			$usuario = array(
			"nome"     => $this->input->post("nome"),
			"email"    => $this->input->post("email"),
			"telefone" => $this->input->post("telefone"),
			"username" => $this->input->post("username"),
			"senha"    => md5($this->input->post("senha"))
			);
			
			//checar se usuario já existe
			if($this->usuario->checkEmailExistente($usuario['email']) == TRUE) {
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


	//Olhar o trello e ver os proximos passos
	public function perfil() {
		$this->load->template("usuarios/perfil");
	}

	public function login() {
		$this->load->model("usuarios_model","usuario");

		if($this->form_validation->run('login') == FALSE) {
			$this->load->template("login/index");
		} else {
			
			$usuario = array(
				"email" => $this->input->post('email'),
				"senha" => md5($this->input->post('senha'))
			);
			
			//verifica login e senha do usuário
			$result = $this->usuario->buscarUsuario($usuario);
			
			if($result->num_rows() > 0) {
				
				$usuario = $result->row_array();
				
				$sessaoData = array(
					"id"    => $usuario['id'],
					"email" => $usuario['email'],
					"logged_in" => TRUE
				);
				$this->session->set_userdata($usuario);				
				
				redirect("/");

			} else {
				// login e email errados
				$this->load->template("login/index");
			}
		}
	}

}