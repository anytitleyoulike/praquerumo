<html> 
	<meta charset="UTF-8">
	<head></head>
	<title>Login PRAQUERUMO</title>
	<body>
		
		<form action="/praquerumo/usuarios/cadastro" method="post">
			<h5>Nome:</h5>
			<?php echo form_error('nome');?>
			<input type="text" name="nome" value="" placeholder="Nome Completo" size="30">
			
			<h5>Telefone:</h5>
			<?php echo form_error('telefone'); ?>
			<input type="text" name="telefone" value="" size="30">

			<h5>Email:</h5>
			<?php echo form_error('email'); ?>
			<input type="text" name="email" value="" size="30">

			<h5>Senha:</h5>
			<?php echo form_error('senha'); ?>
			<input type="text" name="senha" value="" size="30">
			
			<div><input type="submit" value="Enviar" /></div>
		</form>

	</body>
</html>