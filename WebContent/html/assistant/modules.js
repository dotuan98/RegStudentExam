$(function(){
    var $modulesTable = $('#modules-table');
    var moduleId;
    
    $.ajax({
        type: 'GET',
        url:'/RegStudentExam/view/list_all_modules',
        success: function(modules) {
            $.each(modules, function(i, module) {
                $modulesTable.append('<tr>'
                		+ '<td>' + module.modId + '</td>'
                		+ '<td>' + module.name + '</td>'
                		+ '<td>' + module.code + '</td>'
                		+ '<td>' + module.semId + '</td>'
                		+ '<td>'
                			+ '<form method="post" action="/RegStudentExam/view/delete_module/'
                			+ module.modId + '"><button type="submit">Delete</button></form>'
                		+ '</td>'
                		+ '<td><button href="#modify-anchor" class="modifyButton" data-modId="' + module.modId + '">Modify</button></td>'
                		+ '</tr>');
            });
            
            $(".modifyButton").on('click', function(event){
            	moduleId = $(event.target).attr('data-modId');
            	
            	$('#modify-header').html("Modify Module with ID " + moduleId);
            
            	$('#modify-form').attr('action', "/RegStudentExam/view/modify_module/" + moduleId);
            	$('#modify-form').html(
            			'Module name: <input type="text" name="module-name" placeholder="Java, Databases..."/><br/>'
            		    + 'Module code: <input type="text" name="module-code" placeholder="JAV, PRO, DTB..."/><br/>'
            		    + 'Semester ID: <input type="number" name="semester-id" placeholder="1..8"><br/>'
            		    + '<input type="submit" value="SUBMIT"/>'
            			);
            });
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