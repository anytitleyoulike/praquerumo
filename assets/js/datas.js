$(function(){
    var dataAtual = new Date();
    var dataString = $('input[name="visivel_fim"]').val().split(" ")[0];
    var horaString = $('input[name="visivel_fim"]').val().split(" ")[1];
    var dia = dataString.split("-")[2];
    var mes = dataString.split("-")[1];
    var ano = dataString.split("-")[0];
    var hora = horaString.split(":")[0];
    var minuto = horaString.split(":")[1];
    var segundo = horaString.split(":")[2];
    var dataFim = new Date(dataString);
    dataFim.setDate(dia);
    dataFim.setMonth(mes-1);
    dataFim.setYear(ano);
    dataFim.setHours(hora);
    dataFim.setMinutes(minuto);
    dataFim.setSeconds(segundo);
    dataAtual.setDate(dataAtual.getDate()+3);
    if (dataAtual>dataFim){ 
        $("#pagBoleto")[0].href="#";
        //$("#pagBoleto")[0] ='<a id="pagBoleto" data-toggle="tab">Boleto</a>';
        $("#pagBoleto").click(function(){
            alert("Esta forma de pagamento está desabilitada!");
            $("#pagBoleto").href="null";
            setInterval(function(){ $("#pagCard").click(); }, 50);
        } );
        $("#pagBoleto")[0].title="Opção boleto desabilitada, pagamentos por boleto somente com 3 dias de antecedência.";        
    }
});