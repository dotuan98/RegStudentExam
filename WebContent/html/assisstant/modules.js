$(function(){
    var $modulesTable = $('#modules-table');
    
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
                		+ '<td><form method="post" action="/RegStudentExam/view/delete_module/'
                		+ module.modId + '"><button type="submit">Delete</button></form></td>'
                		+ '</tr>');
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