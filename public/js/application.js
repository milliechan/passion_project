$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
    $('button').on('click', function(event) {
    
    event.preventDefault();
    alert("clicked!");

    var searchRequest = $.ajax({
      url: "/search",
      type: "GET"
    })

    searchRequest.done(function(response) {
      console.log(response)
      $('#search_results').append(response);
    })

  });
});
