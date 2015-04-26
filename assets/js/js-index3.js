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
		jQuery('.mySelectBoxClass').trigger('update');
	}, 200);
}

jQuery(window).resize(function() {
	mySelectUpdate();
});


//------------------------------
//CaroufredSell
//------------------------------
jQuery(document).ready(function(jQuery){

	jQuery("#foo").carouFredSel({
		width: "100%",
		height: 240,
		items: {
			visible: 5,
			minimum: 1,
			start: 2
		},
		scroll: {
			items: 1,
			easing: "easeInOutQuad",
			duration: 500,
			pauseOnHover: true
		},
		auto: false,
		prev: {
			button: "#prev_btn",
			key: "left"
		},
		next: {
			button: "#next_btn",
			key: "right"
		},
		swipe: true
	});


	jQuery("#foo2").carouFredSel({
		width: "100%",
		height: 240,
		items: {
			visible: 5,
			minimum: 1,
			start: 2
		},
		scroll: {
			items: 1,
			easing: "easeInOutQuad",
			duration: 500,
			pauseOnHover: true
		},
		auto: false,
		prev: {
			button: "#prev_btn2",
			key: "left"
		},
		next: {
			button: "#next_btn2",
			key: "right"
		},
		swipe: true
	});


});

//------------------------------
//Slider parallax effect
//------------------------------

jQuery(document).ready(function(jQuery){
var jQueryscrollTop;
var jQueryheaderheight;
var jQueryloggedin = false;

if(jQueryloggedin == false){
  jQueryheaderheight = jQuery('.navbar-wrapper2').height() - 20;
} else {
  jQueryheaderheight = jQuery('.navbar-wrapper2').height() + 100;
}


jQuery(window).scroll(function(){
  var jQueryiw = jQuery('body').innerWidth();
  jQueryscrollTop = jQuery(window).scrollTop();
	  if ( jQueryiw < 992 ) {

	  }
	  else{
	   jQuery('.navbar-wrapper2').css({'min-height' : 110-(jQueryscrollTop/2) +'px'});
	  }
  jQuery('#dajy').css({'top': ((- jQueryscrollTop / 5)+ jQueryheaderheight)  + 'px' });
  jQuery(".sboxpurple").css({'opacity' : 1-(jQueryscrollTop/300)});
  jQuery(".scrolleffect").css({'top': ((- jQueryscrollTop / 5)+ jQueryheaderheight) + 30  + 'px' });
  jQuery(".tp-leftarrow").css({'left' : 20-(jQueryscrollTop/2) +'px'});
  jQuery(".tp-rightarrow").css({'right' : 20-(jQueryscrollTop/2) +'px'});
});

});



//------------------------------
//SCROLL ANIMATIONS
//------------------------------

	jQuery(window).scroll(function(){
		var jQueryiw = jQuery('body').innerWidth();

		if(jQuery(window).scrollTop() != 0){
			jQuery('.mtnav').stop().animate({top: '0px'}, 500);
			jQuery('.logo').stop().animate({width: '100px'}, 100);

		}
		else {
			 if ( jQueryiw < 992 ) {
			  }
			  else{
			   jQuery('.mtnav').stop().animate({top: '30px'}, 500);
			  }


			jQuery('.logo').stop().animate({width: '120px'}, 100);

		}


		//Social
		if(jQuery(window).scrollTop() >= 300){
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






//------------------------------
//ROLLOVER
//------------------------------

var theSide = 'marginLeft';
var options = {};
options[theSide] = jQuery('.one').width()/2-15;
jQuery(".one")
	.mouseenter(function() {
		jQuery(".mhover", this).addClass( "block" );
		jQuery(".mhover", this).removeClass( "none" );
		jQuery(".icon", this).stop().animate(options, 100);
	})
jQuery(".one").mouseleave(function() {
		jQuery(".mhover", this).addClass( "none" );
		jQuery(".mhover", this).removeClass( "block" );
		jQuery(".icon", this).stop().animate({marginLeft:"0px"}, 100);
	});

//------------------------------
//Activing tab
//------------------------------

function navegation(elemento,desconto, para){
		var $element = para;
		calculo = $element.offset().top;
		if(desconto){
			var goto = calculo-desconto;
		}else{
			var goto = calculo;
		}
		goto += -17;
		$('html, body').stop().animate({
			scrollTop: goto
		}, 2000,'easeInOutExpo');
}

// $(function(){
// 	$('#nav_atividades').click(function(){
// 		alert('ola');
// 		navegation($('#nav_atividades'),0, $('#atividades'));
// 		setTimeout(function (){
// 			$('.nav-tabs a[href="#agendamento"]').tab('show');
// 		}, 1500);
// 	});
// });

// $(function(){
// 	$('#nav_contatos').click(function(){
// 		navegation($('#nav_contatos'),0, $('#contatos'));
// 		setTimeout(function (){
// 			$('.nav-tabs a[href="#agendamento"]').tab('show');
// 		}, 1500);
// 	});
// });