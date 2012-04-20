# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $.expr[':'].Contains = (a,i,m) ->
      return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0
      
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
  
  unique_stipend = () ->
    if $('#student_unique_stipend').is(':checked')
      $('#stipend').show()
    else
      $('#stipend').hide()
  update_required_graduate_status_fields($('#student_degree').val())
      
  $('#student_degree').change (e) ->
    update_required_graduate_status_fields(e.target.value)
    
  # Input Masks for Inputs
  $('#panther-id').inputmask('999-99-9999')
  $('.phone-number').inputmask('999-999-9999')
      
  show_or_hide_finished_inputs()
  $("input[name='student[status]']").change () ->
    show_or_hide_finished_inputs()
   
  unique_stipend() 
  $('#student_unique_stipend').change () ->
    unique_stipend()
    
  listFilter = (form) ->
    $(form).children('input').change () ->
      filter = $(this).val()
      if filter
        $('#list').removeClass('table-striped')
        $('#list').find("a.filtered-by:not(:Contains(" + filter + "))").parents('tr').hide()
        $('#list').find("a.filtered-by:Contains(" + filter + ")").parents('tr').show()
      else
        $('#list').addClass('table-striped').find("tr").show();
    .keyup () ->
      $(this).change()
        
  listFilter($("form.filterform"))
