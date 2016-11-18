$(document).ready(function() {
  var student_num = 2;
  var width = $(document).width()/2 - $(document).width()/6;
  $('.add_student').click(function(){
    $('.student_fields').append('\
      <div class="fields">\
        <div class="seven wide field">\
          <label>Name</label>\
          <input type="text" name="student_name' + student_num +  '" placeholder="name">\
        </div>\
        <div class="eight wide field">\
          <label>Email</label>\
          <input type="text" name="student_email' + student_num + '" placeholder="email">\
        </div>\
        <div class="one wide field">\
          <i class="right floated big inverted bottom aligned red remove circle outline icon"></i>\
        </div>\
      </div>\
    ');
    student_num++;
    window.scrollTo(0,document.body.scrollHeight);
  });

  $('.close').click(function(){
    $('.message').hide();
  });

  $(document).on('click','.remove',function() {
     $(this).closest("div.fields").remove();
  });

  $('.delete_cohort').click(function(){
    var id = $(this).attr('data-cohort-id');
    $('#warning_box').css('left', width + 'px').show();
    $('.confirm_delete').click(function(){
      $.get('/cohort/destroy/' + id, function(res){
        $('#warning_box').hide();
        window.location.href = '/dashboard'
      });
    });
  });
  $('.delete_instructor').click(function(){
    var id = $(this).attr('data-instructor-id');
    $('.error_header').html('Are you sure you want to remove this instructor from the cohort?');
    $('#warning_box').css('left', width + 'px').show();
    $('.confirm_delete').click(function(){
      $.get('/instructor/destroy/' + id, function(res){
        window.location.href = '/instructors'
      });
    });
  });
  $('.remove_instructor').click(function(){
    var id = $(this).attr('data-instructor-id');
    var cohortID = $(this).attr('data-cohort-id');
    $('.error_header').html('Are you sure you want to remove this instructor from the cohort?');
    $('#warning_box').css('left', width + 'px').show();
    $('.confirm_delete').click(function(){
      $.get('/instructor/remove/' + id + '/' + cohortID, function(res){
        window.location.href = '/cohort/' + cohortID
      });
    });
  });
  $('.remove_student').click(function(){
    var id = $(this).attr('data-student-id');
    var cohortID = $(this).attr('data-cohort-id');
    $('.error_header').html('Are you sure you want to remove this instructor from the cohort?');
    $('#warning_box').css('left', width + 'px').show();
    $('.confirm_delete').click(function(){
      $.get('/student/remove/' + id + '/' + cohortID, function(res){
        window.location.href = '/cohort/' + cohortID
      });
    });
  });
  $('.add_instructors_button').click(function(){
    $(this).hide();
    $('.add_instructors').show();
  });
  $('.add_students_button').click(function(){
    $(this).hide();
    $('.add_students').show();
    window.scrollTo(0,document.body.scrollHeight);
  });
  $('.cancel_delete').click(function(){
    $('#warning_box').hide();
  });
});
