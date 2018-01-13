$( document ).ready(function() {

  $(".admin_change_password").on("click",function(e){
    e.preventDefault();
    $("#admin_id").val($(this).attr('rel'));
    $("#UpdatePassword").modal('show');
  });

  $("#update_password_button").on("click",function(e){
    e.preventDefault();
    UpdatePasswordForm = $("#UpdatePasswordForm");
    var formData = new FormData( UpdatePasswordForm[0] );
    $.ajax({
      type:'POST',
      url: "/update_password",
      data: formData,
      cache:false,
      contentType: false,
      processData: false,
      success:function(data){

        UpdatePasswordForm.find(".error").remove();
        UpdatePasswordForm.find("input").css("border-color","#ccc");

        if(data["result"] == "yes"){
          location.reload();
        }
        else {
          var error_json = data["error_str"];
          $.each(error_json, function(k, v) {
            $("#admin_"+k).css("border-color","#a94442").siblings().remove();
            $("#admin_"+k).parent().append('<div class="error">'+v[0]+'</div>')
          });
        }
      }
    });
  });
});
