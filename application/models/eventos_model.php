<?php

class Eventos_model extends CI_Model {

	/*
	 * Busca evento por codigo do evento
	 * @codigo codigo do evento que deve ser retornado
	 * @return array com evento
	 */
	public function buscarEvento($id, $lingua) {
		$this->db->select("evento.*, descricao_atividade.*, atividade.*,
			COUNT(avaliacao.avaliacao) AS avaliacoes_atividade");

		$this->db->select_avg("avaliacao.avaliacao");
		$this->db->select_avg("avaliacao.recomenda");
		$this->db->from("evento");
		$this->db->join("descricao_atividade", "descricao_atividade.atividade_codigo = evento.atividade_codigo");
		$this->db->join("atividade", "atividade.codigo = evento.atividade_codigo");
		$this->db->join("avaliacao", "avaliacao.atividade_codigo = evento.atividade_codigo");

		$this->db->group_by("evento.codigo");
		$this->db->where("evento.codigo", $id);
		$this->db->or_where("atividade.slug", $id);
		$this->db->where("descricao_atividade.lingua_id", $lingua);

		return $this->db->get()->row_array();
	}

	public function buscarEventoDetalhes($id,$lingua) {
		$this->db->select('evento.codigo, evento.preco, evento.visivel_fim, atividade.fig_thumbnail, descricao_atividade.titulo,
			descricao_atividade.cidade, descricao_atividade.estado, descricao_atividade.ponto_encontro, evento.atividade_codigo');
		$this->db->select('date_format(evento.inicio, "%Y-%m-%d") as data_inicio', false);
		$this->db->select('date_format(evento.inicio, "%T") as hora_inicio', false);
		$this->db->select('date_format(evento.fim, "%T") as hora_fim', false);
		$this->db->from("evento");
		$this->db->join("atividade", "atividade.codigo = evento.atividade_codigo");
		$this->db->join("descricao_atividade", "descricao_atividade.atividade_codigo = evento.atividade_codigo");
		$this->db->where("evento.codigo", $id);
		$this->db->where("descricao_atividade.lingua_id", $lingua);

		return $this->db->get()->row_array();
	}

	public function buscarEventoDetalhesEmail($id) {
		$this->db->select('evento.codigo, evento.preco, evento.visivel_fim, atividade.fig_thumbnail, descricao_atividade.titulo,
			descricao_atividade.cidade, descricao_atividade.estado, descricao_atividade.ponto_encontro, evento.atividade_codigo');
		$this->db->select('date_format(evento.inicio, "%Y-%m-%d") as data_inicio', false);
		$this->db->select('date_format(evento.inicio, "%T") as hora_inicio', false);
		$this->db->select('date_format(evento.fim, "%T") as hora_fim', false);
		$this->db->from("evento");
		$this->db->join("atividade", "atividade.codigo = evento.atividade_codigo");
		$this->db->join("descricao_atividade", "descricao_atividade.atividade_codigo = evento.atividade_codigo");
		$this->db->where("evento.codigo", $id);

		return $this->db->get()->row_array();
	}

	/*
	 * Busca eventos que estão disponiveis para atividade
	 * Obs: Eventos que vao para a tab de agendamento

	 * @codigoAtividade codigo da atividade dos eventos que devem ser retornados
	 * @return array com eventos
	 */
	public function buscarEventosDisponiveis($lingua, $sufix, $codigoAtividade) {
		$this->db->select("evento.*, descricao_atividade.titulo, descricao_atividade.apresentacao,
			descricao_atividade.cidade, descricao_atividade.estado,
			COUNT(avaliacao.avaliacao) AS avaliacoes_atividade,
			atividade.slug,
			esporte.nome" . $sufix . " as esporte");

		$this->db->select_avg("avaliacao.avaliacao");
		$this->db->select_avg("avaliacao.recomenda");
		$this->db->from("evento");
		$this->db->join("atividade", "atividade.codigo = evento.atividade_codigo");
		$this->db->join("esporte", "esporte.id = atividade.esporte_id");
		$this->db->join("descricao_atividade", "descricao_atividade.atividade_codigo = evento.atividade_codigo");
		$this->db->join("avaliacao", "avaliacao.atividade_codigo = evento.atividade_codigo");

		$this->db->group_by("evento.codigo");
		$this->db->where("evento.disponivel", true);
		$this->db->where("descricao_atividade.atividade_codigo !=", $codigoAtividade);
		$this->db->where("descricao_atividade.lingua_id", $lingua);
		//colocar where para datas a partir do dia atual
		//$this->db->order_by("evento.data","desc");
		return $this->db->get()->result_array();
	}

	public function buscarDatasEventos($limite, $codigoAtividade) {
		$this->db->select('evento.codigo, evento.preco,
		 evento.disponivel');
		$this->db->select('date_format(evento.inicio, "%Y-%m-%d") as data_inicio', false);
		$this->db->select_sum('evento.disponivel', 'totalDisponivel');
		$this->db->group_by("data_inicio");
		$this->db->where("evento.atividade_codigo", $codigoAtividade);
		$this->db->where("evento.visivel_inicio <= NOW()");
		$this->db->where("evento.visivel_fim >= NOW()");
		$this->db->order_by("evento.inicio");
		$this->db->limit($limite);
		return $this->db->get("evento")->result_array();
	}

	public function buscarDatasHorariosEventos($limite, $codigoAtividade) {
		$this->db->select('evento.codigo, evento.preco,
		 evento.disponivel');
		$this->db->select('date_format(evento.inicio, "%Y-%m-%d") as data_inicio', false);
		$this->db->select('date_format(evento.inicio, "%T") as hora_inicio', false);
		$this->db->select('date_format(evento.fim, "%T") as hora_fim', false);
		$this->db->where("evento.atividade_codigo", $codigoAtividade);
		$this->db->where("evento.visivel_inicio <= NOW()");
		$this->db->where("evento.visivel_fim >= NOW()");
		$this->db->order_by("evento.inicio");
		$this->db->limit($limite);
		return $this->db->get("evento")->result_array();
	}

	public function buscaVagasDisponiveis($codigo) {
		$this->db->select('evento.disponivel');
		$this->db->where('codigo', $codigo);
		return $this->db->get("evento")->row_array();
	}

	public function buscaVisivelFim(){
		$this->db->select("evento.atividade_codigo");
		$this->db->select_max("evento.visivel_fim" , "ultimaData");
		$this->db->group_by("evento.atividade_codigo");
		return $this->db->get("evento")->result_array();
	}

	public function buscaMaxVagasDisponiveis($codigo) {
		$this->db->select_sum('evento.disponivel');
		$this->db->select_max('evento.visivel_fim');
		$this->db->where('codigo', $codigo);
		return $this->db->get("evento")->row_array();
	}

	public function atualizaVagasDisponiveis($codigo, $dados) {
		$this->db->where('codigo', $codigo);
		$this->db->update('evento', $dados);

		return true;
	}

	public function atualizaStatusVendivel($atividade_codigo) {
		$this->db->where('codigo', $atividade_codigo);
		$this->db->update('atividade', $dados = array('vendivel' => 0));

		return true;
	}

	public function estadosComAtividades(){
		$this->db->select('estados');
		$this->db->from('descricao_atividade');
		$this->db->group_by('estado');

		return $this->db->get()->result_array();
	}
}