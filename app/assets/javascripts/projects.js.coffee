# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Morris.Bar
     element: 'projects_chart'
     data: $('#projects_chart').data('projects')
     xkey: 'name'
     ykeys: ['amount','balance']
     labels:['Amount', 'Balance']


  $(".jquery-ui-date").datepicker(
    altField: "#recorded-at-alt",
    altFormat: "yy-mm-d"
  )