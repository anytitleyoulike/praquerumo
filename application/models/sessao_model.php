<?php

class Sessao_model extends CI_Model {

	
	/*
	* Busca sessoes de determinado evento
	* @codigo codigo do evento
	* @return array com sessoes do evento determinado
	*/
	public function buscarSessoes($codigoEvento) {
		$this->db->select("sessao.codigo, sessao.horario, sessao.nro_maximo, sessao.nro_minimo, sessao.nro_disponivel");
		$this->db->from("sessao");
		$this->db->where("sessao.evento_codigo", $codigoEvento);
		return $this->db->get()->result_array();
	}
}