<?php

class Desconto_model extends CI_Model {

	public function buscarDesconto($cupom, $atividade_codigo) {
		$this->db->select('desconto.codigo, desconto.quantidade, desconto.porcentagem, desconto.usados');
		$this->db->from('desconto');
		$this->db->join("atividade", "atividade.codigo_desconto = desconto.codigo");
		$this->db->where(array("atividade.codigo" => $atividade_codigo, "desconto.quantidade >" => 0, "desconto.cupom" => $cupom));

		return $this->db->get()->row_array();
	}

	public function atualizaCupom($codigo, $quantidade, $usados){
		$quantidade = $quantidade - 1;
		$usados = $usados + 1;

		$this->db->where('codigo', $codigo);
		$this->db->update('desconto', $dados = array('quantidade' => $quantidade, 'usados' => $usados));

		return true;
	}
}
