$ ->
  for container in $('.ljax-container')
    $.ajax
      type: 'GET'
      dataType: 'text'
      url: $(container).data('remote-url')
      headers: {'X-LJAX': 'true', 'X-LJAX-Container': container.id}
      success: (data, status, xhr) ->
        $("##{container.id}").replaceWith data
      error: (data, status, xhr) ->
        console.log "error: #{data}"
