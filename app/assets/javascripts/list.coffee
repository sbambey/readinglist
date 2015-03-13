ready = ->

delay = do ->
  timer = 0
  (callback, ms) ->
    clearTimeout timer
    timer = setTimeout(callback, ms)
    return

$(document).on 'keyup', '.list-item-title', (event) ->
  val = $(this).val()
  id = $(this).attr("id")
  delay (->
    $.get '/list_items/retrieve_google_book/' + encodeURIComponent(val) + '/' + encodeURIComponent(id)
    return
  ), 2000
  return

$(document).on 'click', '.add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).parent().before($(this).data('fields').replace(regexp, time))
  event.preventDefault()

$(document).on 'click', '.remove_fields', (event) ->
  if $(".list-body").find(".destroy-field[value!=1]").length > 1
    $(this).parent().parent().parent().find(".destroy-field").val('1')
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