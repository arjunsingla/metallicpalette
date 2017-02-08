// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


//Resizing code
//http://stackoverflow.com/questions/12131989/jquery-isotope-centering


$.Isotope.prototype._getCenteredMasonryColumns = function() {
    this.width = this.element.width();
    var parentWidth = this.element.parent().width();
    var colW = this.options.masonry && this.options.masonry.columnWidth || // i.e. options.masonry && options.masonry.columnWidth
    this.$filteredAtoms.outerWidth(true) || // or use the size of the first item
    parentWidth; // if there's no items, use size of container
    var cols = Math.floor(parentWidth / colW);
    cols = Math.max(cols, 1);
    this.masonry.cols = cols; // i.e. this.masonry.cols = ....
    this.masonry.columnWidth = colW; // i.e. this.masonry.columnWidth = ...
};

$.Isotope.prototype._masonryReset = function() {
    this.masonry = {}; // layout-specific props
    this._getCenteredMasonryColumns(); // FIXME shouldn't have to call this again
    var i = this.masonry.cols;
    this.masonry.colYs = [];
        while (i--) {
        this.masonry.colYs.push(0);
    }
};

$.Isotope.prototype._masonryResizeChanged = function() {
    var prevColCount = this.masonry.cols;
    this._getCenteredMasonryColumns(); // get updated colCount
    return (this.masonry.cols !== prevColCount);
};

$.Isotope.prototype._masonryGetContainerSize = function() {
    var unusedCols = 0,
    i = this.masonry.cols;
        while (--i) { // count unused columns
        if (this.masonry.colYs[i] !== 0) {
            break;
        }
        unusedCols++;
    }

    return {
        height: Math.max.apply(Math, this.masonry.colYs),
        width: (this.masonry.cols - unusedCols) * this.masonry.columnWidth // fit container to columns that have been used;
    };
};


// Normal Function for Sorting/Isotope

$(function() {
  $('#pieces').imagesLoaded(function() {
    var $grid = $('#pieces').isotope({
      itemSelector: '.box',
      
      getSortData: {
        title: function(itemElem) { 
          var title = $(itemElem).find('.metadata').data('title') + '';
          return title.toLowerCase();
        },
        artist: function(itemElem) { 
          var artist = $(itemElem).find('.metadata').data('artist');
          return artist;
        },
        price: function(itemElem) {
          var price = $(itemElem).find('.metadata').data('price');
          return parseFloat(price);
        }
      },
      masonry: {
        isFitWidth: true
      }
    });


  	$('.filter-button-group').on( 'click', 'a', function() {
  	  var filterValue = $(this).attr('data-filter');
  	  $grid.isotope({ filter: filterValue });
  	});

    $('.sort-by-button-group').on('click', 'a', function() {
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