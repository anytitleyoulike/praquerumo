<?php

class Status_model extends CI_Model {

	public function getStatusId($status){
		$this->db->select("status.id");
		$this->db->where("nome", $status);

		return $this->db->get('status')->row_array();
	}

}