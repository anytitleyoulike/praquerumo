
//------------------------------
//Custom select
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
//Scroll animations
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
	if(jQuery(window).scrollTop() >= 900){
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
//Activing tab
//------------------------------

function navegation(elemento,desconto){
		var $element = $('#myTab');
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

$(function(){
	$('#agendarAgora').click(function(){
		navegation($('#agendarAgora'),0);
		setTimeout(function (){
			$('.nav-tabs a[href="#agendamento"]').tab('show');
		}, 1500);
	});
});





//------------------------------
//Agendamento
//------------------------------

$('.agenda').change(function(event) {
//        $('#update').html('This is ' + $('#choose').val() + ' and other info');
	$('input[name=quantidade]').val(this.value);
	//var $quantidade = $('input[name=quantidade]').val();
	//alert($quantidade);
	//var $codigo = $('input[name=evento]').val();
	//alert($codigo);


	var $valor_unit = $('input[name=valor_unit]:first').val();
	$valor_total = $valor_unit * this.value;
	//$('td[name=valor_total]').val($valor_total);
	//$("#agenda_" + $codigo ).html($valor_total);
	//$('td[name=valor_total]').html($valor_total);
});

function formatPrice() {
	$('td[name=valor_total]').priceFormat({
        prefix: 'R$ ',
        centsSeparator: ',',
        thousandsSeparator: '.'
	});
}

function getOutrasDatas(){
  var clientData =  '{ "clientData" : {' +
                    '"nome" : "'+ $('#tips-nome').val() +'",' +
                    '"email" : "'+ $('#tips-email').val() +'",' +
                    '"telefone" : "'+ $('#tips-telefone').val() +'",' +
                    '"organizador" : "'+ $('input[name="organizador-codigo"]').val() +'",' +
                    '"atividade":"'+ $('#tips-atividade').val() +'",' +
                    '"descricao":"'+ $('#tips-descricao').val() +'"' +
                    '} }';
  return clientData;
}

function sendData(btn, clientData){
	$.ajax({
          url : '../newsletter/sugereOutrasDatas',
          type : 'POST',
          data : {
                    nome: clientData.nome, email: clientData.email,
                    telefone: clientData.telefone, descricao: clientData.descricao,
                    organizador: clientData.organizador, 
                    atividade: clientData.atividade
                  },
          beforeSend: function(){
            //res.container.append(res.loader);
            btn.button('loading');
          },
          success : function(data){
            var result = JSON.parse( data );
            console.log(result);

            if(result.success == "true"){
              //mensagem de obrigado e fecha modal
              $('#outrasDatas').modal('hide');
              $('#ancora-datas').replaceWith("<h3><b>Entraremos em contato, obrigado!</b></h3");
            }
            else{
              //dizer o motivo do erro
              $('#tips-error').html(result.message);
              btn.button('reset');
            }
            //goto pagina de confirmacao de intencao
            //res.container.find(res.loader).remove();
            btn.button('reset');
          }
        });

}

$(function(){
	$('#tips-Enviar').click(function(){
		var btn = $(this);
		var clientData = JSON.parse( getOutrasDatas() ).clientData;
		sendData(btn,clientData);
		//finalizar com msg de muito obrigado
	});
});












