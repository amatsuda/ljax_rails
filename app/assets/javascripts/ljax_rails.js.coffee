$ ->
  $('.ljax-container').each (index, container) =>
    $.ajax
      type: 'GET'
      dataType: 'html'
      url: $(container).data('remote-url')
      headers: {'X-LJAX': 'true', 'X-LJAX-Container': container.id, 'X-LJAX-Partial': $(container).data('ljax-partial')}
      success: (data, status, xhr) ->
        $("##{container.id}").replaceWith data
      error: (data, status, xhr) ->
        console.log "error: #{data}"
