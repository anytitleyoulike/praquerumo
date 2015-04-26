	<title>PRAQUERUMO - <?=lang("title_pagina_inicial")
</title>
	<link rel="canonical" href="http://www.praquerumo.com.br/" />
	<meta  name="description" content="Encontre atividades de turismo de aventura e ecoturismo na Amazônia. Experimente atividades como Rafting, Stand-Up Paddle, Trekking, Caiaque e muito mais.">
	<link href="<?=base_url("assets/css/utils.css")
" rel="stylesheet" media="screen">
	<link href="<?=base_url("assets/css/style01.css")
" rel="stylesheet" media="screen">
	<link href="<?=base_url("assets/css/evento-box.css")
" rel="stylesheet" media="screen">
</head>

<body id="top">
<?=$nav_bar
	<!--echo no cabecalho -->
	<div id="dajy" class="fullscreen-container2 mtslideb sliderbg fixed">

			<div class="searchcontainer textcenter" style="">
				<span class="lato size48 normal white "><?=lang("home_titulo_principal")
</span><br/>

				<div class=" wh95percent center">
					<!--<input type="text" class="form-control inph left" placeholder="ex: Trekking, Rafting ..."></input>-->
					<button onclick="$('html,body').animate({scrollTop: $('#atividades').offset().top}, 2000);"
					 class="btn btn-default btn-lg botao-principal white" type="button">
<?=lang("home_mais_experiencias")
</button>
				</div>
			</div>

			<div class="fullscreenbanner">
				<ul>
							<!-- papercut fade turnoff flyin slideright slideleft slideup slidedown-->
							<!-- FADE -->
<?php
foreach ($destaques as $destaque):
						<li data-transition="fade" data-slotamount="1" data-masterspeed="300">
							<img src="<?=base_url("assets/images/atividades/destaques/{$destaque['fig_destaque']}")
" alt=""/>
							<div class="tp-caption scrolleffect sft"
								data-x="center"
								data-y="120"
								data-speed="1000"
								data-start="800"
								data-easing="easeOutExpo">
							</div>
						</li>
<?php
endforeach
<!-- static pics-->
<?php
foreach ($fotos_destaque as $destaque):
						<li data-transition="fade" data-slotamount="1" data-masterspeed="300">
							<img src="<?=$destaque
" alt=""/>
							<div class="tp-caption scrolleffect sft"
								data-x="center"
								data-y="120"
								data-speed="1000"
								data-start="800"
								data-easing="easeOutExpo">
							</div>
						</li>
<?php
endforeach
</ul>

				<div class="tp-bannertimer none"></div>
			</div>
	</div>

	<!--
		##############################
		 - ACTIVATE THE BANNER HERE -
		##############################
	-->

	<script type="text/javascript">

		var tpj=jQuery;
		tpj.noConflict();

		tpj(document).ready(function() {

			if (tpj.fn.cssOriginal!=undefined)
				tpj.fn.css = tpj.fn.cssOriginal;

			tpj('.fullscreenbanner').revolution(
			{
				delay:9000,
				startwidth:1170,
				startheight:600,

						onHoverStop:"off",						// Stop Banner Timet at Hover on Slide on/off

						thumbWidth:100,							// Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
						thumbHeight:50,
						thumbAmount:3,

						hideThumbs:0,
						navigationType:"bullet",				// bullet, thumb, none
						navigationArrows:"solo",				// nexttobullets, solo (old name verticalcentered), none

						navigationStyle:false,				// round,square,navbar,round-old,square-old,navbar-old, or any from the list in the docu (choose between 50+ different item), custom


						navigationHAlign:"left",				// Vertical Align top,center,bottom
						navigationVAlign:"bottom",					// Horizontal Align left,center,right
						navigationHOffset:30,
						navigationVOffset:30,

						soloArrowLeftHalign:"left",
						soloArrowLeftValign:"center",
						soloArrowLeftHOffset:20,
						soloArrowLeftVOffset:0,

						soloArrowRightHalign:"right",
						soloArrowRightValign:"center",
						soloArrowRightHOffset:20,
						soloArrowRightVOffset:0,

						touchenabled:"on",						// Enable Swipe Function : on/off


						stopAtSlide:-1,							// Stop Timer if Slide "x" has been Reached. If stopAfterLoops set to 0, then it stops already in the first Loop at slide X which defined. -1 means do not stop at any slide. stopAfterLoops has no sinn in this case.
						stopAfterLoops:-1,						// Stop Timer if All slides has been played "x" times. IT will stop at THe slide which is defined via stopAtSlide:x, if set to -1 slide never stop automatic

						hideCaptionAtLimit:0,					// It Defines if a caption should be shown under a Screen Resolution ( Basod on The Width of Browser)
						hideAllCaptionAtLilmit:0,				// Hide all The Captions if Width of Browser is less then this value
						hideSliderAtLimit:0,					// Hide the whole slider, and stop also functions if Width of Browser is less than this value


						fullWidth:"on",							// Same time only Enable FullScreen of FullWidth !!
						fullScreen:"off",						// Same time only Enable FullScreen of FullWidth !!


						shadow:0								//0 = no Shadow, 1,2,3 = 3 Different Art of Shadows -  (No Shadow in Fullwidth Version !)

					});


		});
	</script>

<!-- WRAP -->
<div class="wrap cst03 bgfix " >
<!--
	<div id="como_funciona" class="container lnews">
<?=lang("home_como_funciona")
		<img src="<?=base_url("assets/images/info_grafico.png")
"/>
	</div>
-->
	<div id="" class="container lnews">
<?=lang("home_proximas_atividades")
</div>

	<div id="atividades" class="container">
		<div class="container cstyle07" style="padding-top: 60px;">
<?php
foreach ($atividades as $atividade) {
<div class="col-md-4" style="padding-top: 10px;">
					<div class="boxshadow center atividade-bloco"
								style="min-height: 400px">
<?php
if ($atividade['vendivel']) {
    echo '<div class="faixa-disponivel">
											<img src="' . base_url("assets/images/disponivel.png") . '"/>
										  </div>';
}

<h5 class="font-effect-wallpaper grey bold" style="font-family:'Hammersmith One', sans-serif;text-align: left; padding-left: 20px;">
<?=$atividade["modalidade"]
</h5>
								<div>
<?php
$attributes = array('class' => 'ancora-titulo');
									<?=anchor(base_url("atividades/{$atividade['slug']}"),
'<h3 class="box-titulo black palo-alto size18">'
. character_limiter($atividade["titulo"], 50) .
'</h3>', $attributes)
</div>
								<div class="grey">
									<!--<div style="text-align: left; float: left; padding-left: 20px;">
										<h6>
											 dataMysqlParaPtBr($atividade["data_inicio"])
										</h6>
									</div>-->
									<div style="text-align: left; float: left; padding-left: 20px; margin-top: 0px;">
										<h6 >
<?=$atividade["cidade"] . "/" . $atividade["estado"]
</h6>
									</div>
								</div>
<?=anchor(base_url("atividades/{$atividade['slug']}"),
'<img
									style="padding-left: 20px; padding-right: 20px; padding-top: 10px;"
									src=' . base_url("assets/images/atividades/thumbnails/{$atividade['fig_thumbnail']}") .
' alt="" class="fwimg" />')

							<div class="itemlabel2"
								style="position: absolute; bottom: 0; left: 0;">
								<div class="labelleftbox">
									<div class="label-top">
										<spam class="size14 grey textjustify apresentacao"><?=character_limiter($atividade["apresentacao"], 120)
</spam>
									</div>
									<div class="label-bottom">

<?php

    $eventos = $atividade['eventos'];
    $preco = 'R$ 0,00';
    foreach ($eventos as $evento) {
        if ($evento['disponivel'] > 0) {
            echo anchor(base_url("atividades/{$atividade['slug']}"),
                '<time datetime="' . $evento['data_inicio'] . '" class="calendar-icon calendar-small calendar-green calendar-left10">
												  <em> ' . lang("evento_disponivel") . '</em>
												  <strong>' . getMonthNameData($evento['data_inicio']) . '</strong>
												  <span>' . getDayData($evento['data_inicio']) . '</span>
												</time>');
            $preco = $evento['preco'];
        } else {
            echo anchor(base_url("atividades/{$atividade['slug']}"),
                '<time datetime="' . $evento['data_inicio'] . '" class="calendar-icon calendar-small calendar-red calendar-left10">
												  <em> ' . lang("evento_indisponivel") . '</em>
												  <strong>' . getMonthNameData($evento['data_inicio']) . '</strong>
												  <span>' . getDayData($evento['data_inicio']) . '</span>
												</time>');
            $preco = $evento['preco'];
        }

    }


<!-- Mais eventos -->
<?=anchor(base_url("atividades/{$atividade['slug']}"),
'<time datetime="2014-09-20" class="calendar-icon calendar-small calendar-orange calendar-left10">
											  <em>Mais</em>
											  <strong>Datas</strong>
											  <span>+</span>
											</time>')

</div>
								</div>
								<div class="labelright">
<?php
$avaliacao = $atividade['avaliacao'];
    if ($avaliacao['nota'] == null) {
        $rating = 0;
    } else {

        $rating = round($avaliacao['nota']);
    }

    if ($avaliacao['recomenda'] == null) {
        $recomendacoes = 0;
    } else {

        $recomendacoes = $atividade['recomendacao']['quantidade'];
    }


									 <br> <br> <img
									src="<?=base_url("assets/images/user-rating-{$rating}.png")
" width="60"
									alt=""> <br> <span class="size11 grey"><?=$recomendacoes
 <?=lang("home_avaliacoes")
</span><br> <br>
									<!--<span class="green size18"><b><?=numeroEmReais($preco)
</b> </span><br> <br>-->

<?=anchor(base_url("atividades/{$atividade['slug']}"),
'<button class="bookbtn mt1">' . lang("home_mais") . '</button>')

</div>

							</div>
					</div>
				</div>

<?php
}
</div>
	</div>
<?=$rodape
</div>
<!-- end WRAP-->
<!--
<div id="more-activities">
	<button id="more" class="roundbtn" type="submit">Mais</button>
</div>
-->
<!-- This page JS -->
<script src="<?=base_url("assets/js/js-new-homepage.js")
"></script>
