<html> 
	<meta charset="UTF-8">
	<head></head>
	<title>Login PRAQUERUMO</title>
	<body>
		<div class="container">
			
			<?php
			if(isset($msg)) {
				echo '<div class="alert alert-danger fade in">
	        			 <a href="#" class="close" data-dismiss="alert"></a>
	       				 <strong>Erro!</strong> ' . $msg .'
	    		</div>';
			}
			?>

			<form action="/praquerumo/usuarios/cadastro" class="form-horizontal" method="post">
				
				<div class="form-group">
				<label class="control-label">Nome:</label>
					<?php echo form_error('nome');?>
					<input type="text" class="form-control" name="nome" value="<?php echo set_value('nome');?>" placeholder="Nome Completo" size="30">
				</div>
				
				<div class="form-group">
					<label class="control-label">Telefone:</label>
					<?php echo form_error('telefone'); ?>
					<input type="text" class="form-control" name="telefone" value="<?php echo set_value('telefone');?>" size="30">
				</div>
				
				<div class="form-group">
				<label class="control-label">Usuario:</label>
					<?php echo form_error('username');?>
					<input type="text" class="form-control" name="username" value="<?php echo set_value('username');?>" size="30">
				</div>
				
				<div class="form-group">
					<label class="control-label">Email:</label>
					<?php echo form_error('email'); ?>
					<input type="text" class="form-control" placeholder="exemplo@email.com" name="email" value="<?php echo set_value('email');?>" size="30">
				</div>
				
				<div class="form-group">
					<label class="control-label">Senha:</label>
					<?php echo form_error('senha'); ?>
					<input type="password" class="form-control" name="senha" size="30">
				</div>
				<div>
					<input type="submit" class="btn btn-default" value="Enviar" />
				</div>
			</form>
		</div>

	</body>
</html>