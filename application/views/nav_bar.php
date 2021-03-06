    <!-- Top wrapper -->
	<div class="navbar-wrapper2">
      <div class="container navbar-aligntitle">
		<div class="navbar ">

			<div class="container offset-3">
			  <!-- Navigation-->
			  <div class="navbar-header">
				<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				</button>
				<a href="<?=base_url()?>" class="navbar-brand"><img src="<?=base_url("assets/images/logo_beta.png")?>" alt="Pra Que Rumo Logo" class="logo"/></a>
			  </div>
			  <div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right navbar-verticalalign">
					  <!-- <li><a id="nav_atividades" href="#">Atividades</a></li> -->
<?php
if (isset($estado)) {?>
							  <li class="dropdown">
								<a data-toggle="dropdown" class="dropdown-toggle" href="#"><?=$estado?><b class="lightcaret mt-2"></b></a>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
								  <li class="dropdown-header"># Estados #</li>
								  <li><a href="<?=base_url("")?>">Todos os Estados</a></li>
								  <li><a href="<?=base_url("estado/acre")?>">Acre</a></li>
								  <li><a href="<?=base_url("estado/amazonas")?>">Amazonas</a></li>
								  <li><a href="<?=base_url("estado/amapa")?>">Amapá</a></li>
								  <li><a href="<?=base_url("estado/para")?>">Pará</a></li>
								  <li><a href="<?=base_url("estado/rondonia")?>">Rondonia</a></li>
								  <li><a href="<?=base_url("estado/roraima")?>">Roraima</a></li>
								  <li><a href="<?=base_url("estado/tocantins")?>">Tocantins</a></li>
								</ul>
							  </li>
<?php }?>
				  	  <li><a class="btn btn-warning btn-sm" href="https://goo.gl/ytcJv4" target="_blank">Cadastrar Atividade</a></li>
				  	  <li><a href="<?=base_url("equipe")?>">Quem Somos</a></li>
				  	  <li><a href="http://blog.praquerumo.com.br" target="_blank">Blog</a></li>
				  	  <?php
								$site_lang = $this->session->userdata('site_lang');
								
								//pegando url atual para utilizar no redirecionamento em language_controller
								$this->session->set_userdata('current_url',current_url());

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

						<li><a class="lato caps" style="padding-top: 8px" href='<?= $flag_href ?>'>
							<img src='<?= $flag_src ?>' alt='<?= $flag_alt ?>' class="flags" /></a>
						</li>	
				  	  <!-- <li><a id="nav_contatos" href="#">Contato</a></li> -->
				</ul>
			  </div>
			  <!-- /Navigation-->
			</div>

        </div>
      </div>
    </div>
	<!-- /Top wrapper -->