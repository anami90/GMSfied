'#position_buy_date').datepicker({
    showOtherMonths: true,
    dateFormat: 'yy-mm-dd'
});
$('#set_buy_date').on('click', function (){
    $('#position_buy_date').datepicker('setDate', new Date());
});