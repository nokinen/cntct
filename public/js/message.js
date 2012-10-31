// Short version for document ready event
$(function() {
	
	// Prepare alerts
	var success = function(){
		$("#message-alert-container").html("<div class=\"alert alert-success fade in\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>Success!</strong> We\'ll be in touch soon…</div>");
	};
	
	var error = function(){
		$("#message-alert-container").html("<div class=\"alert alert-error fade in\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>Oh snap!</strong> Something went wrong…</div>");
	};
	
	// Ajax form POST via submit button
	$("input#msg_btn").click(function() {
		
		var email = $("input#msg_email").val();
		var subject = $("input#msg_subject").val();
		var body = $("textarea#msg_body").val();
				
		var data = "email=" + email + "&subject=" + subject + "&body=" + body
		$.ajax({type: "POST", url: "/message", data: data, success: success, error: error});
		
		return false;
  });
});