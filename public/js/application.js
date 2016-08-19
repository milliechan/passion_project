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
      $('#search-results').remove;
      $('#search-results').html(response);
    })

    searchRequest.fail(function(response) {
      console.log("Search form failed.")
    })
  });


  // next singer queue 
  // delete button should hide the div 
  //   the page should reload erb partial 

  $(".edit-queue").on('submit', function(event) {
    event.preventDefault();

    songUrl = $(this).parent().attr('id');
    var $that = $(this);

    var editRequest = $.ajax({
      url: "/songs/" + songUrl,
      type: "PUT",
      data: $(this).serialize()
    });

    editRequest.done(function(response) {
      $that.parent().hide();
    }); 

    editRequest.fail(function(response){
      console.log("Edit request failed.")
    });
  }); // end of queue 


  // ajax the login and registration 
  // help!
  $("#log-in").on('click', function(event) {
    event.preventDefault();

    var getLogin = $.ajax({
      url: "/sessions/new",
      type: "GET"
    });

    getLogin.done(function(response) {
      $("#sign-in").html(response)
    });

    getLogin.fail(function(response){
      console.log("Get login form failed.")
    })
  }); // end of log in ajax 


  // ajax the add this song button 
  $("#search-results").on("submit", "form", function(event){ 
    event.preventDefault(); 
    alert("clicked!"); 


    var $selectedSong = $(this)

    var selectedSongUrl = $selectedSong.attr("action")
    var selectedSongType = $selectedSong.attr("method")
    

    var addSongRequest = $.ajax({
      url: selectedSongUrl,
      type: selectedSongType,
      data: $selectedSong.serialize()
    })

    addSongRequest.done(function(response){
      $("#queue").append(response);
      $("#search-results").empty();

    }); 

    addSongRequest.fail(function(response){
      console.log("Add Song Request Failed")
      console.log(response)
    });

  });

}); // end of document ready 











