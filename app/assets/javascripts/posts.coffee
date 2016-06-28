ready = ->
  PrivatePub.subscribe "/posts", (data, channel) ->
    group_id = $.parseJSON(data['post']).group_id
    body = $.parseJSON(data['post']).body
    link = $.parseJSON(data['post']).link
    post_id = $.parseJSON(data['post']).id

    $('.posts#' + 'posts_' + group_id).append(
      JST["templates/post"]({post_body: body, post_link: link, post_id: post_id})
    )

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('page:update', ready)