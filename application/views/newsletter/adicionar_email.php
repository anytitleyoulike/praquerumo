<html>
	<head>
		<title>Newsletter</title>
		<meta charset="UTF-8">
		<?= $nav_bar?>
	</head>
	<body>
		<div class="container" style="margin-top:5%">
	<div class="row">
        <div class="span12">
    		<div class="thumbnail center well well-small text-center">
                <h2>Newsletter</h2>
                
                <p>Assine nossa newsletter para ter acesso ao nosso ebook!</p>
                
                <?php echo form_open('newsletter/addemail')?>
                    	<?php echo validation_errors();?>
                    <div class="input-prepend"><span class="add-on"><i class="icon-envelope"></i></span>
                        <input type="text" id="" name="inputEmail" placeholder="seu@email.com">
                    </div>
                    <br />
                    <input type="submit" value="Assine agora!" class="btn btn-success btn-large" />
              </form>
            </div>    
        </div>
	</div>
</div>

</html>