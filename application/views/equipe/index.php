<!DOCTYPE html>
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>PRAQUERUMO - <?=lang("about_titulo")?></title>

	<!-- PIECHART -->
	<link rel="stylesheet" type="text/css" href="<?=base_url("assets/css/jquery.easy-pie-chart.css")?>">

	<!-- Animo css-->
	<link rel="stylesheet" href="<?=base_url("assets/css/animate+animo.css")?>" type="text/css">

  </head>
  <body id="top" class="thebg" >
<?=$nav_bar?>

	<div class="container breadcrub">
	    <div>
			<a class="homebtn left" href="#"></a>
			<div class="left">
				<ul class="bcrumbs">
					<li>/</li>
					<li><a href="#" class="active"><?=lang("about_titulo")?></a></li>
				</ul>
			</div>
			<a class="backbtn right" href="#"></a>
		</div>
		<div class="clearfix"></div>
		<div class="brlines"></div>
	</div>

	<!-- CONTENT -->
	<div class="container">


		<div class="container mt25 offset-0">


			<!-- CONTENT -->
			<div class="col-md-12 pagecontainer2 offset-0">
				<div class="hpadding50c">
					<p class="lato size30 slim"><?=lang("about_proposta")?></p>
					<p class="aboutarrow"></p>
				</div>
				<div class="line3"></div>

				<div class="hpadding50c">

					<p class="lato size22 slim textcenter">
<?=lang("about_apresentacao")?>
					</p>
					<br/>
					<div class="line3"></div>
					<br/>

					<!-- LEFT IMG -->
					<div class="col-md-8 cpdd01">
						<img src="<?=base_url("assets/images/destaques/2.jpg")?>" class="fwimg" alt=""/>
					</div>
					<!-- END OF LEFT IMG -->

					<!-- IMG RIGHT TEXT -->
					<div class="col-md-4 cpdd02">
						<div class="opensans size18 grey">
							<span class="lato dark bold"><?=lang("about_companhia")?></span><br/>
<?=lang("about_apresentacao2")?>
							<br/><br/>


							<span class="lato dark bold"><?=lang("about_especialidades")?></span><br/>
							<div class="progress-about margbtm10">
								<div class="progress-bar progress-bar-success pbar1" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
								Aventuras e Experiências 90%
								</div>
							</div>
							<div class="progress-about margbtm10">
								<div class="progress-bar progress-bar-success pbar2" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
								Informações 100%
								</div>
							</div>
							<div class="progress-about margbtm10">
								<div class="progress-bar progress-bar-success pbar3" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
								Design 85%
								</div>
							</div>
							<div class="progress-about">
								<div class="progress-bar progress-bar-success pbar4" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
								Tecnologia 95%
								</div>
							</div>

						</div>
					</div>
					<!-- END OF IMG RIGHT TEXT -->
					<div class="clearfix"></div>
					<br/><br/>


					<span class="lato size18 dark bold"><?=lang("about_conheca_o_time")?></span><br/><br/>

					<!-- <div class="col-md-4">
						<div class="abover ohidden">
							<div class="abbg">
								<div class="socials-container">
									<a href="https://twitter.com/taytenorio" data-placement="top" title="Twitter" class="left"><span class="socials-twitter "></span></a>
									<a href="#" data-placement="top" title="Facebook" class="left"><span class="socials-facebook "></span></a>
									<a href="https://plus.google.com/+TaynaraTenorio" data-placement="top" title="Google Plus" class="left"><span class="socials-gplus "></span></a>
								</div>
							</div>
							<img src="<?=base_url("assets/images/time/taynara.jpg")?>" class="fwimg" alt=""/>
							<div class="chart none" data-percent="69" style="float:right; margin-top:-60px; right:10px;"><span class="countbouncerate">69</span>%</div>
						</div>
						<p class="lato lh2 mt10"><b>Taynara Tenório</b><br/>
						Cofundadora e Diretora de Pós-venda
						</p>
					</div> -->
					<div class="col-md-4">
						<div class="abover ohidden">
							<div class="abbg">
								<div class="socials-container">
									<a href="http://twitter.com/andbrain" data-placement="top" title="Twitter" class="left"><span class="socials-twitter "></span></a>
									<a href="http://facebook.com/anderson.brain" data-placement="top" title="Facebook" class="left"><span class="socials-facebook "></span></a>
									<a href="https://plus.google.com/108230580368477134168" data-placement="top" title="Google Plus" class="left"><span class="socials-gplus "></span></a>
								</div>
							</div>
							<img src="<?=base_url("assets/images/time/anderson.jpg")?>" class="fwimg" alt=""/>
							<div class="chart2 none" data-percent="69" style="float:right; margin-top:-60px; right:10px;"><span class="countnewvisits">81</span>%</div>
						</div>
						<p class="lato lh2 mt10"><b>Anderson Pimentel</b><br/>
						Cofundador e Diretor Tecnológico
						</p>
					</div>
					<div class="col-md-4">
						<div class="abover ohidden">
							<div class="abbg">
								<div class="socials-container">
									<a href="#" data-placement="top" title="Twitter" class="left"><span class="socials-twitter "></span></a>
									<a href="https://www.facebook.com/taykehedjho" data-placement="top" title="Facebook" class="left"><span class="socials-facebook "></span></a>
									<a href="https://plus.google.com/110478754338564195521" data-placement="top" title="Google Plus" class="left"><span class="socials-gplus "></span></a>
								</div>
							</div>
							<img src="<?=base_url("assets/images/time/tayke.jpg")?>" class="fwimg" alt=""/>
							<div class="chart3 none" data-percent="69" style="float:right; margin-top:-60px; right:10px;"><span class="countsearchtrafic">33</span>%</div>
						</div>
						<p class="lato lh2 mt10"><b>Tayke Monteiro</b><br/>
						Cofundador e Diretor de Aventuras
						</p>
					</div>					
					<div class="col-md-4">
						<div class="abover ohidden">
							<div class="abbg">
								<div class="socials-container">
									<a href="#" data-placement="top" title="Twitter" class="left"><span class="socials-twitter "></span></a>
									<a href="https://www.facebook.com/henrique.melo.359" data-placement="top" title="Facebook" class="left"><span class="socials-facebook "></span></a>
									<a href="https://plus.google.com/100629779120591827027" data-placement="top" title="Google Plus" class="left"><span class="socials-gplus "></span></a>
								</div>
							</div>
							<img src="<?=base_url("assets/images/time/henrique.jpg")?>" class="fwimg" alt=""/>
							<div class="chart2 none" data-percent="69" style="float:right; margin-top:-60px; right:10px;"><span class="countnewvisits">81</span>%</div>
						</div>
						<p class="lato lh2 mt10"><b>Henrique Armond</b><br/>
						Diretor de Informações
						</p>
					</div>
					<div class="clearfix"></div>
					<div class="col-md-4" style="margin-top:30px;">
						<div class="abover ohidden">
							<div class="abbg">
								<div class="socials-container">
									<a href="https://twitter.com/nandoserzedelo" data-placement="top" title="Twitter" class="left"><span class="socials-twitter "></span></a>
									<a href="https://www.facebook.com/fernandoserzedelo" data-placement="top" title="Facebook" class="left"><span class="socials-facebook "></span></a>
									<a href="https://plus.google.com/111865554502934532267" data-placement="top" title="Google Plus" class="left"><span class="socials-gplus "></span></a>
								</div>
							</div>
							<img src="<?=base_url("assets/images/time/fernando.jpg")?>" class="fwimg" alt=""/>
							<div class="chart2 none" data-percent="69" style="float:right; margin-top:-60px; right:10px;"><span class="countnewvisits">81</span>%</div>
						</div>
						<p class="lato lh2 mt10"><b>Fernando Serzedelo</b><br/>
						Diretor de Design e UX
						</p>
					</div>
					<div class="clearfix"></div>

					<br/>
					<br/>


					<div class="line3"></div>
					<br/>
					<br/>

					<div class="col-md-4">
						<div class="opensans grey2">
							<span class="gcircle">1</span><span class="lato size18 dark mt6 ml10"><b><?=lang("about_resumo")?></b></span><br/><br/>
							<span class="right"><?=lang("about_resumo_texto")?></span>


						</div>
					</div>
					<div class="col-md-4">

						<p class="opensans grey2">
						<span class="gcircle">2</span><span class="lato size18 dark mt6 ml10"><b><?=lang("about_objetivo")?></b></span><br/><br/>
						<span class="">Procurando novos destinos e coisas diferentes para se fazer na Amazônia?<br/><br/>
						Pra Que Rumo conecta Amazônia ao mundo.</span>
						</p>
					</div>
					<div class="col-md-4">

						<p class="opensans grey2">
						<span class="gcircle">3</span><span class="lato size18 dark mt6 ml10"><b><?=lang("about_juntese")?></b></span><br/><br/>
<?=lang("about_juntese_texto")?>
						<br/>
						<br/>
						<button class="btn-search4 caps center margtop20"><?=lang("about_juntese_agora")?></button>
						</p>
					</div>
					<div class="clearfix"></div>
				</div>
			<div class="clearfix"></div><br/><br/>
			</div>
			<!-- END CONTENT -->



		</div>


	</div>
	<!-- END OF CONTENT -->

	<!-- Javascript  -->
	<script src="<?=base_url("assets/js/js-about.js")?>"></script>

	<!-- Easy Pie Chart  -->
	<script src="<?=base_url("assets/js/jquery.easy-pie-chart.js")?>"></script>

	<!-- Load Animo -->
	<script src="<?=base_url("assets/js/animo.js")?>"></script>

	<!-- Custom Select -->
	<script type='text/javascript' src='<?=base_url("assets/js/jquery.customSelect.js")?>'></script>


  </body>
</html>
