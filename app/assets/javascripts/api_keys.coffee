# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('ready turbolinks:load', () ->

  $('.user-select').select2({
    theme: 'bootstrap'
    placeholder: "click and type to search for a user..."
    ajax:
      url: "/users/find"
      dataType: 'json'
      delay: 100
      data: (params) ->
        return {q: params.term, page: params.page}
      processResults: (data, params) ->
        results = []
        $.each(data.items, (index, item) ->
          results.push({id: item.id, text: item.username})
        )
        return {results: results, pagination: {more: data.has_more}}
      cache: true
  })

)
