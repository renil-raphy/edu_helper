$( document ).ready(function() {

  $("#switch_automation").on("change", function(e){
    var switch_automation_button = $("#switch_automation");

    if ($(this).is(':checked')) {
      if (confirm("Are you sure to activate scheduling?") == true) {
        $.ajax({ url: $(this).val()+".json",
          async: false,
          type: 'PATCH',
          dataType: 'json',
          success: function(data) {
            if (data["status"] == true){
              location.reload();
            }
            else {
              window.location.href = data["redirect_uri"];
            }
          }
        });
      }
      else {
        switch_automation_button.removeAttr("checked");
      }
    }
    else {
      if (confirm("Are you sure to deactivate scheduling? It will remove all the existing scheduled posts.") == true) {
        $.ajax({ url: $(this).val()+".json",
          async: false,
          type: 'DELETE',
          dataType: 'json',
          success: function(data) {
            if (data["status"] == true){
              location.reload();
            }
            else {
              alert(data["message"]);
            }
          }
        });
      }
      else {
        switch_automation_button.prop('checked', true);
      }
    }

  });
  
});
