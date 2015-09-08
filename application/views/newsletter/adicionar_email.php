<html>
	<head>
        <link href="<?= base_url("assets/css/bootstrap.css")?>" rel="stylesheet" media="screen">
        <link href="<?= base_url("assets/css/custom.css")?>" rel="stylesheet" media="screen">

        <meta property="og:url" content="<?=base_url('ebook')?>" />
        <meta property="og:title" content="PraQueRumo | Ebook StandUP Paddle" />
        <meta property="og:image" content="<?=base_url('assets/images/ebook-bg.jpg')?>" />
        <meta  name="description" content='Cadastre-se para ter acesso ao ebook!'>

		<title>Ebook StandUP Paddle</title>
		<meta charset="UTF-8">
	</head>
	<body class="newsletter">
		<div class="container" style="margin-top:18%">
            <div class="row">
                <div class="span12">
            		<div class="center text-center" style="position: absolute; margin-left:16%">
                        <p style="color: #fff; font-size: x-large">Cadastre seu email para receber o link de acesso</p>
                        
                        <?php echo form_open('newsletter/addemail')?>
                            	<?php echo validation_errors();?>
                            <div class="input-prepend"><span class="add-on"><i class="icon-envelope"></i></span>
                                <input type="text" id="" name="inputEmail" placeholder="seu@email.com">
                            </div>
                            <br />
                            <input type="submit" value="Enviar!" class="btn btn-success btn-large" />
                      </form>
                    </div>    
                </div>
        	</div>
        </div>
    </body>
</html>