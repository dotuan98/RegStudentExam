$('#authentication').on("click", function (event){
	var login = $("#login").val();
	var password = $("#password").val();
	ajax({
		type: 'POST',
		contentType: "application/json",
		url: "html/authentication",
		data: JSON.stringify({"login": login, "password": password}),
		success: function(){
			alert("success!");
			refreshLoginForm();
		}
	})
})