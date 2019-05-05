$(function(){
    var $available_exams r = $('#available-exams');
    
    $.ajax({
        type: 'GET',
        url: ''   ,
        success: function(exams) {
            $.each(exams, function(i, exam) {
                $available_exams.append('');
            });
        }
    });
});