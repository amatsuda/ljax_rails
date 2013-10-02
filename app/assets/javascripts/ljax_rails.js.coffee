$ ->
  $('.ljax-container').each (index, container) =>
    $.ajax
      type: 'GET'
      dataType: 'html'
      url: $(container).data('remote-url')
      cache: false
      headers: {'X-LJAX': 'true', 'X-LJAX-Container': container.id, 'X-LJAX-Partial': $(container).data('ljax-partial')}
      success: (data) ->
        $(container).replaceWith(data).trigger('ljax:success')
      error: ->
        $(container).trigger('ljax:error')
      complete: ->
        $(container).trigger('ljax:complete')
