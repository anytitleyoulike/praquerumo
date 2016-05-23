<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class Atividades extends CI_Controller {

	public function index($estado = "") {
		//$this->output->enable_profiler(TRUE);
		$this->load->helper('check_language');
		$this->load->helper('check_state');
		$this->load->helper('fotos');
		$this->load->helper('date');
		$this->load->model("atividades_model");
		$this->load->model("eventos_model");
		$this->load->model("avaliacao_model");


		$lingua = get_language();
		$fotos_destaque = getDestaques();

		if($estado == null || $estado == "") {

			$atividades = $this->atividades_model->buscarAtividades(21, $lingua['id']);

			/*Atividade sem data*/
			$atividadesSemData = $this->atividades_model->buscarAtividadesSemData(21, $lingua['id']);

			foreach ($atividadesSemData as &$atividadeSemDate) {
				$atividadeSemDate['avaliacao'] = $this->avaliacao_model->buscarAvaliacao($atividadeSemDate['codigo']);
				$atividadeSemDate['recomendacao'] = $this->avaliacao_model->buscarRecomendacao($atividadeSemDate['codigo']);
				$atividadeSemDate['eventos'] = $this->eventos_model->buscarDatasEventos(2, $atividadeSemDate['codigo']);
			}
			/*Atividde sem data*/

			$atividades_destaque = $this->atividades_model->buscarDestaque(3, $lingua['id'], $lingua['sufix']);

			foreach ($atividades as &$atividade) {
				$atividade['avaliacao'] = $this->avaliacao_model->buscarAvaliacao($atividade['codigo']);
				$atividade['recomendacao'] = $this->avaliacao_model->buscarRecomendacao($atividade['codigo']);
				$atividade['eventos'] = $this->eventos_model->buscarDatasEventos(2, $atividade['codigo']);
			}
			$estado = "Todos os Estados";
		} else {

			$atividades = $this->atividades_model->buscarAtividadesPorEstado($estado);

			/*Atividade sem data*/
			$atividadesSemData = $this->atividades_model->buscarPorEstadoSemData($estado);

			foreach ($atividadesSemData as &$atividadeSemDate) {
				$atividadeSemDate['avaliacao'] = $this->avaliacao_model->buscarAvaliacao($atividadeSemDate['codigo']);
				$atividadeSemDate['recomendacao'] = $this->avaliacao_model->buscarRecomendacao($atividadeSemDate['codigo']);
				$atividadeSemDate['eventos'] = $this->eventos_model->buscarDatasEventos(2, $atividadeSemDate['codigo']);
			}
			/*Atividde sem data*/

			$atividades_destaque = $this->atividades_model->buscarDestaque(3, $lingua['id'], $lingua['sufix']);

			foreach ($atividades as &$atividade) {
				$atividade['avaliacao'] = $this->avaliacao_model->buscarAvaliacao($atividade['codigo']);
				$atividade['recomendacao'] = $this->avaliacao_model->buscarRecomendacao($atividade['codigo']);
				$atividade['eventos'] = $this->eventos_model->buscarDatasEventos(2, $atividade['codigo']);
			}
			$estado = ucfirst($estado);

		}

		if(date("H:i:s" == "00:00:00")){
			$result = $this->eventos_model->buscaVisivelFim();

			foreach ($result as $tv) {
				if($tv['ultimaData'] < date("Y-m-d 23:59:59")){
					$this->eventos_model->atualizaStatusVendivel($tv['atividade_codigo']);
				}
			}
		}
		$fotos_instagram = $this->_getInstagramPqr();

		$data = array("atividades" => $atividades, 
			"destaques" => $atividades_destaque,
			"fotos_destaque" => $fotos_destaque, 
			"estado" => $estado, 
			"atividadesSemData" => $atividadesSemData,
			"fotos" => $fotos_instagram
		);
		
		$this->load->template("eventos/index", $data);
	}

	public function oldIndex() {
		//$this->output->enable_profiler(TRUE);
		$this->load->helper('check_language');
		$this->load->helper('fotos');
		$this->load->helper('date');
		$this->load->model("atividades_model");
		$this->load->model("eventos_model");
		$this->load->model("avaliacao_model");

		$lingua = get_language();
		$fotos_destaque = getDestaques();

		$atividades = $this->atividades_model->buscarAtividades(21, $lingua['id'], $lingua['sufix']);
		$atividades_destaque = $this->atividades_model->buscarDestaque(4);

		foreach ($atividades as &$atividade) {
			$atividade['avaliacao'] = $this->avaliacao_model->buscarAvaliacao($atividade['codigo']);
			$atividade['recomendacao'] = $this->avaliacao_model->buscarRecomendacao($atividade['codigo']);
			$atividade['eventos'] = $this->eventos_model->buscarDatasEventos(2, $atividade['codigo']);
		}

		$data = array("atividades" => $atividades, "destaques" => $atividades_destaque,
			"fotos_destaque" => $fotos_destaque);

		$this->load->templateHome("eventos/index2", $data);
	}

	private function _getInstagramPqr(){
		
        $pqr_id = 1182491615;
        $access_token = "7311493.269486c.4ec63ff1cf29459883240a0080ecc57e";
        
        $url="https://api.instagram.com/v1/users/".$pqr_id."/media/recent/?access_token=".$access_token."&count=14";

    	$ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        
        $output = curl_exec($ch);
        
        $output = json_decode($output);    

        curl_close($ch);
        $i=0;
 		foreach ($output->data as $image) {
           
 			$data[$i]['link'] = $image->link;
 			$data[$i]['img_src'] = $image->images->thumbnail->url;
 			$data[$i]['descricao'] = $image->caption->text;
        	$i++;
        }

        return $data;
	}

	/*
	 * 	Atividades Recomendadas => Atividades do mesmo elemento
	 *   	{ex: em kaiak(elemento agua) = "rafting, boia cross e etc..."}
	 *	Atividades Relacionadas => Atividades da mesma categoria
	 *		{ex: em kaiak(categoria aventura) = "paraquedismo, mountain bike, rafting e etc..."}
	 *
	 * Obs:: Buscar 4 Ativ. Recomendadas, senao default todos
	 *		Buscar 3 Ativ. Relacionadas, senao default todos
	 */

	public function mostra($id) {
		$this->load->helper('check_language');
		$this->load->model("eventos_model");
		$this->load->model("atividades_model");
		$this->load->model("avaliacao_model");
		$this->load->model("sessao_model");

		$lingua = get_language();
		$atividade = $this->atividades_model->buscarAtividade($id, $lingua['id']);

		if (count($atividade) == 0) {
			show_404();
			break;
		}

		$avaliacao = $this->avaliacao_model->buscarAvaliacao($atividade['codigo']);
		// $acompanhamentos = $this->atividades_model->buscarAcompanhamento($atividade['codigo'], $lingua['sufix']);
		$restricoes = $this->atividades_model->buscarRestricoes($atividade['codigo'], $lingua['sufix']);
		$modalidade = $this->atividades_model->buscarModalidade($atividade['modalidade_id'], $lingua['sufix']);
		$elemento = $this->atividades_model->buscarElemento($atividade['elemento_id'], $lingua['sufix']);
		$categoria = $this->atividades_model->buscarCategoria($atividade['categoria_id'], $lingua['sufix']);
		$organizador = $this->atividades_model->buscarOrganizador($atividade['usuario_id'], $lingua['sufix']);
		$comentarios = $this->avaliacao_model->buscarComentarios($atividade['codigo']);
		$atividades_recomendadas = $this->atividades_model->buscarAtividadesRecomendadas($lingua['id'], $lingua['sufix'],
			$atividade['elemento_id'], $atividade['codigo']);
		$atividades_relacionadas = null;
		$eventos = $this->eventos_model->buscarDatasHorariosEventos(40, $atividade['codigo']);
		$eventosPorDatas = agrupaPorData($eventos);

		// var_dump($atividade);
		// die();
		$data = array('atividade' => $atividade, 'restricoes' => $restricoes,
			'modalidade' => $modalidade, 'elemento' => $elemento, 'categoria' => $categoria, 'organizador' => $organizador,
			'comentarios' => $comentarios, 'sufix' => $lingua['sufix'],
			'atividades_recomendadas' => $atividades_recomendadas, 'atividades_relacionadas' => $atividades_relacionadas,
			'eventos' => $eventosPorDatas, 'avaliacao' => $avaliacao);
		/*codigo para converter titulo em slug amigavel
		echo url_title(convert_accented_characters($evento['titulo']), '-', TRUE);
		 */
		$this->load->template("eventos/detalhes", $data);
	}
}
