# Código para barra de pesquisa
search_bar = ->
  $('.search-top')
    .search({
      source: gon.apps,
      searchFields: [
        'title'
      ],
      fullTextSearch: false
    })
# ==============================

# Código para upload de imagens da plataforma
platform_inputs = ->
  $('#platform_icon').on 'change', (e) ->
    readURL_icon(this)
  $('#platform_splash').on 'change', (e) ->
    readURL_splash(this)
  $('#platform_logo').on 'change', (e) ->
    readURL_logo(this)

  readURL_icon = (input) ->
    if (input.files && input.files[0])
      reader = new FileReader()
    reader.onload = (e) ->
      $('.platform_icon').attr('src', e.target.result).transition('tada')
    reader.readAsDataURL(input.files[0])
  readURL_splash = (input) ->
    if (input.files && input.files[0])
      reader = new FileReader()
    reader.onload = (e) ->
      $('.platform_splash').attr('src', e.target.result).transition('tada')
    reader.readAsDataURL(input.files[0])
  readURL_logo = (input) ->
    if (input.files && input.files[0])
      reader = new FileReader()
    reader.onload = (e) ->
      $('.platform_logo').attr('src', e.target.result).transition('tada')
    reader.readAsDataURL(input.files[0])
# ==========================================================

# Tabs do platforms/show
platform_tabs = ->
  tabs = $('.signing, .files, .update')
  tabs.on 'click', () ->
    tabs.removeClass('active')
    $(this).addClass('active')
    $.tab('change tab', this.classList[3])
# ========================================

$(document).on 'turbolinks:load', platform_inputs
$(document).on 'turbolinks:load', search_bar
$(document).on 'turbolinks:load', platform_tabs
