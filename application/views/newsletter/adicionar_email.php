<html>
	<head>
		<meta charset="UTF-8">
		<?= $nav_bar?>
	</head>
	<body>
		<form method="post" style="width: 60%;margin-top: 5%; margin-left:20%"  action="/praquerumo/newsletter/addemail">
		<h2>Assine nossa Newsletter</h2>
			<?php echo validation_errors();?>
			<div class="form-group">
    			<label for="exampleInputEmail1">Email</label>
    			<input type="email" class="form-control" name="inputEmail" placeholder="Email">
  			</div>
  			<button type="button" style="margin-left: 45%"class="btn btn-success btn-lg">Enviar!</button>
		</form>
	</body>
</html>