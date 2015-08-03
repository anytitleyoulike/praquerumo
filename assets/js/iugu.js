/**
 *
 */

var res = {
  loader : $('<div />', { class : 'loader'}),
  container : $('.loaderArea')
}

Iugu.setAccountID("486b1f80-1c29-458e-a069-85e10c6d75cb");
 Iugu.setTestMode(true);

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



