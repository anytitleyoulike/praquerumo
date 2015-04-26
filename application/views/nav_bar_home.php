<!-- Top wrapper -->			  
	<div class="navbar-wrapper3 navbar-fixed-top2" style="max-height: 80px;">
		<div class="container">
			<div class="navbar mtnav2">
				<div class="container offset-3" >
					<!-- Navigation-->
					<div class="navbar-header" style="max-height: 80px;">
						<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a href="<?= base_url()?>" class="navbar-brand">
							<img style="margin-top: 0px;" src="<?= base_url("assets/images/logo_beta.png")?>" 
								alt="PraQueRumo Logo" class="logo2 esconde-logo logo-preta" id="logo_preta"/></a>
						<a href="<?= base_url()?>" class="navbar-brand">
							<img src="<?= base_url("assets/images/logo_beta_white.png")?>" 
								alt="PraQueRumo Logo" class="logo2" id="logo_white"/></a>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav nav2 navlight navbar-nav navbar-right">
							<li><a class="lato caps" href="<?= base_url()?>"><?= lang("home_pagina_inicial")?></a></li>
							<!--<li><a class="lato caps" onclick="$('html,body').animate({scrollTop: $('#como_funciona').offset().top}, 2000);" href="#como_funciona"><?= lang("home_como_funciona")?></a></li>-->
							<!--<li><a class="lato caps" href="<?= base_url()?>"><?= lang("home_quem_somos")?></a></li>-->
							
							<?php
								$site_lang = $this->session->userdata('site_lang');

								if($site_lang == "english"){
									$flag_href = base_url() . "language/switchlang/portuguese-br";
									$flag_src = base_url('assets/images/flags/br.png');
									$flag_alt = "Português";
								}
								else {									
									$flag_href = base_url() . "language/switchlang/english";
									$flag_src = base_url('assets/images/flags/uk.png');
									$flag_alt = "English";
								}
							?>
							<li><a class="lato caps"
								href='<?= $flag_href ?>'><img
									src='<?= $flag_src ?>' alt='<?= $flag_alt ?>' class="flags" /></a></li>							
						</ul>
					</div>
					<!-- /Navigation-->			  
				</div>				
			</div>
		</div>
	</div>
	<!-- /Top wrapper -->	