$(document).ready(function() {
  $("a#delete").click(function(event) {
  	event.preventDefault();
  	var id = $(this).attr("name");
  	$.get("delete_post/" + id, function() {
  		$("#" + id).fadeOut();
  	});
  });
});

$(document).ready(function() {
	$("a#edit").click(function(event) {
		event.preventDefault();
		var id = $(this).attr("name");
		$.get("edit_post/" + id, function(data) {
			$("#" + id).html(data);
		});
	});
});

$(document).ready(function() {
  $("form#edit").submit(function(event) {
      event.preventDefault();
      var id =  $("#post_id").attr("class");
      $.post("/save_post", $(this).serialize(), function(data) {
        $('#' + id).html(data);
      });
  });
});
