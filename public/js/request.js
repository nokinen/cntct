$(function() {
	
	// Prepare alerts
	alert = function(){}
	alert.success = function(){
		$("#alert-container").html("<div class=\"alert alert-success fade in\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>Success!</strong> We\'ll be in touch soon…</div>");
	};

	alert.error = function(){
		$("#alert-container").html("<div class=\"alert alert-error fade in\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button><strong>Oh snap!</strong> Something went wrong…</div>");
	};
	
	// Prepare submit button
	$("input.btn").click(function() {
		
		var name = $("input#name").val();
		var email = $("input#email").val();
		var phone = $("input#phone").val();
		var time = $("select#time").val();
				
		var data = "name=" + name + "&email=" + email + "&phone=" + phone + "&time=" + time
				
		$.ajax({type: "POST", url: "/submit", data: data, success: alert.success, error: alert.error});
		
		return false;
  });
});