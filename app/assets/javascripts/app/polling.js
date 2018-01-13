$( document ).ready(function() {
  var pollActivity = function() {
    $.ajax({
      type:'POST',
      url: "/activities/notify/",
      data: { 'count_now': $('#notification_count_new').text() },
      success: function(data) {

        (data['total_count'] == 0) ? $('.notification-count').hide() : $('.notification-count').show();
        $('.notification-count').text( data['total_count'] );

        if (data['new_notifications']){
          $(".notification_dynamic_content").html("");
          $.each(data['new_notifications'], function(index, activity) {
            $(".notification_dynamic_content").append('<a class="list-group-item" href="'+activity["redirect_url"]+'">\
                          <span class="pull-left thumb-sm"><img class="img-circle" width="24" alt="..." src="'+activity["icon"]+'"></span>\
                          <span class="clear block m-b-none">' + activity["html"] + '<br><small class="text-muted">' + activity["time"] + '</small></span></a>');
          });
        }

      }
    });
  }
  window.pollInterval = window.setInterval( pollActivity, 30000 );

  $(".open_notification_dropdown").on("click", function(e){
    $.ajax({
      type:'PATCH',
      url: "/activities/mark_all_read.json",
      success: function(data) {
        $('#notification_count_new').text("0");
        $('.notification-count').hide();
      }
    });
  });

});
