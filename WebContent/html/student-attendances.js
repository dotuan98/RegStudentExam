$(function(){
    var $enrolledModules = $('#enrolled-modules');
    //$enrolledModules.append('<li>123</li>');
    
    
    $.ajax({
        type: 'GET',
        url:'/RegStudentExam/view/accounts',
        success: function(modules) {
            $.each(modules, function(i, module) {
                $enrolledModules.append('<li>' + module.name + '</li>');
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