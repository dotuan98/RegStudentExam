<%@ page language="java" contentType="text/html; charset=ISO-8859-1"     pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AjaxJSP</title>
<script type="text/javascript" src="js/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#bttHello').click(function(){
			var fullname = $('#fullname').val();
			$.ajax({
				type:'POST',
				data: {
					fullname: fullname,
					action: "demo1"
				},
				url:'ModuleResources',
				success: function(result){
					$('#result1').html(result);
				}
			});
		});
		
		$('#bttSum').click(function(){
			var number1 = $('#number1').val();
			var number2 = $('#number2').val();
			$.ajax({
				type:'POST',
				data: {
					number1 : number1,
					number2 : number2,
					action: "demo2"
				},
				url:'ModuleResources',
				success: function(result){
					$('#result2').html(result);
				}
			});
		});
		
		$('#bttDisplay').click(function(){
			var studentId = $('#student_id').val();
			$.ajax({
				type:'POST',
				data: {
					student_id : studentId,
					action: "test"
				},
				url:'ModuleResources',
				success: function(result){
					$('#result3').html(result);
				}
			})
		})
		
		$('#bttLogin').click(function(){
			var username = $('#username').val();
			var password = $('#password').val();
			$.ajax({
				type:'POST',
				data: {
					username : username,
					password : password,
					action: "login"
				},
				url:'ModuleResources',
				success: function(result){
					$('#result4').html(result);
				}
			})
		})
	});
</script>
</head>
<body>

<fieldset>
	<legend>Demo 1</legend>
	<form>
	Name <input type = "text" id ="fullname">
	<input type="button" value="Hello" id="bttHello">
	<br>
	<span id="result1"></span> 
</form>
</fieldset>

<fieldset>
	<legend>Demo 2</legend>
	<form>
	Number 1 <input type = "text" id ="number1"><br>
	Number 2 <input type = "text" id ="number2"><br>
	Result <span id="result2"></span><br>
	<input type="button" value="Sum" id="bttSum"><br>
	
</form>
</fieldset> 

<fieldset>
<form>
	Student ID <input type = "text" id ="student_id"><br>
	<input type="button" value="Display" id="bttDisplay"><br>
	<span id="result3"></span><br>
	</form>
</fieldset>

<fieldset>
<form>
	Username <input type = "text" id ="username"><br>
	Password <input type = "password"  id = "password"><br>
	<input type = "button" value = "Login" id ="bttLogin">
	<span id="result4"></span><br>
</form>
</fieldset>


</body>
</html>