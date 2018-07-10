inputs_form_apps = ->
  $('input#app_name').on 'keyup', () ->
    $('#app-name-type').html(this.value)
  $('input#app_color_primary').on 'keyup', () ->
    $('#app-color-primary-type').html(this.value)
  $('input#app_color_secondary').on 'keyup', () ->
    $('#app-color-secondary-type').html(this.value)

$(document).on 'turbolinks:load', inputs_form_apps
