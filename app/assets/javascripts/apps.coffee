# On page load
$ ->
  $('.ui.button.will-load').on 'click', () ->
    $(this).addClass('loading')
