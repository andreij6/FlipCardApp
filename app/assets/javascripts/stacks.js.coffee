# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault() 

  $('.card').on 'click', '.front', (event) ->
    $(this).toggleClass 'hideme'
    $(this).next('.back').toggleClass 'hideme'
    $(this).parent('.card').toggleClass 'highlighted' 
    event.preventDefault()
  
  $('.card').on 'click', '.back', (event) ->
    $(this).toggleClass 'hideme'
    $(this).prev('.front').toggleClass 'hideme'
    $(this).parent('.card').toggleClass 'highlighted' 
    event.preventDefault()
   
  
    
