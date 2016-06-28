# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $("#group_start_time").datetimepicker();
  $("#group_end_time").datetimepicker();

  $('.groups').bind 'ajax:success', (e, data, status, xhr) ->
    id = xhr.responseJSON.group_id
    $('#group_' + id).html('<h5>Succecessfully deleted</h5>')

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('page:update', ready)