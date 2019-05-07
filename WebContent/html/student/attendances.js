$(function(){
    var $enrolledModules = $('#enrolled-modules');
    
    $.ajax({
        type: 'GET',
        url:'/RegStudentExam/view/list_modules_of_student',
        success: function(modules) {
        	Promise.all(
        		modules.map((module) => {
        			return new Promise((resolve) => {       				
            			$.ajax({
            				type: 'GET',
            				url: '/RegStudentExam/view/check_student_attendances_of_module/' + module.modId,
            				success: (sessions) => {
            					resolve({
            						module: module,
            						sessions: sessions
            					})
            				}
            			});
        			})
        		})
        	)
        	.then((array) => {
        		for (let i = 0; i < array.length; i++) {
        			$enrolledModules.append('<li>'+ array[i].module.name + " (module ID: " + array[i].module.modId +')</li>');
        	
        			for (let j = 0; j < array[i].sessions.length; j++) {
        				$enrolledModules.append(array[i].sessions[j].sesDate + ": "
        						+ array[i].sessions[j].stuId + '<br/>');
        			}
        			
        		}
        	})
        }
    });
});

function x(sessions) {
	
}
  

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