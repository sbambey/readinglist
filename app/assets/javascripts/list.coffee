ready = ->

$(document).on 'blur', '.list-item-title', (event) ->
  $(this).parent().removeClass("has-error has-feedback")
  $(this).parent().parent().find(".error-explanation").remove()
  $.get '/list_items/retrieve_google_book/' + $(this).val()

$(document).on 'click', '.add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).parent().before($(this).data('fields').replace(regexp, time))
  event.preventDefault()

$(document).on 'click', '.remove_fields', (event) ->
  if $(".list-body").find(".destroy-field[value!=1]").length > 1
    $(this).parent().parent().find(".destroy-field").val('1')
    $(this).closest('.book-input').parent().hide()
  event.preventDefault()

$(document).on 'click', '.wrong_book', (event) ->
  group = $(this).parent().parent().parent()
  group.find("input:not(.list-item-title)").each ->
    $(this).val ""
  group.find("input[type=hidden].hidden-author").prop("type", "text")
  $(this).parent().parent().empty()
  event.preventDefault()

$(document).on 'click', '.btn-create', (event) ->
	$('.list-body').find('.list-item-title').each ->
    if $(this).parent().parent().find('.added-text .title').text().length
      $(this).val($(this).parent().parent().find('.added-text .title').text())

$(document).ready(ready)
$(document).on('page:load', ready)