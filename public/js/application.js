$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
    $('#search').on('submit', '#search-form', function(event) {
    event.preventDefault();
    
    var searchRequest = $.ajax({
      url: "/search",
      type: "GET",
      data: $(this).serialize()
    });

    searchRequest.done(function(response) {
      console.log(response)
      $('#search_results').remove;
      $('#search_results').html(response);
    })

  });


  // next singer queue 
  // delete button should hide the div 
  //   the page should reload erb partial 

  $(".edit-queue").on('submit', function(event) {
    event.preventDefault();
    alert("clicked!");
    

    songUrl = $(this).parent().attr('id');
    var $that = $(this);

    var editRequest = $.ajax({
      url: "/songs/" + songUrl,
      type: "PUT",
      data: $(this).serialize()
    });

    editRequest.done(function(response) {
      $that.parent().hide();
      console.log(response);
      

    }) 
  });
});


