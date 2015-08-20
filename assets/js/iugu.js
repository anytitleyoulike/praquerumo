/**
 *
 */

var res = {
  loader : $('<div />', { class : 'loader'}),
  container : $('.loaderArea')
}

Iugu.setAccountID("486b1f80-1c29-458e-a069-85e10c6d75cb");
 //Iugu.setTestMode(true);

function getClientData(){
  var clientData =  '{ "clientData" : {' +
                    '"nome" : "'+ $('#nome').val() +'",' +
                    '"email" : "'+ $('#email').val() +'",' +
                    '"celular" : "'+ $('#celular').val() +'",' +
                    '"requisitos_especiais" : "'+ $('#requisicoes_especiais').val() +'",' +
                    '"preco_raw":"'+ $('input[name="preco_raw"]').val() +'",' +
                    '"descricao":"'+ $('input[name="descricao"]').val() +'",' +
                    '"data_horario":"'+ $('input[name="data_horario"]').val() +'",' +
                    '"evento_codigo":"'+ $('input[name="evento_codigo"]').val() +'",' +
                    '"quantidade":"'+ $('input[name="quantidade"]').val() +'"' +
                    '} }';
  return clientData;
}

// function getCardData(){
//   var cardData = '{ "cardData" : {' +
//                     '"numero_cartao" : "'+ $('#numero_cartao').val() + '",' +
//                     '"validade" : "'+ $('#validade').val() + '",' +
//                     '"cvv" : "'+ $('#cvv').val() + '",' +
//                     '"nome_cartao" : "'+ $('#nome_cartao').val() + '",' +
//   '} }';

//   return cardData;
// }
//
function setCardError($field, $message){
  $field.next(".carderror").addClass("alert alert-danger").html($message);
}

jQuery(function($) {
  $('#payment-form').submit(function(evt) {
      var form = $(this);
      var btn = $('#btnSubmit');
      //verifica qual aba esta ativada

      if ($('input[name="tipo_pagamento"]').val() == "#card"){
        var tokenResponseHandler = function(data) {
              if (data.errors) {
                  console.log(data.errors);
                  //alert("Erro salvando cartão: " + JSON.stringify(data.errors));
              } else {
                  $("#token").val( data.id );
                  form.get(0).submit();
              }

              // continuar a submissão
              //form.submit();
          }
          //valida cartao
          var validate_card = function(){
            var cartao = $('#numero_cartao').val();
            var validade = $('#validade').val();
            var cvv = $('#cvv').val();

            if(Iugu.utils.validateCreditCardNumber(cartao)){
              var brand = Iugu.utils.getBrandByCreditCardNumber(cartao);
              if(brand != false){
                if(Iugu.utils.validateCVV(cvv,brand)){
                  if(Iugu.utils.validateExpirationString(validade)){
                    return true;
                  }
                  else{
                    console.log("card is expirated!");
                    setCardError($('#validade'), "Cartão expirado!");

                    return false;
                  }
                }
                else{
                  console.log("cvv card not valid!");
                  setCardError($('#cvv'), "Código de Segurança do cartão inválido!");

                  return false;
                }
              }
              else{
                console.log("brand card not valid!");
                setCardError($('#numero_cartao'), "Bandeira de cartão inválido!");

                return false;
              }
            }
            else{
              console.log("number card not valid!");
              setCardError($('#numero_cartao'), "Número de cartão inválido!");
              return false;
            }
          };


          if(validate_card()){
            Iugu.createPaymentToken(this, tokenResponseHandler);
          }
          else{
            //alert("cartao nao eh valido!");
            console.log("payment error!");
          }
      }
      else{
        btn.submit();

      }

      return false;
  });
});