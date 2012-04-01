# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('a#add-committee-member').click (e) ->
  e.preventDefault
  console.log("Clicked")
  
$('#student_degree').change (e) ->
  console.log(e.target)
  if e.target.value == "Masters"
    console.log('True')
    $('.phd-only').hide()
  # else
  #   console.log('False')
  #   $('.phd-only').show