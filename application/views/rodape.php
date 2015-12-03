
<!-- Comeco do footer-->
<div id="contatos" class="footerbg lcfix">
		<div class="container">

			<div class="col-md-3">
				<span class="ftitle"><?=lang("footer_redes_sociais")?></span><br/><br/>
				<div class="scont">
					<a href="https://www.facebook.com/praquerumo" target="_blank"
						class="social1"><img src="<?=base_url('assets/images/social_medias/icon-facebook.png')?>"
						alt="Facebook" width="30px" height="30px" /></a>
					<a href="https://twitter.com/PraQueRumo"
						target="_blank" class="social2"><img
						src="<?=base_url('assets/images/social_medias/icon-twitter.png')?>" alt="Twitter" width="30px" height="30px" /></a>
					<a href="https://plus.google.com/113788997540785988773"
						rel="publisher" target="_blank" class="social3"> <img
						src="<?=base_url('assets/images/social_medias/icon-gplus.png')?>" alt="Google+" width="30px" height="30px" />
					</a>
					<a href="https://www.youtube.com/praquerumo" target="_blank"
						class="social4"><img src="<?=base_url('assets/images/social_medias/icon-youtube.png')?>"
						alt="Youtube" width="30px" height="30px" /> </a>
					<a href="https://www.instagram.com/praquerumoficial" target="_blank"
						class="social5"><img src="<?=base_url('assets/images/social_medias/icon-instagram.png')?>"
						alt="Youtube" width="30px" height="30px" /> </a>

						<br/><br/>
					 <img src="<?=base_url('assets/images/logosmal_black.png')?>" alt="" /><br /> &copy; 2014 |
					  <a href="<?=base_url()?>">PraQueRumo</a><br /><?=lang("footer_direitos_reservados")?><br /> <br />
				</div>
			</div>
			<!-- End of column 1-->

			<div class="col-md-3">
				<span class="ftitle"><?=lang("footer_parceiros")?></span><br/><br/>
				<a href="http://aceleradora.fabriq.com.br" target="_blank">
					<img alt="fabriq aceleradora" src='<?=base_url("assets/images/fabriq.png")?>'/><br/>
				</a>
				<br/>
				<a href="http://amazoniasocioambiental.com.br" target="_blank">
					<img alt="Amazônia Socioambiental" src='<?=base_url("assets/images/amazonia_socioambiental.png")?>'/><br/>
				</a>
			</div>

			<!-- End of column 2-->
			<div class="col-md-3">
				<span class="ftitle"><?=lang("footer_formas_pagamento")?></span><br/><br/>
				<ul class="" style="list-style-type: none; padding: 0px; margin: 0px;">
					<li>
						<img src="http://storage.pupui.com.br/9CA0F40E971643D1B7C8DE46BBC18396/assets/cc-icons.e8f4c6b4db3cc0869fa93ad535acbfe7.png" alt="Visa, Master, Diners. Amex" border="0" />
			 		</li>
					<li>
						<a class="iugu-btn" href="https://iugu.com" tabindex="-1"><img src="http://storage.pupui.com.br/9CA0F40E971643D1B7C8DE46BBC18396/assets/payments-by-iugu.1df7caaf6958f1b5774579fa807b5e7f.png" alt="Pagamentos por Iugu" border="0" /></a>
					</li>
				</ul>
			</div>

			<!-- End of column 3-->

			<div class="col-md-3 grey">
				<span class="ftitle"><?=lang("footer_mantenha_se_informado")?></span>
				<div class="relative">
					<?php
					$attributes = array('class' => 'ftitle');
					echo form_input(array(
					"name" => "newsletter",
					"id" => "newsletter_email",
					"class" => "form-control form-group",
					"maxlength" => "255",
					"placeholder" => "Digite seu email",
					));
					echo form_error("newsletter");
					$data = array('class' => 'btn btn-default btncustom',
					'type' => 'button',
					'onclick' => "submitNewsletter()",
					'src' => "<img src=" . base_url('assets/images/arrow.png') . '" alt="" />');
					echo form_button($data);
					?>

				</div>
				<br /> <br /> <span class="ftitle"><?=lang("footer_suporte")?></span><br />
<?php
// if (is_mobile()) {
//     $target_suporte = "tel:+559281121280";
// }
// else {
//     $target_suporte = "#";
// }
?>
				<!--<a href="<?=$target_suporte?>" target="_top">
					<span class="pnr">
						+55 92 8112-1280
						suporte@praquerumo.com.br
					</span><br />
				</a> -->
				<a href="mailto:suporte@praquerumo.com.br" target="_top">
					<spam class="pnr size10">contato@praquerumo.com.br</spam>
				</a>
			</div>
			<!-- End of column 4-->
		</div>
</div>

<div class="footerbg2">
	<div class="container center grey">
		<a href="<?=base_url()?>">Home</a> | <a href="<?=base_url("equipe")?>">Quem Somos</a> | <a href="http://blog.praquerumo.com.br" target="_blank">Blog</a>
		 | <a href="<?=base_url("termos/termo_de_uso")?>" target="_blank"><?=lang("footer_termo_de_uso")?></a> <!--| <a href="#">Contact</a>-->
		<a href="#top" class="gotop scroll">
			<img src="<?php echo base_url('assets/images/spacer.png')?>" alt="" />
		</a>
	</div>
</div>

<!-- Fim do Footer -->

<!-- Javascript -->

<script type="text/javascript">


function submitNewsletter() {
	
	var email = jQuery('input[name="newsletter"]').val();

	jQuery.ajax({
		url: '../newsletter/novo',
		type: 'post',
		data: {
			newsletter: email,
		},
		success: function(data) {
			var response = JSON.parse(data);
			if(response.success == false) {
				jQuery('.relative').append("<div id='tips-error' class='red'>"+ response.msg +"</div>");

				
				
			} else {
				jQuery('.relative').append("<div id='tips-error' class='green'>"+ response.msg +"</div>");
			}
			
 
			setTimeout(function(){	
				jQuery("#tips-error").remove(); 
				jQuery('input[name="newsletter"]').val("");
			}, 2000);
		},
	});
}

</script>
<!-- Custom functions -->
<script src="<?=base_url("assets/js/functions.js")?>"></script>

<!-- Picker UI-->
<script src="<?=base_url("assets/js/jquery-ui.js")?>"></script>

<!-- Easing -->
<script src="<?=base_url("assets/js/jquery.easing.js")?>"></script>

<!-- jQuery KenBurn Slider  -->
<script type="text/javascript" src="<?=base_url("assets/js/jquery.themepunch.revolution.min.js")?>"></script>

<!-- Nicescroll  -->
<script src="<?=base_url("assets/js/jquery.nicescroll.min.js")?>"></script>

<!-- CarouFredSel -->
<script src="<?=base_url("assets/js/jquery.carouFredSel-6.2.1-packed.js")?>"></script>
<script src="<?=base_url("assets/js/jquery.touchSwipe.min.js")?>"></script>
<script type="text/javascript" src="<?=base_url("assets/js/jquery.mousewheel.min.js")?>"></script>
<script type="text/javascript" src="<?=base_url("assets/js/jquery.transit.min.js")?>"></script>
<script type="text/javascript" src="<?=base_url("assets/js/jquery.ba-throttle-debounce.min.js")?>"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<?=base_url("assets/js/bootstrap.min.js")?>"></script>

</body>
</html>
