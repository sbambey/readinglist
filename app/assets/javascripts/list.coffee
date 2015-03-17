ready = ->

add_class = (parent) ->
  parent.addClass("has-feedback")
  if !parent.find(".feedback-loading").length
    parent.find(".input-group-addon").before(
      '<span class="form-control-feedback feedback-loading"><i class="fa fa-refresh fa-spin"></i></span>'
    )
  return


delay = do ->
  timer = 0
  (callback, ms) ->
    clearTimeout timer
    timer = setTimeout(callback, ms)
    return

delay_ = do ->
  timer = 0
  (callback, ms) ->
    clearTimeout timer
    timer = setTimeout(callback, ms)
    return

add_field = (btn) ->
  time = new Date().getTime()
  regexp = new RegExp(btn.data('id'), 'g')
  btn.parent().before(btn.data('fields').replace(regexp, time))

remove_field = (btn) ->
  btn.parent().parent().parent().find(".destroy-field").val('1')
  btn.closest('.book-input').parent().hide()

$(document).on 'keyup', '.list-item-title', (event) ->
  val = $(this).val()
  id = $(this).attr("id")
  parent = $(this).parent()
  
  if $(this).closest(".book-input").find(".hidden-author[type=text]").length == 0
    delay (->
      add_class(parent)
      return
    ), 500

    delay_ (->
      parent.find(".list-item-title").blur()
      parent.removeClass("has-error has-feedback")
      parent.parent().find(".error-explanation").remove()
      $.ajax
        url: '/list_items/retrieve_google_book/' + encodeURIComponent(val) + '/' + encodeURIComponent(id)
        type: 'get'
        async: false
      parent.find(".feedback-loading").remove()
      return
    ), 2000
    return

$(document).on 'click', '.add_fields', (event) ->
  add_field($(this))
  event.preventDefault()

$(document).on 'click', '.remove_fields', (event) ->
  remove_field($(this))
  if $(".list-body").find(".destroy-field[value!=1]").length < 1
    add_field($(".list-body").find(".add_fields"))
  event.preventDefault()

$(document).on 'click', '.wrong_book', (event) ->
  group = $(this).closest(".book-input")
  group.find("input:not(.list-item-title)").each ->
    $(this).val ""
  group.find("input[type=hidden].hidden-author").prop("type", "text")
  group.find(".added-info").empty()
  group.find(".custom-error").remove()
  event.preventDefault()

$(document).on 'click', '.btn-create', (event) ->
	$('.list-body').find('.list-item-title').each ->
    if $(this).parent().parent().find('.added-text .title').text().length
      $(this).val($(this).parent().parent().find('.added-text .title').text())

$(document).on 'click', '.share-url-box', (event) ->
  $(this).select()

$(document).on 'click', '.get-a-copy', (event) ->
  wrapper = $(this).parent().find(".external-book-buttons")
  if wrapper.css('visibility') == 'hidden'
    wrapper.css 'visibility', 'visible'
  else
    wrapper.css 'visibility', 'hidden'
  return
  event.preventDefault()

$(document).ready(ready)
$(document).on('page:load', ready)