<?php

class Usuarios_model extends CI_Model {

	public function salva($usuario) {
		$this->db->insert('usuario', $usuario);
		if($this->db->affected_rows() > 0) {
			return TRUE;	
		} else {
			return FALSE;
		}
	}

	public function atualizaDados($usuario) {
		$this->db->update('usuario',$usuario);
		$this->db->where('email', $usuario['email']);

		if($this->db->affected_rows() > 0) {
			return TRUE;	
		} else {
			return FALSE;
		}
	}

	public function buscaUsuarioId($email) {
		$this->db->select("usuario.id");
		$this->db->where("email", $email);

		return $this->db->get('usuario')->row_array();
	}

	public function buscaUsuario($id) {
		$this->db->select("*");
		$this->db->where("id", $id);

		return $this->db->get('usuario')->row_array();
	}

	public function buscarUsuario($usuario) {
		$this->db->select('*');
		$this->db->from('usuario');
		$this->db->where('email', $usuario['email']);
		$this->db->where('senha', $usuario['senha']);
		$this->db->limit(1);

		$query = $this->db->get();
		
		if($query->num_rows == 0) {
			return FALSE;
		}
		return $query;

	}

	public function checkEmailExistente($email) {
		$this->db->select('*');
		$this->db->from('usuario');
		$this->db->where('email', $email);
		$this->db->limit(1);
	
		$result = $this->db->get();
		
		if($result->num_rows() == 0) {
			return FALSE;
		} else {
			return TRUE;
		}
	}
}