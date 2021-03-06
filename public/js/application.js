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

  // ajax the youtube video to load in iframe
  $("#queue").on('submit', 'form', function(event) {
    event.preventDefault();

    songUrl = $(this).parent().attr('id');
    var $that = $(this);

    var editRequest = $.ajax({
      url: "/songs/" + songUrl,
      type: "PUT",
      data: $(this).serialize()
    });

    var songToLoad = "https://www.youtube.com/embed/"  
    editRequest.done(function(response) {
      $that.parent().hide();
      console.log(response);
      $("iframe").attr("src", songToLoad + response);
    }); 

    editRequest.fail(function(response){
      console.log("Edit request failed.")
    });

  }); // end of queue 


  // ajax the login 
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



  //ajax the registration/sign up link 
  $("#sign-up").on('click', function(event) {
    event.preventDefault();

    var getSignUp = $.ajax({
      url: "/users/new",
      type: "GET"
    });

    getSignUp.done(function(response){
      console.log(response)
      $("#sign-in").empty();
      $("#sign-in").html(response)
    });

    getSignUp.fail(function(response){
      console.log("Get sign up failed");
    });
  }); // end of sign up 

  // ajax the add this song button 
  $("#search-results").on("submit", "form", function(event){ 
    event.preventDefault(); 

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

  }); // end of add this song button 

}); // end of document ready 











