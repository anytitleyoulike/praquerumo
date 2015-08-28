
$(function(){
    if ($('input[name="bloquear_boleto"]').val()){ 
        $("#pagBoleto")[0].href="#";
        $("#pagBoleto").click(function(){
            alert("Opção boleto desabilitada, pagamentos por boleto somente com 3 dias de antecedência.");
            setInterval(function(){ $("#pagCardAba").click(); }, 50);
        } );
    }

});