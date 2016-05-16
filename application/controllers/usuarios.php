<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Usuarios extends CI_Controller{

	public function novo() {
		$usuario = array(
			"nome" => $this->input->post("nome"),
			"email" => $this->input->post("email"),
			"senha" => md5($this->input->post("senha"))
		);

		$this->load->model("usuarios_model");
		$this->usuarios_model->salva($usuario);
		$this->load->view("usuarios/novo");
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
}
