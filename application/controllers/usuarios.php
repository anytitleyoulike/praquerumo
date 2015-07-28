<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Usuarios extends CI_Controller{

	public function cadastro() {
		
		$this->load->model("usuarios_model","usuario");

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
							
				$userSession = array(
					"id"        => $this->db->insert_id(),
					"email"     => $usuario['email'],
					"logged_in" => TRUE
				);

				$this->session->set_userdata($userSession);

				redirect("/");

				//criar verificação de email usando md5(unidid(rand()));
			}

		} else {

			$this->load->template("usuarios/cadastro");
		}

			
	}


	//Olhar o trello e ver os proximos passos
	public function perfil() {
		$userId = $this->session->userdata('id');

		$this->load->model('usuarios_model','usuario');
		
		$usuario = $this->usuario->buscaDadosPerfil($userId);
		
		$this->load->template("usuarios/perfil", $usuario);
	}

	public function update() {
		$userId = $this->session->userdata('id');
		$this->load->model('usuarios_model','usuario');
		
		$this->usuario->nome = $this->input->post('nome');
		$this->usuario->telefone = $this->input->post('telefone');
		$this->usuario->email = $this->input->post('email');

		// $usuario = array(
		// 	"nome"          => $this->input->post('nome'),
		// 	"email"         => $this->input->post('email'),
		// 	"telefone"      => $this->input->post('telefone')
		// 	// "dtAniversario" => $this->input->post('dtAniversario')
		// );

		$usuario = $this->usuario->atualizaDados($userId, $this->usuario);
		if($usuario) {
			redirect("/usuarios/perfil");
		} else {
			echo "Falhou";
		}
	}

	public function teste () {
		var_dump($this->session->userdata('email'));
		
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
				$this->session->set_userdata($sessaoData);				
				
				redirect("/");

			} else {
				// login e email errados
				$this->load->template("login/index");
			}
		}

	}

	public function logout() {
		$this->session->sess_destroy();
	}

}