<?php

class Newsletter_model extends CI_Model {

	public function salvar($email) {
		$this->db->insert("newsletter", $email);
	}

	public function estaSalvo($email) {
		$this->db->where("email",$email);
		$query = $this->db->get("newsletter");
		
		if ($query->num_rows() > 0) {
			return true;
		}
		else {
			return false;
		}
	}

	public function buscaEmail($email) {
		$this->db->where("email", $email);
		$result = $this->db->get('newsletter');
		
		if($result->num_rows() > 0) {
			return $result->row();
		}
	}


	public function atualizaStatusConta($codigoVerificacao) {
		$this->db->set('ativo', TRUE);
		$this->db->where('codigo_verificacao',$codigoVerificacao);
		$this->db->update('newsletter');

		if($this->db->affected_rows() > 0) {
			return true;
		} else{
			return false;
		}
	}

	public function getAllUsers() {
		return $this->db->get('newsletter')->result();
	}
}