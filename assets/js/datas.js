$(function(){
    if ($('input[name="bloquear_boleto"]').val()){ 
        $("#pagBoleto")[0].href="#";
        $("#pagBoleto").click(function(){
            alert("Opção boleto desabilitada, pagamentos por boleto são desabilitados 3 dias antes da data final de agendamento.");
            $("#pagBoleto").href="null";
            setInterval(function(){ $("#pagCard").click(); }, 50);
        } );
        $("#pagBoleto")[0].title="Opção boleto desabilitada, pagamentos por boleto são desabilitados 3 dias antes da data final de agendamento.";
    }

});