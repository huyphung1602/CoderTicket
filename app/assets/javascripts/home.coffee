window.resizeIfNeeded = ->
  heights = $('.card').map(-> $(this).height()).get()
  maxHeight = Math.max.apply(null, heights)
  console.log("heights, maxHeight", heights, maxHeight)
  $(".card").height(maxHeight)

window.setupCardResizing = ->
  console.log("bind load events to <img> tags")
  $("img").on("load", resizeIfNeeded)


$(document).on 'turbolinks:load', ->
  console.log("loading image resizing")
  setupCardResizing()
