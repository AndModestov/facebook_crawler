ready = ->
  PrivatePub.subscribe "/shares", (data, channel) ->
    post_id = $.parseJSON(data['share']).post_id
    user = $.parseJSON(data['share']).user
    date = $.parseJSON(data['share']).date

    $('#shares_' + post_id).append(JST["templates/share"]({user_link: user, date: date}))

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('page:update', ready)