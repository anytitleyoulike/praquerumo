<!DOCTYPE html>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Travel Agency - HTML5 Booking template</title>
	
	<!-- Bootstrap -->
	<link href="<?= base_url("assets/css/bootstrap.css")?>" rel="stylesheet" media="screen">
	<link href="<?= base_url("assets/css/custom.css")?>" rel="stylesheet" media="screen">

	<!-- Animo css-->
	<link href="<?= base_url("assets/css/animate+animo.css")?>" rel="stylesheet" media="screen">
	
	<link href="<?= base_url("assets/css/carousel.css")?>" rel="stylesheet">
	
	<!-- Fonts -->	
	<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:700,400,300,300italic' rel='stylesheet' type='text/css'>	
	<!-- Font-Awesome -->
	<link rel="stylesheet" type="text/css" href="<?= base_url("assets/css/font-awesome.css")?>" media="screen" />
	
	<!-- Load jQuery -->
	<script src="<?= base_url("assets/js/jquery.v2.0.3.js")?>"></script>
  </head>
  <body>
	<!-- 100% Width & Height container  -->
	<div class="login-fullwidith">
		
		<!-- Login Wrap  -->
		<div class="login-wrap">
			<img src="<?= base_url("assets/images/logo_beta_white.png")?>" class="login-img" alt="logo"/><br/>
			<div class="login-c1">
				<div class="cpadding50">
					<input type="text" class="form-control logpadding" placeholder="Usuário ou Email">
					<br/>
					<input type="text" class="form-control logpadding" placeholder="Password">
				</div>
			</div>
			<div class="login-c2">
				<div class="logmargfix">
					<div class="chpadding50">
							<div class="alignbottom">
								<button class="btn-search4"  type="submit" onclick="errorMessage()">Submit</button>							
							</div>
							<div class="alignbottom2">
							  <div class="checkbox">
								<label>
								  <input type="checkbox">Remember
								</label>
							  </div>
							</div>
					</div>
				</div>
			</div>
			<div class="login-c3">
				<div class="left"><a href="#" class="whitelink"><span></span>Website</a></div>
				<div class="right"><a href="#" class="whitelink">Lost password?</a></div>
			</div>			
		</div>
		<!-- End of Login Wrap  -->
	
	</div>	
	<!-- End of Container  -->

	<!-- Javascript  -->
	<script src="<?= base_url("assets/js/initialize-loginpage.js")?>"></script>
	<script src="<?= base_url("assets/js/jquery.easing.js")?>"></script>
	<!-- Load Animo -->
	<script src="<?= base_url("assets/js/animo.js")?>"></script>
	<script>
	function errorMessage(){
		$('.login-wrap').animo( { animation: 'tada' } );
	}
	</script>
	<script src="<?= base_url("assets/js/bootstrap.min.js")?>"></script>
  </body>
</html>