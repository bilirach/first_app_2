# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $.setAjaxPagination = ->
    $('#etudiants th a, #etudiants .pagination a').click (event) ->
      event.preventDefault()
      $.ajax type: 'GET', url: $(@).attr('href'), dataType: 'script'
      false

  $.setAjaxPagination()
  
  $.ajaxSetup beforeSend: (->$('#loader').show()),complete: (->$('#loader').hide()),success: (->$('#loader').hide())
  
  $.fixedMenu = ->
		menu = $('.menu').find('ul li > a').bind 'click', (event) ->
			if ($(this).parent().hasClass('active'))
                $(this).parent().removeClass('active')
            else
                $(this).parent().parent().find('.active').removeClass('active')
                $(this).parent().addClass('active')
  
  $.fixedMenu()