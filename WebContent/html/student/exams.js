$(function(){
    var $registrable_exams = $('#registrable-exams');
    
    $.ajax({
        type: 'GET',
        url: '/RegStudentExam/view/list_available_exams',
        success: function(exams) {
            $.each(exams, function(i, exam) {
                $registrable_exams.append('<tr>'
                		+ '<td>' + exam.examId + '</td>'
                		+ '<td>' + exam.name + " " + exam.modId + '</td>'		//module name not exam name
                		+ '<td>' + exam.examDate + '</td>'
                		+ '<td>' + exam.deadline + '</td>'
                		+ '<td>'
            			+ '<form method="post" action="/RegStudentExam/view/register_exam/1/'	//currently assume stuID = 1
            			+ exam.examId + '"><button type="submit">Register</button></form>'
            			+ '</td>'
                		+ '</tr>'
                		);
            });
        }
    });
});

$(function(){
    var $cancellable_exams = $('#cancellable-exams');
    
    $.ajax({
        type: 'GET',
        url: '/RegStudentExam/view/list_cancellable_exams',
        success: function(exams) {
            $.each(exams, function(i, exam) {
                $cancellable_exams.append('<tr>'
                		+ '<td>' + exam.examId + '</td>'
                		+ '<td>' + exam.name + " " + exam.modId + '</td>'
                		+ '<td>' + exam.examDate + '</td>'
                		+ '<td>' + exam.deadline + '</td>'
                		+ '<td>'
            			+ '<form method="post" action="/RegStudentExam/view/cancel_exam/1/'	//currently assume stuID = 1
            			+ exam.examId + '"><button type="submit">Deregister</button></form>'
            			+ '</td>'
                		+ '</tr>'
                		);
            });
        }
    });
});