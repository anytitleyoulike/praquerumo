<html>
	<link href="/praquerumo/assets/css/bootstrap.css" rel="stylesheet" media="screen">
	<script src="/praquerumo/assets/js/jquery.mask.min.js"></script>
	<head><?=$nav_bar?></head>
	<body>
		<div class="container" style="margin-top: 50px">
		    	<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="panel panel-login">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-6">
										<a href="#" class="active" id="login-form-link">Login</a>
									</div>
									<div class="col-xs-6">
										<a href="#" id="register-form-link">Cadastro</a>
									</div>
								</div>
								<hr>
							</div>
							<div class="panel-body">
								<div class="row">

									<div class="col-lg-12">
										<form id="login-form" action="/praquerumo/login/autentica" method="post" role="form" style="display: block;">
											<div class="form-group">
												<?php echo form_error('email_login');?>
												<input type="text" name="email_login" id="email" tabindex="1" class="form-control" placeholder="Email" value="<?php echo set_value('email_login');?>">
											</div>
											<div class="form-group">
												<?php echo form_error('senha_login');?>
												<input type="password" name="senha_login" id="senha" tabindex="2" class="form-control" placeholder="Senha">
											</div>
											<div class="form-group text-center">
												<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
												<label for="remember"> Remember Me</label>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-lg-12">
														<div class="text-center">
															<a href="<?=base_url('recuperar')?>" tabindex="5" class="forgot-password">Esqueceu a senha?</a>
														</div>
													</div>
												</div>
											</div>
										</form>
										<?php 
										if(isset($msg)){

											echo '<div class="alert alert-danger">'. $msg .'</div>';
										} 
										?>
										<form id="register-form" action="/praquerumo/usuarios/cadastro" method="post" role="form" style="display: none;">
											<div class="form-group">
												<?php echo form_error('nome');?>
												<input type="text" name="nome" id="nome" tabindex="1" class="form-control" placeholder="Nome" value="<?php echo set_value('nome');?>">
											</div>
											<div class="form-group">
												<?php echo form_error('nome');?>
												<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="<?php echo set_value('usuario');?>">
											</div>
											<div class="form-group">
												<?php echo form_error('email');?>
												<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="exemplo@email.com" value="<?php echo set_value('email');?>">
											</div>
											<div class="form-group">
												<?php echo form_error('telefone');?>
												<input type="text" name="telefone" id="telefone" tabindex="2" class="form-control" placeholder="(99) 99999-9999" value="<?php echo set_value('telefone');?>">
											</div>
											<div class="form-group">
												<?php echo form_error('senha');?>
												<input type="password" name="senha" id="senha" tabindex="2" class="form-control" placeholder="Senha" value="<?php echo set_value('senha');?>">
											</div>

											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Cadastrar">
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</body>
</html>
<script type="text/javascript">

	$(function() {

	    $('#login-form-link').click(function(e) {
			$("#login-form").delay(100).fadeIn(100);
	 		$("#register-form").fadeOut(100);
			$('#register-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
		$('#register-form-link').click(function(e) {
			$("#register-form").delay(100).fadeIn(100);
	 		$("#login-form").fadeOut(100);
			$('#login-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});

	});

	var maskBehavior = function (val) {
 		return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
	},
	
		options = {onKeyPress: function(val, e, field, options) {
			field.mask(maskBehavior.apply({}, arguments), options);
		}
	};
 
	$('#telefone').mask(maskBehavior, options);

</script>