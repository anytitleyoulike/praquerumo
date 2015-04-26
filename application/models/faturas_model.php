<?php

class Faturas_model extends CI_Model {

	public function salva($fatura) {
		$this->db->insert('fatura', $fatura);
	}

	public function getEvento($fatura){
		$this->db->select('fatura.evento_codigo');
		$this->db->where('fatura.id', $fatura);
		return $this->db->get("fatura")->row_array();
	}

}