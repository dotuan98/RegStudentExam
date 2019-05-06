$(function(){
    var $enrolledModules = $('#enrolled-modules');
    
    $.ajax({
        type: 'GET',
        url:'/RegStudentExam/view/list_modules_of_student',
        success: function(modules) {
        	for (var i = 0; i < modules.length; i++) {
        		$enrolledModules.append('<li>' + module.name + '</li>'
        				+'<li><table id="module' + module.modId + '"></table></li>');
        	
                $.ajax({
                	type: 'GET',
                	url: '/RegStudentExam/view/check_student_attendances_of_module/' + module.modId,
                	success: function(sessions) {
                		$('#module' + module.modId).append('<li><table>'
                				+ '<tr><th>' + module.modId + '</th></tr>'
                				+'</table></li>');
                	}
                });
            //$.each(modules, function(i, module) {
        	};
        }
    });
});
  

/*OLD VERSION
var enrolledModules = document.getElementById("enrolled-modules");
var htmlString = "";

var myRequest = new XMLHttpRequest();
myRequest.open('GET', 'https://learnwebcode.github.io/json-example/animals-1.json');
myRequest.onload = function () {
    'use strict';
    var modules = JSON.parse(myRequest.responseText), i;
    for (i = 0; i < modules.length; i = i + 1) {
        htmlString += "<p>" + modules[i].name + "</p";
    }
};

    
enrolledModules.insertAdjacentHTML('beforeend', htmlString);
*/