// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


//No animation for some reason

$(function() {
  $('#pieces').imagesLoaded(function() {
    var $grid = $('#pieces').isotope({
      itemSelector: '.box',
      isFitWidth: true,
      getSortData: {
        title: function(itemElem) { 
          var title = $(itemElem).find('.title').text();
          return title;
        },
        price: function(itemElem) {
          var rawPrice = $(itemElem).find('.price').text();
          var price = parseFloat(rawPrice.replace(/[$\s]/g, ''));
          return price;
        }
      }
    });


  	$('.filter-button-group').on( 'click', 'button', function() {
  	  var filterValue = $(this).attr('data-filter');
  	  $grid.isotope({ filter: filterValue });
  	});

    $('.sort-by-button-group').on('click', 'button', function() {
      var sortByValue = $(this).data('sort-by');
      if (sortByValue) {
        var ascending = true;
        if ($(this).data('descending') === true) {
          ascending = false;
        }
        $grid.isotope({ sortBy: sortByValue, sortAscending: ascending });
      }
    });
  });

});
