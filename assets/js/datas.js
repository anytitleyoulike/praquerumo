$(function(){
    var dataAtual = new Date();
    var dataString = $('input[name="visivel_fim"]').val().split(" ")[0];
    var dataFim = new Date(dataString);
    dataFim.setDate(dataFim.getDate()+1); //seta o dia corrigido da data fim
    dataAtual.setDate(dataAtual.getDate()+3);
    if (dataAtual>dataFim){ 
        $("#pagBoleto")[0].href="#";
        $("#pagBoleto").click(function(){
            alert("Esta forma de pagamento está desabilitada!");
        });
        $("#pagBoleto")[0].title="Opção boleto desabilitada, pagamentos por boleto somente com 3 dias de antecedência.";        
    }
});