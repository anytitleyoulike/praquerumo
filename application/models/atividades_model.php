<?php

class Atividades_model extends CI_Model {

	/*
	 * Busca atividades para pagina principal
	 * @limite limite de eventos que o método deve retornar
	 * @lingua idioma das informaçoes
	 * @sufix sufixo do idioma
	 * @return array com eventos
	 */
	public function buscarAtividades($limite, $lingua, $sufix) {
		$this->db->select("atividade.codigo, atividade.disponivel,
			atividade.vendivel, atividade.fig_01, atividade.fig_02,
			atividade.fig_03, atividade.fig_04, atividade.fig_destaque,
			atividade.fig_thumbnail, descricao_atividade.titulo,
			descricao_atividade.apresentacao,
			descricao_atividade.cidade, descricao_atividade.estado,
			COUNT(evento.codigo) AS eventos, evento.inicio,
			atividade.slug,
			modalidade.nome" . $sufix . " as modalidade");
		
		$this->db->select_min('evento.preco');
		$this->db->from("atividade");
		$this->db->join("modalidade", "modalidade.id = atividade.modalidade_id");
		$this->db->join("evento", "evento.atividade_codigo = atividade.codigo");
		$this->db->join("descricao_atividade", "descricao_atividade.atividade_codigo = atividade.codigo");

		$this->db->group_by("atividade.codigo");
		$this->db->where("descricao_atividade.lingua_id", $lingua);
		$this->db->where("atividade.disponivel", true);
		//colocar where para datas a partir do dia atual
		$this->db->order_by("evento.inicio");
		$this->db->limit($limite);

		return $this->db->get()->result_array();
	}

	/*
	 * Busca atividades que estão em destaque, e vão aparecer como destaque na home page(caso apenas para a copa)
	 * @limite limite de eventos que o método deve retornar
	 * @return array com eventos
	 */
	public function buscarDestaque($limite, $lingua, $sufix) {
		$this->db->select("atividade.fig_destaque, descricao_atividade.cidade,
			evento.preco, evento.inicio, modalidade.nome" . $sufix . " as modalidade");
		$this->db->select_min('evento.preco');
		$this->db->from("atividade");
		$this->db->join("descricao_atividade", "descricao_atividade.atividade_codigo = atividade.codigo");
		$this->db->join("modalidade", "modalidade.id = atividade.modalidade_id");
		$this->db->join("evento", "evento.atividade_codigo = atividade.codigo");

		$this->db->group_by("atividade.codigo");
		$this->db->where("destaque", true);
		$this->db->where("descricao_atividade.lingua_id", $lingua);
		$this->db->order_by("evento.inicio");
		$this->db->limit($limite);
		return $this->db->get()->result_array();
	}

	/*
	 * Busca atividade por codigo da atividade
	 * @codigo codigo da atividade que deve ser retornado
	 * @return array com evento
	 */
	public function buscarAtividade($id, $lingua) {
		$this->db->select("atividade.codigo, atividade.slug, atividade.vendivel, atividade.disponivel,
			atividade.latitude, atividade.longitude, atividade.fig_01, atividade.fig_02, atividade.fig_03,
			atividade.fig_04, atividade.categoria_id, atividade.elemento_id, atividade.modalidade_id,
			atividade.usuario_id,
			,descricao_atividade.lingua_id, descricao_atividade.atividade_codigo, descricao_atividade.como_chegar, descricao_atividade.titulo,
			descricao_atividade.apresentacao, descricao_atividade.esforco_fisico, descricao_atividade.conforto,
			descricao_atividade.dificuldade_tecnica, descricao_atividade.descricao, descricao_atividade.cidade,
			descricao_atividade.estado, descricao_atividade.ponto_encontro, descricao_atividade.duracao,
			descricao_atividade.roteiro, descricao_atividade.termo_consentimento");
		$this->db->select_min('evento.preco');
		$this->db->from("atividade");
		$this->db->join("descricao_atividade", "descricao_atividade.atividade_codigo = atividade.codigo");
		$this->db->join("evento", "evento.atividade_codigo = atividade.codigo");
		$this->db->group_by("atividade.codigo");
		$this->db->where("atividade.slug", $id);
		$this->db->or_where("atividade.codigo", $id);
		$this->db->where("descricao_atividade.lingua_id", $lingua);

		return $this->db->get()->row_array();
	}

/*
 * Busca atividades que estão relacionadas( )
 * Obs: Eventos que vao para a tab de agendamento

 * @codigoAtividade codigo da atividade dos eventos que devem ser retornados
 * @return array com eventos
 */
	public function buscarAtividadesRecomendadas($lingua, $sufix, $elemento, $atividade_codigo) {
		$this->db->select("atividade.*, descricao_atividade.titulo, descricao_atividade.apresentacao,
			descricao_atividade.cidade, descricao_atividade.estado,
			COUNT(avaliacao_atividade.nota) AS avaliacoes_atividade,
			atividade.slug,
			modalidade.nome" . $sufix . " as modalidade");

		$this->db->select_avg("avaliacao_atividade.nota");
		$this->db->select_avg("avaliacao_atividade.recomenda");
		$this->db->from("atividade");
		$this->db->join("modalidade", "modalidade.id = atividade.modalidade_id");
		$this->db->join("descricao_atividade", "descricao_atividade.atividade_codigo = atividade.codigo");
		$this->db->join("avaliacao_atividade", "avaliacao_atividade.atividade_codigo = atividade.codigo");

		$this->db->group_by("atividade.codigo");
		$this->db->where("atividade.disponivel", true);
		$this->db->where("atividade.codigo !=", $atividade_codigo);
		$this->db->where("atividade.elemento_id", $elemento);
		$this->db->where("descricao_atividade.lingua_id", $lingua);
		//colocar where para datas a partir do dia atual
		//$this->db->order_by("evento.data","desc");
		return $this->db->get()->result_array();
	}

	public function buscarAcompanhamento($codigo, $sufix) {
		$this->db->select("itens.nome" . $sufix);
		$this->db->from("acompanhamentos");
		$this->db->join("atividade", "acompanhamentos.atividade_codigo = atividade.codigo");
		$this->db->join("itens", "itens.id = acompanhamentos.itens_id");
		$this->db->where("acompanhamentos.atividade_codigo", $codigo);
		return $this->db->get()->result_array();
	}

	public function buscarRestricoes($codigo, $sufix) {
		$this->db->select("cuidados.nome" . $sufix);
		$this->db->from("restricoes");
		$this->db->join("atividade", "restricoes.atividade_codigo = atividade.codigo");
		$this->db->join("cuidados", "cuidados.id = restricoes.cuidados_id");
		$this->db->where("restricoes.atividade_codigo", $codigo);
		return $this->db->get()->result_array();
	}

	public function buscarDicas($codigo, $sufix) {
		$this->db->select("informacoes.nome" . $sufix);
		$this->db->from("dicas");
		$this->db->join("atividade", "dicas.atividade_codigo = atividade.codigo");
		$this->db->join("informacoes", "informacoes.id = dicas.informacoes_id");
		$this->db->where("dicas.atividade_codigo", $codigo);
		return $this->db->get()->result_array();
	}

	public function buscarPalavrasChave($codigo) {
		//not implemented
	}

	public function buscarModalidade($esporteId, $sufix) {
		$this->db->select("modalidade.nome" . $sufix);
		$this->db->from("modalidade");
		$this->db->join("atividade", "modalidade.id = atividade.modalidade_id");
		$this->db->where("modalidade.id", $esporteId);
		return $this->db->get()->row_array();
	}

	public function buscarElemento($elementoId, $sufix) {
		$this->db->select("elemento.nome" . $sufix);
		$this->db->from("elemento");
		$this->db->join("atividade", "elemento.id = atividade.elemento_id");
		$this->db->where("elemento.id", $elementoId);
		return $this->db->get()->row_array();
	}

	public function buscarCategoria($categoriaId, $sufix) {
		$this->db->select("categoria.nome" . $sufix);
		$this->db->from("categoria");
		$this->db->join("atividade", "categoria.id = atividade.categoria_id");
		$this->db->where("categoria.id", $categoriaId);
		return $this->db->get()->row_array();
	}

	public function buscarOrganizador($organizadorId, $sufix) {
		$this->db->select("usuario.id,usuario.nome, usuario.foto,usuario.resumo" . $sufix);
		$this->db->from("usuario");
		$this->db->join("atividade", "usuario.id = atividade.usuario_id");
		$this->db->where("usuario.id", $organizadorId);
		return $this->db->get()->row_array();
	}
}