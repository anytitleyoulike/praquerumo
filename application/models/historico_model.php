<?php

class Historico_model extends CI_Model {

	public function salva($fatura) {
		$this->db->where('fatura_id', $fatura['fatura_id']);
		$q = $this->db->get('historico');

		if ($q->num_rows() > 0) {
			// $this->db->where('fatura_id', $fatura['fatura_id']);
			// $this->db->update('historico', $fatura);
		} else {
			//$this->db->set('fatura_id', $fatura['fatura_id']);
			$this->db->insert('historico', $fatura);
		}
	}

}