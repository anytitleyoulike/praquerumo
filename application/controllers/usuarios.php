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
				$this->load->template("login/index", $data);

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

	public function teste() {

		$this->load->model("usuarios_model", "usuario");

		$result = $this->usuario->getAllUsers();

		foreach ($result as $users) {
			
			if($users->active == "" && empty($users->verification_code)) {

				$codigo = md5(uniqid($users->nome . rand()));
				
				$this->db->set('verification_code', $codigo);
				$this->db->set('active', FALSE);
				$this->db->where('id', $users->id);
				$this->db->update('usuario');
					
			} else {
				echo "entrou no else " . $users->id;
			}
		}

	}

	public function verificaEmail() {
		$this->load->model("usuarios_model", "usuario");

		$this->load->library('email');
		$this->load->helper('pqr_email');

		$teste = $this->usuario->buscaCodigoVerificacao(132);
		
		// $this->email->from('suporte@praquerumo.com', 'Suporte PQR');
		// $this->email->subject('Teste Verificação');
		foreach ($teste as $user) {
			// $this->email->to($user->email);
			// $this->email->message("Caro, usuário este é seu link de confirmação de email ". base_url('/verifica/'.$user->verification_code));
			// $this->email->send();
			
			$subject = "Teste Verificação";
			$content = "Caro, usuário este é seu link de confirmação de email ". base_url('/verifica/'.$user->verification_code);
			send_email($user->email,$subject, $content);
			
		}
		echo $this->email->print_debugger();
		
	}


	public function atualizaStatus($codigoVerificacao = NULL){

		$this->load->model('usuarios_model', 'usuario');

		$result = $this->usuario->atualizaStatusConta($codigoVerificacao);
		
		if($result) {
			//criar template pra exibir a mensagem;
			$data = array("msg" => "Conta Ativada com Sucesso!"); 
		} else {
			$data = array("msg" => "Sua conta já está ativada!");
		}

		echo $data['msg'];

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

	public function logout() {
		$this->session->sess_destroy();
	}
}