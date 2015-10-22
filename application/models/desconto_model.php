<?php

class Desconto_model extends CI_Model {

	public function buscarDesconto($cupom, $atividade_codigo) {
		$this->db->select('desconto.codigo, desconto.quantidade, desconto.porcentagem, desconto.usados');
		$this->db->from('desconto');
		$this->db->join("atividade", "atividade.codigo_desconto = desconto.codigo");
		$this->db->where(array("atividade.codigo" => $atividade_codigo, "desconto.quantidade >" => 0));

		return $this->db->get()->result_array();
	}

	public function atualizaCupom($codigo, $quantidade, $usados){
		$quantidade = $quantidade - 1;
		$usados = $usados + 1;
		/*$this->db->set("quantidade",$quantidade);
		$this->db->insert("desconto");*/

		$this->db->where('codigo', $codigo);
		$this->db->update('desconto', $dados = array('quantidade' => $quantidade, 'usados' => $usados));

		return true;
	}
}
