$(document).on("click", "#add_location_button", function() {

  $.post("/locations", $("#new_location_form").serialize(), function() {
    $("#location_name").val('');
    $("#location_address").val('');
  })
    .fail(function(data) {
      alert(data.responseText)
    })
});

$(document).on("click", ".edit-location", function() {
  $.get('/locations/' + $(this).data('location_id') + '/edit')
});

$(document).on("click", "#update_location", function() {
  if ($("#location_name").val() != '') {
    $.ajax({
      url: '/locations/' + $(this).data('location_id'),
      type: "PATCH",
      data: $("#edit_location_form").serialize(), 
    });
  }
});

$(document).on("click", "#cancel_edit", function() {
  $.get('locations/new_form');
})

$(document).on("click", '.remove_location', function() {
  var location = $(this).parent();
  $.ajax({
    url: '/locations/' + $(this).data('location_id'),
    type: "DELETE",
    dataType: 'script'
  })
  .done(function(){
    location.remove();
  })
});