$(function(){
    if ($('input[name="bloquear_boleto"]').val()){ 
        $("#pagBoleto")[0].href="#";
        $("#pagBoleto").click(function(){
            alert("Esta forma de pagamento está desabilitada!");
            $("#pagBoleto").href="null";
            setInterval(function(){ $("#pagCard").click(); }, 50);
        } );
        $("#pagBoleto")[0].title="Opção boleto desabilitada, pagamentos por boleto somente com 3 dias de antecedência.";        
    }
});