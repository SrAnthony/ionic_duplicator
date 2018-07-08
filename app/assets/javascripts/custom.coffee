# Quando turbolink acabou de carregar a página
$(document).on 'turbolinks:load', () ->
  $('.search-top')
    .search({
      source: gon.apps,
      searchFields: [
        'title'
      ],
      fullTextSearch: false
    })
