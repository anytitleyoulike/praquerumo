
//------------------------------
//Custom Select
//------------------------------
jQuery(document).ready(function(){
	jQuery('.mySelectBoxClass').customSelect();

	/* -OR- set a custom class name for the stylable element */
	//jQuery('.mySelectBoxClass').customSelect({customClass:'mySelectBoxClass'});
});

function mySelectUpdate(){
	setTimeout(function (){
		$('.mySelectBoxClass').trigger('update');
	}, 200);
}

$(window).resize(function() {
	mySelectUpdate();
});

//------------------------------
//slider parallax effect
//------------------------------
	  jQuery(document).ready(function($){
		var $scrollTop;
		var $headerheight;
		var $loggedin = false;

		if($loggedin == false){
		  $headerheight = $('.navbar-wrapper2').height() - 20;
		} else {
		  $headerheight = $('.navbar-wrapper2').height() + 100;
		}


		$(window).scroll(function(){
		  var $iw = $('body').innerWidth();
		  $scrollTop = $(window).scrollTop();
			  if ( $iw < 992 ) {

			  }
			  else{
			   $('.navbar-wrapper2').css({'min-height' : 74-($scrollTop/2) +'px'});
			  }
		  $('#dajy').css({'top': ((- $scrollTop / 5)+ $headerheight)  + 'px' });
		  //$(".sboxpurple").css({'opacity' : 1-($scrollTop/300)});
		  $(".scrolleffect").css({'top': ((- $scrollTop / 5)+ $headerheight) + 50  + 'px' });
		  $(".tp-leftarrow").css({'left' : 20-($scrollTop/2) +'px'});
		  $(".tp-rightarrow").css({'right' : 20-($scrollTop/2) +'px'});
		});

	  });



//------------------------------
//On scroll animations
//------------------------------
		jQuery(window).scroll(function(){
			var $iw = $('body').innerWidth();

			if(jQuery(window).scrollTop() != 0){
				jQuery('.mtnav').stop().animate({top: '0px'}, 500);
				jQuery('.logo').stop().animate({width: '100px'}, 100);
			}
			else {
				 if ( $iw < 992 ) {
				  }
				  else{
				   jQuery('.mtnav').stop().animate({top: '30px'}, 500);
				  }
				jQuery('.logo').stop().animate({width: '120px'}, 100);
			}

			//Social
 			if(jQuery(window).scrollTop() >= 700){
				jQuery('.social1').stop().animate({top:'0px'}, 100);

				setTimeout(function (){
					jQuery('.social2').stop().animate({top:'0px'}, 100);
				}, 100);

				setTimeout(function (){
					jQuery('.social3').stop().animate({top:'0px'}, 100);
				}, 200);

				setTimeout(function (){
					jQuery('.social4').stop().animate({top:'0px'}, 100);
				}, 300);
				setTimeout(function (){
					jQuery('.social5').stop().animate({top:'0px'}, 100);
				}, 400);

				setTimeout(function (){
					jQuery('.gotop').stop().animate({top:'0px'}, 200);
				}, 400);

			}
			else {
				setTimeout(function (){
					jQuery('.gotop').stop().animate({top:'100px'}, 200);
				}, 400);
				setTimeout(function (){
					jQuery('.social5').stop().animate({top:'-120px'}, 100);
				}, 400);
				setTimeout(function (){
					jQuery('.social4').stop().animate({top:'-120px'}, 100);
				}, 300);
				setTimeout(function (){
					jQuery('.social3').stop().animate({top:'-120px'}, 100);
				}, 200);
				setTimeout(function (){
				jQuery('.social2').stop().animate({top:'-120px'}, 100);
				}, 100);

				jQuery('.social1').stop().animate({top:'-120px'}, 100);

			}


		});

// pagamento

function concatDataValidade() {
	var mes = $('#validade_mes').val();
	var ano = $('#validade_ano').val();
	$('#validade').val(mes + "/" + ano);
}

$('#validade_mes').change(function(event){
	concatDataValidade();
});

$('#validade_ano').change(function(event){
	concatDataValidade();
});

$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
  //e.target // activated tab
  //e.relatedTarget // previous tab
  var aba = $(this);
  //alert(aba.attr("href"));
  if (aba.attr("href") == "#card"){
  	$('input[name="tipo_pagamento"]').val("#card");
  }
  else{
  	$('input[name="tipo_pagamento"]').val("#bank_slip");
  }

});

$(window).load(function() {
      $('input[name="tipo_pagamento"]').val("#card");
      concatDataValidade();
});