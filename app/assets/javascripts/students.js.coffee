# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('a#add-committee-member').click (e) ->
    e.preventDefault
    console.log("Clicked")
  show_or_hide_finished_inputs = () ->
    switch $('input[name=student[status]]:checked').val()
      when 'Current student' then $('li#time-finished').hide()
      when 'Left program early' then $('li#time-finished').show()
      when 'Graduated' then $('li#time-finished').show()
      
  update_required_graduate_status_fields = (value) ->
    if value == "Masters"
      $('.ms-only').show()
      $('.phd-only').hide()
    else
      $('.ms-only').hide()
      $('.phd-only').show()
    
  update_required_graduate_status_fields($('#student_degree').val())
      
  $('#student_degree').change (e) ->
    update_required_graduate_status_fields(e.target.value)
    
  $('#panther-id').inputmask('999-99-9999')
  
  

      
  show_or_hide_finished_inputs()
  
  $("input[name='student[status]']").change () ->
    show_or_hide_finished_inputs()
