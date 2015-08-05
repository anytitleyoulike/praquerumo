<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Usuarios extends CI_Controller{

	public function cadastro() {

		$this->load->model("usuarios_model","usuario");
		$this->form_validation->set_error_delimiters("<p class='alert alert-danger'>", "</p>");
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

			$this->load->template("login/index");
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
		$this->usuario->username = $this->input->post('username');


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
			echo "falhou";
		}
	}

	public function teste () {
		var_dump($this->session->userdata('email'));
		
	}

	public function logout() {
		$this->session->sess_destroy();
	}

}