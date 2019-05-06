$(function(){
    var $registrable_exams = $('#registrable-exams');
    
    $.ajax({
        type: 'GET',
        url: '/RegStudentExam/view/list_available_exams',
        success: function(exams) {
            $.each(exams, function(i, exam) {
                $registrable.append('<tr>'
                		+ '<td>' + exam.examId + '</td>'
                		+ '<td>' + exam.name + '</td>'
                		+ '<td>' + exam.examDate + '</td>'
                		+ '<td>' + exam.deadline + '</td>'
//                		+ '<td>'
//            			+ '<form method="post" action="/RegStudentExam/view/delete_module/'
//            			+ module.modId + '"><button type="submit">Delete</button></form>'
//            			+ '</td>'
                		+ '</tr>'
                		);
            });
        }
    });
});