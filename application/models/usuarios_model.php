<?php

class Usuarios_model extends CI_Model {


	public $nome;
	public $email;
	public $telefone;

	public function salva($usuario) {
		$this->db->insert('usuario', $usuario);
		if($this->db->affected_rows() > 0) {
			return TRUE;	
		} else {
			return FALSE;
		}
	}

	public function atualizaDados($userId, $usuario) {
		$this->db->where('id', $userId);
		$this->db->update('usuario',$usuario);
		//pesquisar update string

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

	public function buscaDadosPerfil($userId) {
		$this->db->select("*");
		$this->db->from('usuario');
		$this->db->where("id", $userId);

		return $this->db->get()->row_array();
	}

	public function buscarUsuario($usuario) {
		$this->db->select('*');
		$this->db->from('usuario');
		$this->db->where('email', $usuario['email']);
		$this->db->where('senha', $usuario['senha']);
		$this->db->limit(1);

		$query = $this->db->get();
		
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