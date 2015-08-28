<?php

class Usuarios_model extends CI_Model {

	public function salva($usuario) {
		$this->db->insert('usuario', $usuario);
	}

	public function buscaUsuarioId($email) {
		$this->db->select("usuario.id");
		$this->db->where("email", $email);

		return $this->db->get('usuario')->row_array();
	}

	public function buscaUsuario($id) {
		$this->db->select("usuario.nome, usuario.email, usuario.telefone");
		$this->db->where("id", $id);

		return $this->db->get('usuario')->row_array();
	}

	public function getAllUsers() {
		return $this->db->get('usuario')->result();
	}

	public function buscaCodigoVerificacao($id) {
		$this->db->select("usuario.nome, usuario.email, usuario.telefone, usuario.verification_code");
		$this->db->where("id", $id);

		return $this->db->get('usuario')->result();
	}

	public function atualizaStatusConta($codigoVerificacao) {
		$this->db->set('active', TRUE);
		$this->db->where('verification_code',$codigoVerificacao);
		$this->db->update('usuario');

		if($this->db->affected_rows() > 0) {
			return true;
		} else{
			return false;
		}
	}
}