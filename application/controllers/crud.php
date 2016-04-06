<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Crud extends CI_Controller {

	private $cidades = array(
		'Acre' => 'Acre',
		'Alagoas' => 'Alagoas',
		'Amapá' => 'Amapá',
		'Amazonas' => 'Amazonas',
		'Bahia' => 'Bahia',
		'Ceará' => 'Ceará',
		'Distrito Federal' => 'Distrito Federal',
		'Espírito Santo' => 'Espírito Santo',
		'Goiás' => 'Goiás',
		'Maranhão' => 'Maranhão',
		'Mato Grosso' => 'Mato Grosso',
		'Mato Grosso do Sul' => 'Mato Grosso do Sul',
		'Minas Gerais' => 'Minas Gerais',
		'Pará' => 'Pará',
		'Paraíba' => 'Paraíba',
		'Paraná' => 'Paraná',
		'Pernambuco' => 'Pernambuco',
		'Piauí' => 'Piauí',
		'Rio de Janeiro' => 'Rio de Janeiro',
		'Rio Grande do Norte' => 'Rio Grande do Norte',
		'Rio Grande do Sul' => 'Rio Grande do Sul',
		'Rondônia' => 'Rondônia',
		'Roraima' => 'Roraima',
		'Santa Catarina' => 'Santa Catarina',
		'São Paulo' => 'São Paulo',
		'Sergipe' => 'Sergipe',
		'Tocantins' => 'Tocantins',
	);

	private $niveis = array('0' => '0',
		'1' => '1',
		'2' => '2',
		'3' => '3',
		'4' => '4',
		'5' => '5',
	);

	public function index() {
		$this->atividade();
	}

	public function atividade() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();

		$this->load->config('grocery_crud');
		$this->config->set_item('grocery_crud_file_upload_allow_file_types',
			'gif|jpeg|jpg|png');
		$crud->set_table('atividade')
		     ->set_subject('Atividade');

		$crud->display_as('usuario_id', 'Organizador')
		     ->display_as('modalidade_id', 'Modalidade')
		     ->display_as('categoria_id', 'Categoria')
		     ->display_as('elemento_id', 'Elemento')
		     ->display_as('codigo_desconto', 'Cupom de Desconto')
		     ->display_as('comissao', 'Comissão (%)')
		     ->display_as('fig_01', 'Figura 1 (760x400)px')
		     ->display_as('fig_02', 'Figura 2 (760x400)px')
		     ->display_as('fig_03', 'Figura 3 (760x400)px')
		     ->display_as('fig_04', 'Figura 4 (760x400)px')
		     ->display_as('fig_destaque', 'Figura de Destaque (1900x1070)px')
		     ->display_as('fig_thumbnail', 'Figura de Thumbnail (300x170)px')
		     ->display_as('latitude', 'Latitude(decimal)')
		     ->display_as('longitude', 'Longitude(decimal)')
		     ->display_as('dt_criacao', 'Data de criação')
		     ->display_as('dt_atualizacao', 'Data de atualização');

		$crud->columns('slug', 'usuario_id', 'modalidade_id', 'categoria_id',
			'elemento_id', 'comissao', 'fig_thumbnail', 'dt_atualizacao', 'dt_criacao', 'cuidados', 'dicas', 'acompanhamento');

		//campos no add de uma atividade
		$crud->add_fields('slug', 'usuario_id', 'modalidade_id', 'categoria_id', 'codigo_desconto',
			'elemento_id', 'vendivel', 'disponivel', 'destaque', 'comissao', 'latitude', 'longitude',
			'fig_destaque', 'fig_thumbnail', 'fig_01', 'fig_02', 'fig_03', 'fig_04','dt_criacao', 'dt_atualizacao');

		//campos no edit de uma atividade
		$crud->edit_fields('slug', 'usuario_id', 'modalidade_id', 'categoria_id', 'codigo_desconto',
			'elemento_id', 'vendivel', 'disponivel', 'destaque', 'comissao', 'latitude', 'longitude',
			'fig_destaque', 'fig_thumbnail', 'fig_01', 'fig_02', 'fig_03', 'fig_04',
			'acompanhamento', 'cuidados', 'dicas', 'dt_atualizacao');

		$crud->set_relation('usuario_id', 'usuario', 'nome');
		$crud->set_relation('modalidade_id', 'modalidade', 'nome_pt');
		$crud->set_relation('categoria_id', 'categoria', 'nome_pt');
		$crud->set_relation('elemento_id', 'elemento', 'nome_pt');
		$crud->set_relation('codigo_desconto', 'desconto', 'cupom');
		//$crud->set_relation_n_n('acompanhamento', 'acompanhamentos', 'itens', 'atividade_codigo', 'itens_id', 'nome_pt', '');
		//$crud->set_relation_n_n('cuidados', 'restricoes', 'cuidados', 'atividade_codigo', 'cuidados_id', 'nome_pt', '');
		//$crud->set_relation_n_n('dicas', 'dicas', 'informacoes', 'atividade_codigo', 'informacoes_id', 'nome_pt', '');
		$crud->set_field_upload('fig_01', 'assets/images/atividades/detalhes');
		$crud->set_field_upload('fig_02', 'assets/images/atividades/detalhes');
		$crud->set_field_upload('fig_03', 'assets/images/atividades/detalhes');
		$crud->set_field_upload('fig_04', 'assets/images/atividades/detalhes');
		$crud->set_field_upload('fig_destaque', 'assets/images/atividades/destaques');
		$crud->set_field_upload('fig_thumbnail', 'assets/images/atividades/thumbnails');

		$crud->required_fields('usuario_id', "modalidade_id", "categoria_id",
			"elemento_id", "comissao", "slug", "vendivel", "disponivel", "destaque",
			"fig_01", "fig_thumbnail");

		//manipulation
		$crud->unique_fields('slug');
		$crud->unset_delete();

		//callbacks
		$crud->callback_add_field('dt_criacao', function () {
			return date('Y-m-d H:i:s');
		});
		$crud->callback_add_field('dt_atualizacao', function () {
			return date('Y-m-d H:i:s');
		});
		$crud->callback_before_insert(array($this, '_before_insert_atividade'));
		$crud->callback_before_update(array($this, '_before_update_atividade'));
		$crud->callback_after_upload(array($this, '_resize_after_upload'));

		//read_only
		$state = $crud->getState();

		if ($state == "edit") {
			$crud->field_type('dt_atualizacao', 'readonly');
		}

		//render the form
		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	function _resize_after_upload($uploader_response, $field_info, $files_to_upload) {
		$this->load->library('image_moo');

		//to more than one path, per file uploaded
		if ($field_info->upload_path == 'assets/images/atividades/detalhes') {
			$width = 760;
			$height = 400;
		} elseif ($field_info->upload_path == 'assets/images/atividades/destaques') {
			$width = 1900;
			$height = 1070;
		} else {
			$width = 300;
			$height = 170;
		}

		$file_uploaded = $field_info->upload_path . '/' . $uploader_response[0]->name;
		$this->image_moo->load($file_uploaded)->resize($width, $height)->save($file_uploaded, true);

		return true;
	}

	function _before_insert_atividade($post_array) {
		$this->load->helper('url');

		$slug = $post_array['slug'];
		$formatted_slug = url_title(convert_accented_characters($slug), '-', TRUE);
		$post_array['slug'] = $formatted_slug;

		$post_array['dt_criacao'] = date('Y-m-d H:i:s');
		$post_array['dt_atualizacao'] = date('Y-m-d H:i:s');

		return $post_array;
	}

	function _before_update_atividade($post_array, $primary_key) {
		$post_array['dt_atualizacao'] = date('Y-m-d H:i:s');

		return $post_array;
	}

	public function usuario() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();

		$this->load->config('grocery_crud');
		$this->config->set_item('grocery_crud_file_upload_allow_file_types',
			'gif|jpeg|jpg|png');

		$crud->set_table('usuario')
		     ->set_subject('Usuário');
		$crud->display_as('email', 'E-mail')
		     ->display_as('username', 'Username')
		     ->display_as('senha', 'Senha')
		     ->display_as('cliente', 'Cliente')
		     ->display_as('organizador', 'Organizador')
		     ->display_as('revendedor', 'Revendedor')
		     ->display_as('nome', 'Nome')
		     ->display_as('sobrenome', 'Sobrenome')
		     ->display_as('nome_empresa', 'Empresa(p/ organizadores)')
		     ->display_as('telefone', 'Telefone')
		     ->display_as('cidade', 'Cidade')
		     ->display_as('estado', 'Estado')
		     ->display_as('pais', 'País')
		     ->display_as('cpf', 'CPF')
		     ->display_as('cnpj', 'CNPJ')
		     ->display_as('sobre_pt', 'Sobre (português)')
		     ->display_as('sobre_en', 'Sobre (inglês)')
		     ->display_as('resumo_pt', 'Resumo (português)')
		     ->display_as('resumo_en', 'Resumo (inglês)')
		     ->display_as('dt_atualizacao', 'Última atualização')
		     ->display_as('dt_criacao', 'Data de criação')
		     ->display_as('score', 'Score')
		     ->display_as('sexo', 'Sexo')
		     ->display_as('foto', 'Foto');

		$crud->columns('nome', 'sobrenome', 'email', 'username', 'nome_empresa', 'cliente', 'organizador', 'revendedor',
			'foto', 'dt_criacao', 'dt_atualizacao');

		$crud->add_fields('nome', 'sobrenome', 'nome_empresa', 'username', 'email', 'senha', 'sexo', 'cliente', 'organizador',
			'revendedor', 'telefone', 'cidade', 'estado', 'pais', 'cpf', 'cnpj', 'resumo_pt', 'resumo_en',
			'sobre_pt', 'sobre_en', 'foto', 'dt_criacao', 'dt_atualizacao');
		$crud->edit_fields('nome', 'sobrenome', 'nome_empresa', 'username', 'email', 'senha', 'sexo', 'cliente', 'organizador',
			'revendedor', 'telefone', 'cidade', 'estado', 'pais', 'cpf', 'cnpj', 'resumo_pt', 'resumo_en',
			'sobre_pt', 'sobre_en', 'foto', 'dt_atualizacao');

		$crud->set_field_upload('foto', 'assets/images/usuarios');
		$crud->required_fields('email', 'senha', 'cliente', 'organizador', 'revendedor');

		//manipulation
		$crud->unique_fields('username', 'email');
		//$crud->unset_delete();

		//callbacks
		$crud->callback_add_field('dt_criacao', function () {
			return date('Y-m-d H:i:s');
		});
		$crud->callback_add_field('dt_atualizacao', function () {
			return date('Y-m-d H:i:s');
		});

		$crud->callback_before_insert(array($this, '_before_insert_atividade'));
		$crud->callback_before_update(array($this, '_before_update_atividade'));
		$crud->callback_after_upload(array($this, '_resize_after_upload_usuario'));
		//read_only
		$state = $crud->getState();

		if ($state == "edit") {
			$crud->field_type('dt_atualizacao', 'readonly');
		}

		//render the form
		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	function _resize_after_upload_usuario($uploader_response, $field_info, $files_to_upload) {
		$this->load->library('image_moo');

		//Is only one file uploaded so it ok to use it with $uploader_response[0].
		$file_uploaded = $field_info->upload_path . '/' . $uploader_response[0]->name;
		$this->image_moo->load($file_uploaded)->resize(60, 60)->save($file_uploaded, true);

		return true;
	}

	public function getNiveis() {
		return $niveis = array('0' => '0',
			'1' => '1',
			'2' => '2',
			'3' => '3',
			'4' => '4',
			'5' => '5',
		);
	}

	public function descricaoAtividade() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();

		$crud->set_table('descricao_atividade')
		     ->set_subject('Descrição');
		$crud->display_as('lingua_id', 'Língua')
		     ->display_as('atividade_codigo', 'Atividade')
		     ->display_as('titulo', 'Título')
		     ->display_as('apresentacao', 'Apresentação')
		     ->display_as('esforco_fisico', 'Esforço Físico')
		     ->display_as('conforto', 'Conforto')
		     ->display_as('dificuldade_tecnica', 'Dificuldade Técnica')
		     ->display_as('descricao', 'Descrição')
		     ->display_as('duracao', 'Duração')
		     ->display_as('cidade', 'Cidade')
		     ->display_as('estado', 'Estado')
		     ->display_as('ponto_encontro', 'Ponto de Encontro')
		     ->display_as('roteiro', 'Roteiro')
		     ->display_as('dicas', 'Dicas')
		     ->display_as('acompanhamentos', 'Acompanhamentos')
		     ->display_as('cuidados', 'Cuidados')
		     ->display_as('termo_consentimento', 'Termo de Consentimento');

		$crud->columns('lingua_id', 'titulo', 'ponto_encontro', 'apresentacao');

		$crud->add_fields('lingua_id', 'atividade_codigo', 'titulo', 'esforco_fisico', 'conforto', 'dificuldade_tecnica',
			'cidade', 'estado', 'duracao', 'ponto_encontro', 'como_chegar', 'apresentacao', 'descricao', 'roteiro', 'termo_consentimento');
		
		$crud->edit_fields('lingua_id', 'atividade_codigo', 'titulo', 'esforco_fisico', 'conforto', 'dificuldade_tecnica',
			'cidade', 'estado', 'duracao', 'ponto_encontro', 'como_chegar', 'apresentacao', 'descricao', 'roteiro', 
			'dicas','acompanhamentos', 'cuidados','termo_consentimento');

		//manipulation
		//$crud->unset_delete();
		//

		//callbacks
		$crud->callback_add_field('esforco_fisico', function () {
			$niveis = array('0' => '0',
				'1' => '1',
				'2' => '2',
				'3' => '3',
				'4' => '4',
				'5' => '5',
			);
			return form_dropdown('esforco_fisico', $niveis, '3');
		});
		$crud->callback_edit_field('esforco_fisico', function ($value, $primary_key) {
			$niveis = array('0' => '0',
				'1' => '1',
				'2' => '2',
				'3' => '3',
				'4' => '4',
				'5' => '5',
			);
			return form_dropdown('esforco_fisico', $niveis, $value);
		});
		$crud->callback_add_field('conforto', function () {
			$niveis = array('0' => '0',
				'1' => '1',
				'2' => '2',
				'3' => '3',
				'4' => '4',
				'5' => '5',
			);
			return form_dropdown('conforto', $niveis, '3');
		});
		$crud->callback_edit_field('conforto', function ($value, $primary_key) {
			$niveis = array('0' => '0',
				'1' => '1',
				'2' => '2',
				'3' => '3',
				'4' => '4',
				'5' => '5',
			);
			return form_dropdown('conforto', $niveis, $value);
		});
		$crud->callback_add_field('dificuldade_tecnica', function () {
			$niveis = array('0' => '0',
				'1' => '1',
				'2' => '2',
				'3' => '3',
				'4' => '4',
				'5' => '5',
			);
			return form_dropdown('dificuldade_tecnica', $niveis, '3');
		});
		$crud->callback_edit_field('dificuldade_tecnica', function ($value, $primary_key) {
			$niveis = array('0' => '0',
				'1' => '1',
				'2' => '2',
				'3' => '3',
				'4' => '4',
				'5' => '5',
			);
			return form_dropdown('dificuldade_tecnica', $niveis, $value);
		});
		$crud->callback_add_field('estado', function () {
			$cidades = array(
				'Acre' => 'Acre',
				'Alagoas' => 'Alagoas',
				'Amapá' => 'Amapá',
				'Amazonas' => 'Amazonas',
				'Bahia' => 'Bahia',
				'Ceará' => 'Ceará',
				'Distrito Federal' => 'Distrito Federal',
				'Espírito Santo' => 'Espírito Santo',
				'Goiás' => 'Goiás',
				'Maranhão' => 'Maranhão',
				'Mato Grosso' => 'Mato Grosso',
				'Mato Grosso do Sul' => 'Mato Grosso do Sul',
				'Minas Gerais' => 'Minas Gerais',
				'Pará' => 'Pará',
				'Paraíba' => 'Paraíba',
				'Paraná' => 'Paraná',
				'Pernambuco' => 'Pernambuco',
				'Piauí' => 'Piauí',
				'Rio de Janeiro' => 'Rio de Janeiro',
				'Rio Grande do Norte' => 'Rio Grande do Norte',
				'Rio Grande do Sul' => 'Rio Grande do Sul',
				'Rondônia' => 'Rondônia',
				'Roraima' => 'Roraima',
				'Santa Catarina' => 'Santa Catarina',
				'São Paulo' => 'São Paulo',
				'Sergipe' => 'Sergipe',
				'Tocantins' => 'Tocantins',
			);
			return form_dropdown('estado', $cidades, 'Amazonas');
		});
		$crud->callback_edit_field('estado', function ($value, $primary_key) {
			$cidades = array(
				'Acre' => 'Acre',
				'Alagoas' => 'Alagoas',
				'Amapá' => 'Amapá',
				'Amazonas' => 'Amazonas',
				'Bahia' => 'Bahia',
				'Ceará' => 'Ceará',
				'Distrito Federal' => 'Distrito Federal',
				'Espírito Santo' => 'Espírito Santo',
				'Goiás' => 'Goiás',
				'Maranhão' => 'Maranhão',
				'Mato Grosso' => 'Mato Grosso',
				'Mato Grosso do Sul' => 'Mato Grosso do Sul',
				'Minas Gerais' => 'Minas Gerais',
				'Pará' => 'Pará',
				'Paraíba' => 'Paraíba',
				'Paraná' => 'Paraná',
				'Pernambuco' => 'Pernambuco',
				'Piauí' => 'Piauí',
				'Rio de Janeiro' => 'Rio de Janeiro',
				'Rio Grande do Norte' => 'Rio Grande do Norte',
				'Rio Grande do Sul' => 'Rio Grande do Sul',
				'Rondônia' => 'Rondônia',
				'Roraima' => 'Roraima',
				'Santa Catarina' => 'Santa Catarina',
				'São Paulo' => 'São Paulo',
				'Sergipe' => 'Sergipe',
				'Tocantins' => 'Tocantins',
			);
			return form_dropdown('estado', $cidades, $value);
		});

		$crud->required_fields('lingua_id', 'atividade_codigo', 'titulo', 'apresentacao', 'duracao', 'esforco_fisico',
			'conforto', 'dificuldade_tecnica', 'descricao', 'cidade', 'estado', 'ponto_encontro');

		$crud->set_relation('lingua_id', 'lingua', 'lingua');
		$crud->set_relation('atividade_codigo', 'atividade', 'slug');
		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	public function evento() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();
		$crud->set_table('evento')
		     ->set_subject('Evento');
		//$crud->set_theme('datatables');
		$crud->display_as('atividade_codigo', 'Atividade')
		     ->display_as('inicio', 'Data Início')
		     ->display_as('fim', 'Data Fim')
		     ->display_as('visivel_inicio', 'Visível Inicio')
		     ->display_as('visivel_fim', 'Visível Fim')
		     ->display_as('preco', 'Preço')
		     ->display_as('maximo', 'Máx.')
		     ->display_as('minimo', 'Min.')
		     ->display_as('disponivel', 'Disponível (normalmente, o mesmo "Máx.")');
		$crud->columns('atividade_codigo', 'inicio', 'visivel_inicio', 'visivel_fim',
			'preco', 'disponivel');
		$crud->required_fields('atividade_codigo', 'inicio', 'fim', 'preco', 'disponivel',
			'visivel_inicio', 'visivel_fim');

		//manipulation
		//$crud->unset_delete();

		$crud->set_relation('atividade_codigo', 'atividade', 'slug');
		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	public function elemento() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();
		$crud->set_table('elemento')
		     ->set_subject('Elemento');

		//manipulation
		$crud->unset_delete();

		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	public function modalidade() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();
		$crud->set_table('modalidade')
		     ->set_subject('Modalidade');
		$crud->display_as('nome_pt', 'Modalidade (português)')
		     ->display_as('nome_en', 'Modalidade (inglês)');
		$crud->required_fields('nome_pt', 'nome_en');
		//manipulation
		$crud->unset_delete();

		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	public function categoria() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();
		$crud->set_table('categoria')
		     ->set_subject('Categoria');
		//manipulation
		$crud->unset_delete();

		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	public function lingua() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();
		$crud->set_table('lingua')
		     ->set_subject('Lingua');
		//manipulation
		$crud->unset_delete();

		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	public function avaliacaoAtividade() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();
		$crud->set_table('avaliacao_atividade')
		     ->set_subject('Avaliação da Atividade');
		$crud->set_relation('atividade_codigo', 'atividade', 'slug');
		$crud->set_relation('usuario_id', 'usuario', 'nome');
		$crud->display_as('usuario_id', 'Usuário')
		     ->display_as('atividade_codigo', 'Atividade')
		     ->display_as('nota', 'Nota')
		     ->display_as('recomenda', 'Recomenda?');
		$crud->required_fields('usuario_id', 'atividade_codigo', 'nota',
			'recomenda');
		//manipulation
		//$crud->unset_delete();

		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	public function comentarioAtividade() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();
		$crud->set_table('comentario_atividade')
		     ->set_subject('Comentário da Atividade');
		$crud->set_relation('atividade_codigo', 'atividade', 'slug');
		$crud->set_relation('usuario_id', 'usuario', 'nome');
		$crud->display_as('usuario_id', 'Usuário')
		     ->display_as('atividade_codigo', 'Atividade')
		     ->display_as('comentario', 'Comentário')
		     ->display_as('data', 'Data');
		$crud->required_fields('usuario_id', 'atividade_codigo', 'comentario',
			'data');
		//manipulation
		//$crud->unset_delete();

		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	public function acompanhamento() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();
		$crud->set_table('itens')
		     ->set_subject('Acompanhamento');
		$crud->display_as('nome_pt', 'Acompanhamento (português)')
		     ->display_as('nome_en', 'Acompanhamento (inglês)');
		$crud->required_fields('nome_pt', 'nome_en');
		//manipulation
		$crud->unset_delete();

		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	public function dica() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();
		$crud->set_table('informacoes')
		     ->set_subject('Dica');
		$crud->display_as('nome_pt', 'Dica (português)')
		     ->display_as('nome_en', 'Dica (inglês)');
		$crud->required_fields('nome_pt', 'nome_en');
		//manipulation
		$crud->unset_delete();

		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	public function cuidado() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();
		$crud->set_table('cuidados')
		     ->set_subject('Cuidado');
		$crud->display_as('nome_pt', 'Cuidado (português)')
		     ->display_as('nome_en', 'Cuidado (inglês)');
		$crud->required_fields('nome_pt', 'nome_en');
		//manipulation
		$crud->unset_delete();

		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}

	public function desconto() {
		$this->load->library('grocery_CRUD');
		$crud = new grocery_CRUD();
		$crud->set_table('desconto');
		$crud->display_as('cupom', 'Cupom')
			->display_as('quantidade', 'Quantidade')
			->display_as('porcentagem', 'porcentagem');
		$crud->add_fields('cupom', 'quantidade', 'porcentagem');
		$crud->required_fields('cupom', 'quantidade', 'porcentagem');
		//manipulation
		//$crud->unset_delete();
		$output = $crud->render();
		$this->load->view('eventos/crud_template', $output);
	}
}