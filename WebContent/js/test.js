function print(jsondata){
	var text = "";
	
	$.each(jsondata, function(key, value){
		text += value.surname + " " + value.name + "<br>";
	});
	
	$("#out").append(text);
}



$(document).ready(function(){
	
	//var $modules = $('#modules'); 
		$.ajax({
			type: "POST",
			url: "rest/view/accounts/students",
			dataType: "json",
			/*success: function (data){
				$.each(data, function(i, data){
					$modules.append('<li>name: ' + data.name + '</li>');
				});
			}*/
			success:function(jsondata){
				print(jsondata);
			}
		});
	
});