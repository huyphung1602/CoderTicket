jQuery(document).on('page:change turbolinks:load', function() {
  resizeIfNeeded()
});

// function setupCardResizing() {
//   $("img").load(function(){
//     console.log("Image loaded");
//     resizeIfNeeded()
//   })
// }

function resizeIfNeeded() {
  var heights = $(".card-block").map(function() {
      return $(this).height();
  }).get(),

  maxHeight = Math.max.apply(null, heights);
  console.log("heights: ", heights);
  console.log("max height: ", maxHeight);

  $(".card-block").height(maxHeight);
  console.log("Resized the card height to max height", $(".card-block").height());
}