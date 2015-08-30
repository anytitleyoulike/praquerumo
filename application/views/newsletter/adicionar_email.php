<html>
	<head>
		<meta charset="UTF-8">
		<?= $nav_bar?>
	</head>
	<body>
		<form method="post" style="width: 60%;margin-top: 5%; margin-left:20%"  action="/praquerumo/newsletter/novo">
			<?php echo validation_errors();?>
			<div class="form-group">
    			<label for="exampleInputEmail1">Email</label>
    			<input type="email" class="form-control" name="inputEmail" placeholder="Email">
  			</div>
		</form>
	</body>
</html>