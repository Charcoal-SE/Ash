# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('ready turbolinks:load', () ->

  $('.reg-select').select2({
    theme: 'bootstrap'
    placeholder: "click and type to search for a registrar..."
    ajax:
      url: "/registrars/find"
      dataType: 'json'
      delay: 100
      data: (params) ->
        return {q: params.term, page: params.page}
      processResults: (data, params) ->
        results = []
        $.each(data.items, (index, item) ->
          results.push({id: item.id, text: item.name})
        )
        return {results: results, pagination: {more: data.has_more}}
      cache: true
  })

  $('.admin-select').select2({
    theme: 'bootstrap'
    placeholder: "click and type to search for an admin contact..."
    ajax:
      url: "/admins/find"
      dataType: 'json'
      delay: 100
      data: (params) ->
        return {q: params.term, page: params.page}
      processResults: (data, params) ->
        results = []
        $.each(data.items, (index, item) ->
          results.push({id: item.id, text: item.name})
        )
        return {results: results, pagination: {more: data.has_more}}
      cache: true
  })

  $('.tech-select').select2({
    theme: 'bootstrap'
    placeholder: "click and type to search for a technical contact..."
    ajax:
      url: "/techs/find"
      dataType: 'json'
      delay: 100
      data: (params) ->
        return {q: params.term, page: params.page}
      processResults: (data, params) ->
        results = []
        $.each(data.items, (index, item) ->
          results.push({id: item.id, text: item.name})
        )
        return {results: results, pagination: {more: data.has_more}}
      cache: true
  })

)
