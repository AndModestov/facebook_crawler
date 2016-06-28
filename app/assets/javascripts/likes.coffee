ready = ->
  PrivatePub.subscribe "/likes", (data, channel) ->
    post_id = $.parseJSON(data['like']).post_id
    user = $.parseJSON(data['like']).user

    $('#likes_' + post_id).append(JST["templates/like"]({user_link: user}))

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('page:update', ready)