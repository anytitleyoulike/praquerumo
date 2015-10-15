<html>
	<head>
        <?php require_once("analytics-tracker.php") ?>
        <title>Ativação</title>
	</head>
	<body>

		<div class="col-sm-6 col-md-6" style="margin-top: 5%; margin-left:25%; margin-right:25%">
            <?php if($status == true) {?>

            <div class="alert alert-info">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                    ×</button>
               <span class="glyphicon glyphicon-ok"></span> <strong>Sucesso!</strong>
                <hr class="message-inner-separator">
                Olá,
                <br>
                <p> Sua conta já está ativada!</p>
                <br>

            </div>
            <?php } else { ?>
                 <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                    ×</button>
               <span class="glyphicon glyphicon-ok"></span> <strong>Sucesso!</strong>
                <hr class="message-inner-separator">
                 Olá,
                <br>
                <p> Conta ativada com sucesso!</p>
                <br>
            </div>

            <?php }?>
        </div>

	</body>
</html>