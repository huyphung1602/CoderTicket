jQuery(document).on('page:change turbolinks:load', function() {
  setupCardResizing()
});

function setupCardResizing() {
  $("img").load(function(){
    console.log("Image loaded");
    resizeIfNeeded()
  })
}

function resizeIfNeeded() {
  var heights = $(".card").map(function() {
      return $(this).height();
  }).get(),

  maxHeight = Math.max.apply(null, heights);
  console.log("heights: ", heights);
  console.log("max height: ", maxHeight);

  $(".card").height(maxHeight);
  console.log("Resized the card height to max height", $(".card").height());
}