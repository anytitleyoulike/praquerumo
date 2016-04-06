  	<title>PRAQUERUMO - <?=$modalidade["nome{$sufix}"] . " | " . $atividade['titulo']?></title>
  	<?php $tirar  = array('<p>', '</p>');?>
	<meta  name="description" content='<?=character_limiter(str_replace($tirar, '', $atividade["apresentacao"]), 150)?>'>
	<meta property="og:url" content="<?=base_url('atividades/'.$atividade['slug'])?>" />
	<meta property="og:title" content="<?=$atividade['titulo']?>" />

	<meta property="og:image" content="<?=base_url('assets/images/atividades/detalhes/'.$atividade['fig_01'])?>" />
	<meta property="fb:app_id" content="762715127184684" />

	<link rel="canonical" href="<?=base_url('atividades/'.$atividade['slug'])?>" />
	<link rel="stylesheet" href="<?=base_url("assets/css/jslider.css")?>" type="text/css">
	<link rel="stylesheet" href="<?=base_url("assets/css/jslider.round-blue.css")?>" type="text/css">
	<link href="<?=base_url("assets/css/evento-box.css")?>" rel="stylesheet" media="screen">
	<link href="<?=base_url("assets/css/details.css")?>" rel="stylesheet" media="screen">

	<script type="text/javascript" src="<?=base_url("assets/js/jshashtable-2.1_src.js")?>"></script>
	<script type="text/javascript" src="<?=base_url("assets/js/jquery.numberformatter-1.2.3.js")?>"></script>
	<script type="text/javascript" src="<?=base_url("assets/js/tmpl.js")?>"></script>
	<script type="text/javascript" src="<?=base_url("assets/js/jquery.dependClass-0.1.js")?>"></script>
	<script type="text/javascript" src="<?=base_url("assets/js/draggable-0.1.js")?>"></script>
	<script type="text/javascript" src="<?=base_url("assets/js/jquery.slider.js")?>"></script>
	<?php require_once("analytics-tracker.php"); ?>
	<!-- script gplus -->
	<script src="https://apis.google.com/js/platform.js" async defer>
	  {lang: 'pt-BR'}
	</script>
	<style type="text/css">
	.carousel-box{
		width: 760px;
		height: 535px;
		margin-left: -15px;
	}
	.carousel-box img{
		width: 760px;
		height: 100%;
	}
	.modal-box{
		margin-top: 20px;
	}

	</style>

  </head>
  <body id="top" class="thebg" >
<?=$nav_bar?>
  	<!-- script facebook social plugin -->
	  	<div id="fb-root"></div>
			<script>(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) return;
				js = d.createElement(s); js.id = id;
				js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.5&appId=762715127184684";
				fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			</script>

	<!-- Organizador -->
<?php
$data = array(
	'organizador-codigo' => $atividade['usuario_id'],
);
echo form_hidden($data);

?>

	<!-- CONTENT -->
	<div class="container">
		<div class="container pagecontainer offset-0">

			<!-- SLIDER -->
			<div class="col-md-8 details-slider">
				<div id="c-carousel">
					<div id="wrapper">
						<div id="inner">
							<div id="caroufredsel_wrapper2">
								<div id="carousel">

									<?php if($atividade['fig_01'] != ''){ ?>
									<img src="<?=base_url("assets/images/atividades/detalhes/{$atividade['fig_01']}")?>" alt=""/>
									<?php } ?>
									<?php if($atividade['fig_02'] != ''){ ?>
									<img src="<?=base_url("assets/images/atividades/detalhes/{$atividade['fig_02']}")?>" alt=""/>
									<?php } ?>
									<?php if($atividade['fig_03'] != ''){ ?>
									<img src="<?=base_url("assets/images/atividades/detalhes/{$atividade['fig_03']}")?>" alt=""/>
									<?php } ?>
									<?php if($atividade['fig_04'] != ''){ ?>
									<img src="<?=base_url("assets/images/atividades/detalhes/{$atividade['fig_04']}")?>" alt=""/>
									<?php } ?>
								</div>
							</div>
							<div id="pager-wrapper">
								<div id="pager">
									<?php if($atividade['fig_01'] != ''){ ?>
										<img src="<?=base_url("assets/images/atividades/detalhes/{$atividade['fig_01']}")?>" width="120" height="68" alt=""/>
									<?php } ?>
									<?php if($atividade['fig_02'] != ''){ ?>
										<img src="<?=base_url("assets/images/atividades/detalhes/{$atividade['fig_02']}")?>" width="120" height="68" alt=""/>
									<?php } ?>
									<?php if($atividade['fig_03'] != ''){ ?>
										<img src="<?=base_url("assets/images/atividades/detalhes/{$atividade['fig_03']}")?>" width="120" height="68" alt=""/>
									<?php } ?>
									<?php if($atividade['fig_04'] != ''){ ?>
										<img src="<?=base_url("assets/images/atividades/detalhes/{$atividade['fig_04']}")?>" width="120" height="68" alt=""/>
									<?php } ?>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<button id="prev_btn2" class="prev2"><img src="<?=base_url("assets/images/spacer.png")?>" alt=""/></button>
						<button id="next_btn2" class="next2"><img src="<?=base_url("assets/images/spacer.png")?>" alt=""/></button>

					</div>-->
 				</div> /c-carousel -->


			</div>
			<!-- END OF SLIDER -->

			<!-- RIGHT INFO -->
			<div class="col-md-4 detailsright offset-0">
				<div class="hpadding20">
					<h2 class="opensans slim green2"><?=$atividade['titulo']?></h2>
<?php $rating = round($avaliacao['nota'])?>
					<img src="<?=base_url("assets/images/bigrating-{$rating}.png")?>" alt=""/>
					<h4 class="grey" style="font-family:'Hammersmith One', sans-serif;"><?=$atividade["cidade"] . "/" . $atividade["estado"]?></h4>
					<div class="social-networks">
							<!-- facebook social button-->
							<div class="bt-face fb-like" data-href="<?=base_url('atividades/'.$atividade['slug'])?>"
								data-layout="button_count" data-action="like"
								data-show-faces="false" data-share="true">
							</div>
							<!-- gplus social button-->
							<div class="bt-gplus g-plusone" href="<?=base_url('atividades/'.$atividade['slug'])?>"
								data-size="medium" expandTo="right">
							</div>
							<!-- twitter social button-->
							<div class="bt-twitter">
								<a href="https://twitter.com/share" class="twitter-share-button" data-ref="<?=base_url('atividades/'.$atividade['slug'])?>"
								  data-url="<?=base_url('atividades/'.$atividade['slug'])?>" data-lang="en"></a>
	    						<script>!function(d,s,id){
	    							var js,fjs=d.getElementsByTagName(s)[0];
		    							if(!d.getElementById(id)){
		    								js=d.createElement(s);
		    								js.id=id;
		    								js.src="https://platform.twitter.com/widgets.js";
		    								fjs.parentNode.insertBefore(js,fjs);
		    							}
	    							}(document,"script","twitter-wjs");
	    						</script>
							</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="line3 margtop20"></div>

				<div class="col-md-6 bordertype1 padding20">
					<span class="opensans size30 bold grey2"><?=numeroEmReais($atividade['preco'])?></span>
				</div>

				<div class="col-md-6 bordertype2 padding20">
<?php $recomendacao = round($avaliacao['recomenda'] * 100)?>
					<span class="opensans size30 bold grey2"><?=$recomendacao?>%</span><br/>
<?=lang("details_dos_usuarios")?><br/> <?=lang("details_recomendam")?>
				</div>

				<!--
				<div class="col-md-6 bordertype3">
					<img src="<?=base_url("assets/images/user-rating-{$rating}.png")?>" alt=""/><br/>
<?=$atividade['avaliacoes_atividade']?> reviews
				</div>
				<div class="col-md-6 bordertype3">
					<a href="#" class="grey">+Add review</a>
				</div>
				-->
				<div class="clearfix"></div>

				<div class="hpadding20">
					<span id="box-datas"><a href="#" id="ancora-datas" class="add2fav margtop30" data-toggle="modal" data-target="#outrasDatas"> Fale Conosco</a></span>
					<a id="agendarAgora" href="#" class="booknow margtop20 btnmarg"><?=lang("details_agendar")?></a>
				</div>

				<!-- Inicio do modal de interesse -->
				<!-- Modal -->
					<div class="modal fade" id="outrasDatas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
					        <h4 class="modal-title" id="myModalLabel">Interesse em outra data</h4>
					      </div>
					      <div class="modal-body">
					      	<div class="input-group modal-box modal-email">
							  <span class="input-group-addon"><span class="glyphicon glyphicon-bookmark"></span></span>
							  <input id="tips-atividade" type="text" class="form-control" value = "<?=$atividade['titulo']?>" disabled>
							</div>
					      	<div class="input-group modal-box modal-email">
							  <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							  <input id="tips-nome" type="text" class="form-control" placeholder="nome">
							</div>
					        <div class="input-group modal-box modal-email">
							  <span class="input-group-addon">@</span>
							  <input id="tips-email" type="text" class="form-control" placeholder="email">
							</div>
							<div class="input-group modal-box modal-tel">
							  <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
							  <input id="tips-telefone" type="text" class="form-control" placeholder="telefone para contato">
							</div>
							<div class="input-group modal-box modal-comment">
							  <span class="input-group-addon"><span class="glyphicon glyphicon-comment"></span></span>
							  <textarea id="tips-descricao" class="form-control" placeholder="descreva qual data ou condição especial..."></textarea>
							</div>
							<div id="error" class="input-group modal-box modal-comment">
							  <span id="tips-error" class="red"></span>
							</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
					        <button id="tips-Enviar" type="button" class="btn btn-primary" data-loading-text="Enviando..."
					         data-complete-text="Pronto!" >Enviar</button>
					      </div>
					    </div>
					  </div>
					</div>
				<!-- Fim do modal de interesse -->
			</div>
			<!-- END OF RIGHT INFO -->
		</div>
		<!-- END OF container-->

		<div class="container mt25 offset-0">

			<div class="col-md-8 pagecontainer2 offset-0">
				<div class="cstyle10"></div>

				<ul class="nav nav-tabs" id="myTab">
					<li onclick="mySelectUpdate()" class="active"><a data-toggle="tab" href="#summary">
						<span class="summary"></span><span class="hidetext"><?=lang("details_menu_informacoes")?></span>&nbsp;</a></li>
					<li onclick="mySelectUpdate()" class=""><a data-toggle="tab" href="#agendamento">
						<span class="rates"></span><span class="hidetext"><?=lang("details_menu_agendamento")?></span>&nbsp;</a></li>
					<!--<li onclick="mySelectUpdate()" class=""><a data-toggle="tab" href="#preferences"><span class="preferences"></span><span class="hidetext">Preferências</span>&nbsp;</a></li>-->
					<li onclick="loadScript()" class=""><a data-toggle="tab" href="#maps">
						<span class="maps"></span><span class="hidetext"><?=lang("details_menu_mapa")?></span>&nbsp;</a></li>
					<!--<li onclick="mySelectUpdate(); trigerJslider(); trigerJslider2(); trigerJslider3(); trigerJslider4(); trigerJslider5(); trigerJslider6();" class=""><a data-toggle="tab" href="#reviews"><span class="reviews"></span><span class="hidetext">Avaliações</span>&nbsp;</a></li>-->
					<li onclick="mySelectUpdate()" class=""><a data-toggle="tab" href="#thingstodo"><span class="thingstodo"></span><span class="hidetext"><?=lang("details_recomendados")?></span>&nbsp;</a></li>
					<li onclick="mySelectUpdate()" class="">
						<a data-toggle="tab" href="#comentarios">
							<span class="reviews"></span>
							<span class="fb-comments-count" data-href="<?=base_url('atividades/'.$atividade['slug'])?>"></span>
							<span class="hidetext"><?=lang("details_comentarios")?></span>
						</a>
					</li>
				</ul>

				<div class="tab-content4" >


					<!-- TAB 1 -->

					<div id="summary" class="tab-pane fade active in">
						<div class="hpadding20">
<?=$atividade['apresentacao']?>
</div>

						<!-- Collapse 1 -->
						<div class="line4"></div>
						<button type="button" class="collapsebtn2" data-toggle="collapse" data-target="#collapse1">
<?=lang("details_item_descricao")?><span class="collapsearrow"></span>
						</button>

						<div id="collapse1" class="collapse in">
							<div class="hpadding20">
								<div class="col-md-12">
<?=$atividade['descricao']?>
</div>
							</div>
							<div class="clearfix"></div>
						</div>

						<!-- End of collapse 1 -->

<?php if (trim($atividade['roteiro']) != "") {?>
<!-- Collapse 2 -->
							<div class="line4"></div>
							<button type="button" class="collapsebtn2" data-toggle="collapse" data-target="#collapse2">
<?=lang("details_item_roteiro")?><span class="collapsearrow"></span>
							</button>

							<div id="collapse2" class="collapse in">
								<div class="hpadding20">
									<div class="col-md-12">
<?=$atividade['roteiro']?>
</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<!-- End of collapse 2 -->


<?php }?>

<?php 
	if (isset($atividade['dicas']) && $atividade['dicas'] != ''){ 
		
?>
<!-- Collapse 3 -->
							<div class="line4"></div>
							<button type="button" class="collapsebtn2 collapsed" data-toggle="collapse" data-target="#collapse3">
<?=lang("details_item_dicas")?><span class="collapsearrow"></span>
							</button>

							<div id="collapse3" class="collapse in">
								<div class="hpadding20">
									<div class="col-md-12">
										<!-- <ul class="checklist"> -->
										<?=$atividade['dicas']?>
										<!-- </ul> -->
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
<?php 
	}
?>
<!-- End of collapse 3 -->
<!-- End of collapse 3 -->

<?php 
	if (isset($atividade['acompanhamentos']) && $atividade['acompanhamentos'] != ''){ 
	
?>
<!-- Collapse 6 -->
							<div class="line4"></div>
							<button type="button" class="collapsebtn2" data-toggle="collapse" data-target="#collapse6">
<?=lang("details_item_itens_inclusos")?><span class="collapsearrow"></span>
							</button>

								<div id="collapse6" class="collapse in">
									<div class="hpadding20">
										<div class="col-md-12">	
											<?=$atividade['acompanhamentos'];?>
										</div>
									<div class="clearfix"></div>
									</div>
								</div>
<?php 
	}
?>
<!-- End of collapse 6 -->

<!-- Begin of collapse 7 -->
<?php
	if (isset($atividade['cuidados']) && $atividade['cuidados'] != ''){

?>
<div class="line4"></div>
							<button type="button" class="collapsebtn2" data-toggle="collapse" data-target="#collapse7">
<?=lang("details_item_cuidados_restricoes")?><span class="collapsearrow"></span>
							</button>

								<div id="collapse7" class="collapse in">
									<div class="hpadding20">
										<div class="col-md-12">
											<?=$atividade['cuidados']?>
										</div>
									<div class="clearfix"></div>
									</div>
								</div>
<?php 
	}
?>
<!-- End of collapse 7 -->

						<div class="line4"></div>

						<!-- Collapse 4 -->
						<button type="button" class="collapsebtn2 collapsed" data-toggle="collapse" data-target="#collapse4">
<?=lang("details_item_duracao")?><span class="collapsearrow"></span>
						</button>

						<div id="collapse4" class="collapse in">
							<div class="hpadding20">
								<div class="col-md-12">
<?=$atividade['duracao']?>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="line4"></div>
						<!-- End of collapse 4 -->

						<!-- Collapse 5  -->
						<button type="button" onclick='activaTab("maps");loadScript()' class="collapsebtn2 collapsed" data-toggle="collapse" data-target="#collapse5">
						  <span id="ponto_de_encontro"><?=lang("details_item_ponto_encontro")?><span class="collapsearrow"></span>
						</button>

						<div id="collapse5" class="collapse in">
							<div class="hpadding20">
								<div class="col-md-12">
<?=$atividade["ponto_encontro"]?>
								</div>
								<br />
								<a class="green" onclick="loadScript();activaTab('maps');">
									Clique para ver o mapa.
								</a>
							</div>
							<div class="clearfix"></div>
						</div>
						<!-- End of collapse 5 -->
<?php 
	if(!is_null($atividade['como_chegar'])){
?>
						<!-- Collapse 6 -->
						<div class="line4"></div>
						<button type="button" class="collapsebtn2" data-toggle="collapse" data-target="#collapse6">
Como Chegar<span class="collapsearrow"></span>
						</button>

						<div id="collapse6" class="collapse in">
							<div class="hpadding20">
								<div class="col-md-12">
<?=$atividade['como_chegar']?>
</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<!-- End of Collapse 6 -->
<?php 
	}
?>
					</div>


					<!-- TAB 2 -->

					<div id="agendamento" class="tab-pane fade">
					<!--
					    <div class="hpadding20">
							<div class="col-md-4 offset-0">
								<div class="w50percent">
									<div class="wh90percent textleft">
										<span class="opensans size13"><b>Data Inicio</b></span>
										<input type="text" class="form-control mySelectCalendar" id="datepicker" placeholder="mm/dd/yyyy"/>
									</div>
								</div>
								<div class="w50percentlast">
									<div class="wh90percent textleft right">
										<span class="opensans size13"><b>Data Término</b></span>
										<input type="text" class="form-control mySelectCalendar" id="datepicker2" placeholder="mm/dd/yyyy"/>
									</div>
								</div>
							</div>
							<div class="col-md-8 offset-0">

								<div class="col-md-4 center offset-0">
									<button class="updatebtn caps center margtop20">Pesquisar</button>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<br/>
					-->
						<p class="hpadding20 dark bold"><?=lang("details_titulo_eventos")?></p>

<?php
if (!empty($eventos)) {
	foreach ($eventos as $data => $horarios) {?>

								<div class="line2"></div>
								<div class="padding20">
									<?php
										$cont = 0;
										foreach ($horarios as $key => $value) {
											$cont = $cont + $value['disponivel'];
										}
										if($cont != 0){
									?>
										<div class="col-md-4 offset-0">
											<time datetime="<?=$data?>" class="calendar-icon calendar-large
												 calendar-green">
												  <em><?=lang("evento_disponivel")?></em>
												  <strong><?=getMonthNameData($data)?></strong>
												  <span><?=getDayData($data)?></span>
											</time>
										</div>
									<?php 
										}else{
									?>
									<div class="col-md-4 offset-0">
											<time datetime="<?=$data?>" class="calendar-icon calendar-large
												 calendar-red">
												  <em><?=lang("evento_indisponivel")?></em>
												  <strong><?=getMonthNameData($data)?></strong>
												  <span><?=getDayData($data)?></span>
											</time>
										</div>
									<?php
										}
									?>
									<div class="col-md-8 offset-0">
										<table class="table">
												<thead>
													<tr class="bold">
														<td>Horário</td>
														<td>Preço</td>
														<td>Quantidade</td>
													</tr>
												</thead>
												<tbody>
<?php foreach ($horarios as $horario) {
		echo "<tr>";
		echo form_open("agendamento/novo");
		$dados_agenda = array(
			'evento' => $horario['codigo'],
			'quantidade' => '1',
			'valor_unit' => $horario['preco'],
		);
		echo form_hidden($dados_agenda);

		echo "<td>" . substr($horario['inicio'], 0, 5) . " - " . substr($horario['fim'], 0, 5) .
		"</td>";

		echo '<td id="agenda_' . $horario['codigo'] . '" name="valor_total">' . numeroEmReais($horario['preco']) . "</td>";

		/*opcao default de vagas lotadas*/
		if ($horario['disponivel'] > 0) {
			for ($i = 1; $i <= $horario['disponivel']; $i++) {
				$opcoes[$i] = $i;
			}
			$item = 1;
		} else {
			$opcoes[0] = 0;
			$item = 0;
		}

		echo "<td class='agenda-quantidade'>" . form_dropdown(
			'vagas',
			$opcoes,
			$item,
			'class="form-control agenda"'
		) . "</td>";
		if ($item != 0) {
			echo "<td>" .
			form_button(array(
				"class" => "bookbtn mt1 agenda-agendar",
				"content" => "Agendar",
				"type" => "submit")
			)
			. "</td>";
		} else {
			echo "<td>" .
			form_button(array(
				"class" => "bookbtn mt1 overbook agenda-agendar",
				"content" => "Esgotado")
			)
			. "</td>";
		}
		unset($opcoes);
		echo form_close();
		echo "</tr>";
	}?>
</tbody>
										</table>

									</div>
									<div class="clearfix"></div>
								</div>
<?php }
} else {
	echo '<div class="line2"></div>';
	echo '<div class="padding20">';
	echo "Ainda não temos datas programadas para essa atividade <br>
	      Deseja solicitar uma data? Contate-nos <a href='mailto:suporte@praquerumo.com.br'>suporte@praquerumo.com.br</a>";
	echo '</div>';
}
?>

						<div class="line2"></div>

						<!-- second event -->


						<!-- end events -->
					</div>


					<!-- TAB 3 -->

					<div id="preferences" class="tab-pane fade">
						<p class="hpadding20">
						The hotel offers a snack bar/deli. A bar/lounge is on site where guests can unwind with a drink. Guests can enjoy a complimentary breakfast. An Internet point is located on site and high-speed wireless Internet access is complimentary.
						</p>

						<div class="line4"></div>

						<!-- Collapse 7 -->
						<button type="button" class="collapsebtn2" data-toggle="collapse" data-target="#collapse7">
						  Hotel facilities <span class="collapsearrow"></span>
						</button>

						<div id="collapse7" class="collapse in">
							<div class="hpadding20">

								<div class="col-md-4 offset-0">
									<ul class="hotelpreferences2 left">
										<li class="icohp-internet"></li>
										<li class="icohp-air"></li>
										<li class="icohp-pool"></li>
										<li class="icohp-childcare"></li>
										<li class="icohp-fitness"></li>
										<li class="icohp-breakfast"></li>
										<li class="icohp-parking"></li>
										<li class="icohp-pets"></li>
										<li class="icohp-spa"></li>
										<li class="icohp-hairdryer"></li>
									</ul>
									<ul class="hpref-text left">
										<li>High-speed Internet</li>
										<li>Air conditioning</li>
										<li>Swimming pool</li>
										<li>Childcare</li>
										<li>Fitness equipment</li>
										<li>Free breakfast</li>
										<li>Free parking</li>
										<li>Pets allowed</li>
										<li>Spa services on site</li>
										<li>Hair dryer</li>
									</ul>
								</div>


								<div class="col-md-4 offset-0">
									<ul class="hotelpreferences2 left">
										<li class="icohp-garden"></li>
										<li class="icohp-grill"></li>
										<li class="icohp-kitchen"></li>
										<li class="icohp-bar"></li>
										<li class="icohp-living"></li>
										<li class="icohp-tv"></li>
										<li class="icohp-fridge"></li>
										<li class="icohp-microwave"></li>
										<li class="icohp-washing"></li>
										<li class="icohp-roomservice"></li>
									</ul>
									<ul class="hpref-text left">
										<li>Courtyard garden</li>
										<li>Grill / Barbecue</li>
										<li>Kitchen</li>
										<li>Bar</li>
										<li>Living</li>
										<li>TV</li>
										<li>Fridge</li>
										<li>Microwave</li>
										<li>Washing maschine</li>
										<li>Room service</li>
									</ul>
								</div>
								<div class="col-md-4 offset-0">
									<ul class="hotelpreferences2 left">
										<li class="icohp-safe"></li>
										<li class="icohp-playground"></li>
										<li class="icohp-conferenceroom"></li>
									</ul>
									<ul class="hpref-text left">
										<li>Reception Safe</li>
										<li>Playground</li>
										<li>Conference room</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>

						</div>
						<!-- End of collapse 7 -->
						<br/>
						<div class="line4"></div>

						<!-- Collapse 8 -->
						<button type="button" class="collapsebtn2" data-toggle="collapse" data-target="#collapse8">
						  Room facilities <span class="collapsearrow"></span>
						</button>

						<div id="collapse8" class="collapse in">
							<div class="hpadding20">
								<div class="col-md-4">
									<ul class="checklist">
										<li>Climate control</li>
										<li>Air conditioning</li>
										<li>Direct-dial phone</li>
										<li>Minibar</li>
									</ul>
								</div>
								<div class="col-md-4">
									<ul class="checklist">
										<li>Wake-up calls</li>
										<li>Daily housekeeping</li>
										<li>Private bathroom</li>
										<li>Hair dryer</li>
									</ul>
								</div>
								<div class="col-md-4">
									<ul class="checklist">
										<li>Makeup/shaving mirror</li>
										<li>Shower/tub combination</li>
										<li>Satellite TV service</li>
										<li>Electronic/magnetic keys</li>
									</ul>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<!-- End of collapse 8 -->


					</div>

					<!-- TAB 4 -->
					<div id="maps" class="tab-pane fade">
						<div class="hpadding20">
							<div id="map-canvas"></div>
							<div id="coordenadas" style="display:none;">
								<h1 id="latitude"><?=$atividade['latitude']?></h1>
								<h1 id="longitude"><?=$atividade['longitude']?></h1>
							</div>
						</div>
					</div>

					<!-- TAB 5 -->
					<div id="reviews" class="tab-pane fade ">
						<div class="hpadding20">
							<div class="col-md-4 offset-0">
								<span class="opensans dark size60 slim lh3 ">4.5/5</span><br/>
								<img src="images/user-rating-4.png" alt=""/>
							</div>
							<div class="col-md-8 offset-0">
								<div class="progress progress-striped">
								  <div class="progress-bar progress-bar-success wh75percent" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
									<span class="sr-only">4.5 out of 5</span>
								  </div>
								</div>
								<div class="progress progress-striped">
								  <div class="progress-bar progress-bar-success wh100percent" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
									<span class="sr-only">100% of guests recommend</span>
								  </div>
								</div>
								<div class="clearfix"></div>
								Ratings based on 5 Verified Reviews
							</div>
							<div class="clearfix"></div>
							<br/>
							<span class="opensans dark size16 bold">Average ratings</span>
						</div>

						<div class="line4"></div>

						<div class="hpadding20">
							<div class="col-md-4 offset-0">
								<div class="scircle left">4.4</div>
								<div class="sctext left margtop15">Cleanliness</div>
								<div class="clearfix"></div>
								<div class="scircle left">4.0</div>
								<div class="sctext left margtop15">Service & staff</div>
								<div class="clearfix"></div>
							</div>
							<div class="col-md-4 offset-0">
								<div class="scircle left">3.8</div>
								<div class="sctext left margtop15">Room comfort</div>
								<div class="clearfix"></div>
								<div class="scircle left">4.4</div>
								<div class="sctext left margtop15">Sleep Quality</div>
								<div class="clearfix"></div>
							</div>
							<div class="col-md-4 offset-0">
								<div class="scircle left">4.2</div>
								<div class="sctext left margtop15">Location</div>
								<div class="clearfix"></div>
								<div class="scircle left">4.4</div>
								<div class="sctext left margtop15">Value for Price</div>
								<div class="clearfix"></div>
							</div>
							<div class="clearfix"></div>

							<br/>
							<span class="opensans dark size16 bold">Reviews</span>
						</div>

						<div class="line2"></div>

						<div class="hpadding20">
							<div class="col-md-4 offset-0 center">
								<div class="padding20">
									<div class="bordertype5">
										<div class="circlewrap">
											<img src="images/user-avatar.jpg" class="circleimg" alt=""/>
											<span>4.5</span>
										</div>
										<span class="dark">by Sena</span><br/>
										from London, UK<br/>
										<img src="images/check.png" alt=""/><br/>
										<span class="orange">Recommended<br/>for Everyone</span>
									</div>

								</div>
							</div>
							<div class="col-md-8 offset-0">
								<div class="padding20">
									<span class="opensans size16 dark">Great experience</span><br/>
									<span class="opensans size13 lgrey">Posted Jun 02, 2013</span><br/>
									<p>Excellent hotel, friendly staff would def go there again</p>
									<ul class="circle-list">
										<li>4.5</li>
										<li>3.8</li>
										<li>4.2</li>
										<li>5.0</li>
										<li>4.6</li>
										<li>4.8</li>
									</ul>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="line2"></div>

						<div class="hpadding20">
							<div class="col-md-4 offset-0 center">
								<div class="padding20">
									<div class="bordertype5">
										<div class="circlewrap">
											<img src="images/user-avatar.jpg" class="circleimg" alt=""/>
											<span>4.5</span>
										</div>
										<span class="dark">by Sena</span><br/>
										from London, UK<br/>
										<img src="images/check.png" alt=""/><br/>
										<span class="orange">Recommended<br/>for Everyone</span>
									</div>

								</div>
							</div>
							<div class="col-md-8 offset-0">
								<div class="padding20">
									<span class="opensans size16 dark">Great experience</span><br/>
									<span class="opensans size13 lgrey">Posted Jun 02, 2013</span><br/>
									<p>The view from our balcony in room # 409, was terrific. It was centrally located to everything on and around the port area. Wonderful service and everything was very clean. The breakfast was below average, although not bad. If back in Zante Town we would stay there again.</p>
									<ul class="circle-list">
										<li>4.5</li>
										<li>3.8</li>
										<li>4.2</li>
										<li>5.0</li>
										<li>4.6</li>
										<li>4.8</li>
									</ul>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="line2"></div>

						<div class="hpadding20">
							<div class="col-md-4 offset-0 center">
								<div class="padding20">
									<div class="bordertype5">
										<div class="circlewrap">
											<img src="images/user-avatar.jpg" class="circleimg" alt=""/>
											<span>4.5</span>
										</div>
										<span class="dark">by Sena</span><br/>
										from London, UK<br/>
										<img src="images/check.png" alt=""/><br/>
										<span class="orange">Recommended<br/>for Everyone</span>
									</div>

								</div>
							</div>
							<div class="col-md-8 offset-0">
								<div class="padding20">
									<span class="opensans size16 dark">Great experience</span><br/>
									<span class="opensans size13 lgrey">Posted Jun 02, 2013</span><br/>
									<p>It is close to everything but if you go in the lower season the pool won't be ready even though the temperature was quiet high already.</p>
									<ul class="circle-list">
										<li>4.5</li>
										<li>3.8</li>
										<li>4.2</li>
										<li>5.0</li>
										<li>4.6</li>
										<li>4.8</li>
									</ul>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="line2"></div>
						<br/>
						<br/>
						<div class="hpadding20">
							<span class="opensans dark size16 bold">Reviews</span>
						</div>

						<div class="line2"></div>

						<div class="wh33percent left center">
							<ul class="jslidetext">
								<li>Cleanliness</li>
								<li>Room comfort</li>
								<li>Location</li>
								<li>Service & staff</li>
								<li>Sleep quality</li>
								<li>Value for Price</li>
							</ul>

							<ul class="jslidetext2">
								<li>Username</li>
								<li>Evaluation</li>
								<li>Title</li>
								<li>Comment</li>
							</ul>
						</div>
						<div class="wh66percent right offset-0">
							<script>
								//This is a fix for when the slider is used in a hidden div
								function testTriger(){
									setTimeout(function (){
										$(".cstyle01").resize();
									}, 500);
								}
							</script>
							<div class="padding20 relative wh70percent">
								<div class="layout-slider wh100percent">
								<span class="cstyle01"><input id="Slider1" type="slider" name="price" value="0;4.2" /></span>
								</div>
								<script type="text/javascript" >
								function trigerJslider(){
								  jQuery("#Slider1").slider({ from: 0, to: 5, step: 0.1, smooth: true, round: 1, dimension: "", skin: "round" });
								  testTriger();
								  }
								</script>



								<div class="layout-slider margtop10 wh100percent">
								<span class="cstyle01"><input id="Slider2" type="slider" name="price" value="0;5.0" /></span>
								</div>
								<script type="text/javascript" >
								function trigerJslider2(){
								  jQuery("#Slider2").slider({ from: 0, to: 5, step: 0.1, smooth: true, round: 1, dimension: "", skin: "round" });
								  }
								</script>

								<div class="layout-slider margtop10 wh100percent">
								<span class="cstyle01"><input id="Slider3" type="slider" name="price" value="0;2.5" /></span>
								</div>
								<script type="text/javascript" >
								function trigerJslider3(){
								  jQuery("#Slider3").slider({ from: 0, to: 5, step: 0.1, smooth: true, round: 1, dimension: "", skin: "round" });
								  }
								</script>

								<div class="layout-slider margtop10 wh100percent">
								<span class="cstyle01"><input id="Slider4" type="slider" name="price" value="0;3.8" /></span>
								</div>
								<script type="text/javascript" >
								function trigerJslider4(){
								  jQuery("#Slider4").slider({ from: 0, to: 5, step: 0.1, smooth: true, round: 1, dimension: "", skin: "round" });
								  }
								</script>

								<div class="layout-slider margtop10 wh100percent">
								<span class="cstyle01"><input id="Slider5" type="slider" name="price" value="0;4.4" /></span>
								</div>
								<script type="text/javascript" >
								function trigerJslider5(){
								  jQuery("#Slider5").slider({ from: 0, to: 5, step: 0.1, smooth: true, round: 1, dimension: "", skin: "round" });
								  }
								</script>

								<div class="layout-slider margtop10 wh100percent">
								<span class="cstyle01"><input id="Slider6" type="slider" name="price" value="0;4.0" /></span>
								</div>
								<script type="text/javascript" >
								function trigerJslider6(){
								  jQuery("#Slider6").slider({ from: 0, to: 5, step: 0.1, smooth: true, round: 1, dimension: "", skin: "round" });
								  }
								</script>

								<input type="text" class="form-control margtop10" placeholder="">
								<select class="form-control mySelectBoxClass margtop10">
								  <option selected>Wonderful!</option>
								  <option>Nice</option>
								  <option>Neutral</option>
								  <option>Don't recommend</option>
								</select>
								<input type="text" class="form-control margtop10" placeholder="">

								<textarea class="form-control margtop10" rows="3"></textarea>

								<div class="clearfix"></div>
								<button type="submit" class="btn-search4 margtop20">Submit</button>

								<br/>
								<br/>
								<br/>
								<br/>

							</div>
						</div>
						<div class="clearfix"></div>

					</div>

					<!-- TAB 6 -->
					<div id="thingstodo" class="tab-pane fade">

						<p class="hpadding20 opensans size16 dark bold"><?=lang("details_recomendados_titulo")?></p>


<?php foreach ($atividades_recomendadas as $atividade_recomendada):?>
<div class="line2"></div>

						<div class="padding20">
							<div class="col-md-4 offset-0">
<?=anchor(base_url("atividades/{$atividade_recomendada['slug']}"),
'<img src=' . base_url("assets/images/atividades/thumbnails/{$atividade_recomendada['fig_thumbnail']}") .
' alt="" class="fwimg" />')?>
</div>
							<div class="col-md-8 offset-0">
								<div class="col-md-8 mediafix1">
									<span class="dark size16">
<?=anchor(base_url("atividades/{$atividade_recomendada['slug']}"),
'<h3 class="black palo-alto size18">'
. character_limiter($atividade_recomendada["titulo"], 50) .
'</h3>')?>
</span>
<?php $rating = round($atividade_recomendada['nota'])?>
										<p class="margtop10"><?=character_limiter($atividade_recomendada["apresentacao"], 150)?></p>
									<div class="clearfix"></div>
								</div>
								<div class="col-md-4 center bordertype4">
									<br />
									<span class="green">
											<img src="<?=base_url("assets/images/user-rating-{$rating}.png")?>" width="60"
												alt=""> <br> <span class="size11 grey"><?=$atividade_recomendada['avaliacoes_atividade']?> <?=lang("details_recomendados_avaliacoes")?></span>
											<!--<span class="opensans grey size14"><b>08/27/2013</b></span>-->
									</span><br /><br />
									<!--<span class="green size18"><b><?php //numeroEmReais($atividade_recomendada["preco"]) ?></b></span>
									<br/><br/><br/>-->

<?=anchor(base_url("atividades/{$atividade_recomendada['slug']}"),
'<button class="bookbtn mt1">' . lang("details_recomendados_mais") . '</button>')
?>
</div>
							</div>
							<div class="clearfix"></div>
						</div>

<?php endforeach?>
</div>

<!-- TAB 6 comentarios fb-->
<div id="comentarios" class="tab-pane fade">

	<!-- <p class="hpadding20 opensans size16 dark bold"><?=lang("details_comentarios_titulo")?></p> -->

<div class="line2"></div>
		
		<div class="padding20">
			<div class="fb-comments" width="100%" data-href="<?=base_url('atividades/'.$atividade['slug'])?>" data-numposts="5"></div>
			<!-- <div class="col-md-8 mediafix1">
				<div class="clearfix">oi3</div>
			</div> -->
				
			<div class="clearfix"></div>
		</div>

</div>
				</div>
			</div>

			<div class="col-md-4" >
				<div class="pagecontainer2 mt20 alsolikebox ">
					<div class="cpadding1">
						<span class="icon-location"></span>
						<h3 class="opensans"><?=lang("details_organizador")?></h3>
						<div class="clearfix"></div>
					</div>

					<div class="cpadding1 ">
<?php
// if ( trim($organizador['url_site']) != "" && $organizador['url_site']) {
// 	$url_site_organizador = $organizador['url_site'];
// }
// else {
$url_site_organizador = "#";
// }
?>

						<a href="<?=$url_site_organizador?>" target="_blank"><img style="width:60px; height:60px;"
						src="<?=base_url("assets/images/usuarios/{$organizador['foto']}")?>" class="left mr20" alt=""/></a>
						<a href="<?=$url_site_organizador?>" class="dark" target="_blank"><b><?=$organizador['nome']?></b></a><br/>
						<img src="<?=base_url("assets/images/filter-rating-5.png")?>" alt=""/>

						<!--<span class="opensans green bold size14">$
						</span>-->
						<br /><br />
						<br />
						<span class="grey"><?=$organizador["resumo{$sufix}"]?></span><br/>

					</div>

				</div><br/>

				<div class="pagecontainer2 mt20 needassistancebox">
					<div class="cpadding1">
						<span class="icon-help"></span>
						<h3 class="opensans"><?=lang("details_duvidas")?></h3>
						<p class="size14 grey"><?=lang("details_duvidas_texto")?>:</p>
						<a href="mailto:suporte@praquerumo.com.br" target="_top">
							<p class="opensans size16 green xslim">contato@praquerumo.com.br</p>
						</a>
						<!--<?php

?>

						<a href="<?=$target_suporte?>" target="_top">
							<spam class="opensans size16 green xslim">
							+55 92 8223-2626
							</spam>
						</a>
						<br />-->

<?php
if (is_mobile()) {
	$target_suporte = "tel:+55 92 99385-2746‬";
} else {
	$target_suporte = "#";
}
?>
						<a href="<?=$target_suporte?>" target="_top">
							<spam class="opensans size16 green xslim">
								+55 92 99385-2746‬
							</spam>
						</a>
					</div>
				</div><br/>

			</div>
		</div>

	</div>
	<!-- END OF CONTENT -->

	<!-- Javascript -->
	<script src="<?=base_url("assets/js/js-details.js")?>"></script>

	<!-- Googlemap -->
	<script src="<?=base_url("assets/js/initialize-google-map.js")?>"></script>

    <!-- Counter -->
    <script src="<?=base_url("assets/js/counter.js")?>"></script>

    <!-- Carousel-->
    <script src="<?=base_url("assets/js/initialize-carousel-detailspage.js")?>"></script>

    <!-- Custom Select -->
	<script type='text/javascript' src="<?=base_url("assets/js/jquery.customSelect.js")?>"></script>
