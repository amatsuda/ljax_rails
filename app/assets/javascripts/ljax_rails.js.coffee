$ ->
  $('.ljax-container').each (index, container) =>
    $.ajax
      type: 'GET'
      dataType: 'html'
      url: $(container).data('remote-url')
      cache: false
      headers: {'X-LJAX': 'true', 'X-LJAX-Container': container.id, 'X-LJAX-Partial': $(container).data('ljax-partial')}
      success: (data, status, xhr) ->
        $(container).replaceWith data
      error: (data, status, xhr) ->
        console.log "error: #{data}"
