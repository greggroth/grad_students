# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('a#add-committee-member').click (e) ->
  e.preventDefault
  console.log("Clicked")
  
$('#student_degree').change (e) ->
  if e.target.value == "Masters"
    $('.phd-only').hide()
  else
    $('.phd-only').show()