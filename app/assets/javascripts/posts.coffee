# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'page:change',  ->
  $("#tag_input").keydown (e) ->
    return unless e.keyCode == 13
    tag = $("#tag_input").val()
    $("#tag_input").val("")
    return if tag.trim().length == 0
    $.ajax("/tags.js", {type: "POST", data: {name: tag, taggable_id: $("#tag_input").data("taggable-id"), taggable_type: $("#tag_input").data("taggable-type")}})