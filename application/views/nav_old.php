<div class="navbar-wrapper2 navbar-fixed-top">
      <div class="container">
		<div class="navbar mtnav">
			<div class="container offset-3">
			  <div class="navbar-header">
				<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				</button>
				<a href="<?= base_url() ?>" class="navbar-brand"><img src="<?= base_url("assets/images/logo_beta.png") ?>" alt="PraQueRumo Logo" class="logo"/></a>
			  </div>
			  <div class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a class="lato caps" href="<?= base_url()?>"><?= lang("home_pagina_inicial")?></a></li>
							<!--<li><a class="lato caps" onclick="$('html,body').animate({scrollTop: $('#como_funciona').offset().top}, 2000);" href="<?= base_url()?>#como_funciona"><?= lang("home_como_funciona")?></a></li>
							<li><a class="lato caps" href="<?= base_url()?>"><?= lang("home_quem_somos")?></a></li>-->
							
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


			</div>
		
        </div>
      </div>
    </div>