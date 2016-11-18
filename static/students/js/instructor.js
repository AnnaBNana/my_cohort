$(document).ready(function() {
  var instructor_num = 2;
  $('.add_instructor').click(function(){
    $('.instructor_fields').append('\
      <div class="fields">\
        <div class="five wide field">\
          <label>Name</label>\
          <input type="text" name="instructor_name' + instructor_num +  '" placeholder="instructor name">\
        </div>\
        <div class="five wide field">\
          <label>Email</label>\
          <input type="text" name="instructor_email' + instructor_num + '" placeholder="instructor email">\
        </div>\
        <div class="five wide field">\
          <label>Role</label>\
          <select class="ui fluid dropdown" name="instructor_role' + instructor_num +  '">\
            <option value="lead">Lead</option>\
            <option value="apprentice">Apprentice</option>\
            <option value="ta">TA</option>\
          </select>\
        </div>\
        <div class="one wide field">\
          <i class="right floated big inverted bottom aligned red remove circle outline icon"></i>\
        </div>\
      </div>'
      );
    instructor_num++;
  });

  $('.close').click(function(){
    $('.message').hide();
  });

  $(document).on('click','.remove',function() {
     $(this).closest("div.fields").remove();
  });
});
