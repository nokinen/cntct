// Short version for document ready event
$(function() {
	
	// Prepare alerts
	var success = function(){
		$("#request-alert-container").html("<div class=\"alert alert-success fade in\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>Success!</strong> We\'ll be in touch soon…</div>");
	};

	var error = function(){
		$("#request-alert-container").html("<div class=\"alert alert-error fade in\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>Oh snap!</strong> Something went wrong…</div>");
	};
	
	// Ajax form POST via submit button
	$("input#req_btn").click(function() {
		
		var name = $("input#req_name").val();
		var email = $("input#req_email").val();
		var phone = $("input#req_phone").val();
		var time = $("select#req_time").val();
				
		var data = "name=" + name + "&email=" + email + "&phone=" + phone + "&time=" + time
				
		$.ajax({type: "POST", url: "/request", data: data, success: success, error: error});
		
		return false;
  });
});