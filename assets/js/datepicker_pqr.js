$(document).ready(function() {
    var SelectedDates = {};
    SelectedDates[new Date('04/05/2014')] = new Date('04/05/2014');
    SelectedDates[new Date('05/04/2014')] = new Date('05/04/2014');
    SelectedDates[new Date('06/06/2014')] = new Date('06/06/2014');
    
    var SeletedText = {};
    SeletedText[new Date('04/05/2014')] = 'Holiday1';
    SeletedText[new Date('05/04/2014')] = 'Holiday2';
    SeletedText[new Date('06/06/2014')] = 'Holiday3';    

    $('#datepicker').datepicker({
        showButtonPanel: true,
        autoSize: true,
        dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
        monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho',
            'Agosto','Setembro','Outubro','Novembro','Dezembro'],
        beforeShowDay: function(date) {
            var Highlight = SelectedDates[date];
            var HighlighText = SeletedText[date]; 
            if (Highlight) {
                return [true, "Highlighted", HighlighText];
            }
            else {
                return [true, '', ''];
            }
        },
        onSelect: function(dateText, obj) {
            alert(dateText);
        }
    });
});