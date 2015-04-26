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

}