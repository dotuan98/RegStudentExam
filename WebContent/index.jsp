<%@ page language="java" contentType="text/html; charset=ISO-8859-1"     pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AjaxJSP</title>
<script type="text/javascript" src="js/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#bttGetAllStudent').click(function(){
			$.ajax({
				type:'GET',
				data: {
					action: "getAllStudent"
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
				success: createTable
			})
		})
	});
</script>
<script>
function createTable(result) {
  var table = document.getElementById("myTable");
  var row = table.insertRow(0);
  var cell1 = row.insertCell(0);
  var cell2 = row.insertCell(1);
  cell1.innerHTML = "NEW CELL1";
  cell2.innerHTML = "NEW CELL2";
}
</script>
</head>
<body>

<fieldset>
	<legend>Get all students</legend>
	<form>
	<input type="button" value="Get" id="bttGetAllStudent">
	<br>
	<span id="result1"></span> 
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