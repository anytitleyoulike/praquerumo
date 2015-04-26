<?php

class Avaliacao_model extends CI_Model {

	public function buscarAvaliacao($atividade) {
		$this->db->select("COUNT(avaliacao_atividade.nota) AS avaliacoes_atividade");
		$this->db->select_avg("avaliacao_atividade.nota");
		$this->db->select_avg("avaliacao_atividade.recomenda");
		$this->db->from("avaliacao_atividade");
		$this->db->where("avaliacao_atividade.atividade_codigo", $atividade);

		return $this->db->get()->row_array();
	}

	public function buscarRecomendacao($atividade) {
		$this->db->select("COUNT(avaliacao_atividade.recomenda) AS quantidade");
		$this->db->from("avaliacao_atividade");
		$this->db->where("avaliacao_atividade.recomenda", true);

		return $this->db->get()->row_array();
	}

	public function buscarComentarios($atividade) {
		$this->db->select("comentario_atividade.comentario,
			usuario.nome, usuario.cidade, usuario.estado");
		
		$this->db->from("comentario_atividade");
		$this->db->join("usuario", "usuario.id = comentario_atividade.usuario_id");
		$this->db->where("comentario_atividade.atividade_codigo", $atividade);

		return $this->db->get()->result_array();
	}
}
