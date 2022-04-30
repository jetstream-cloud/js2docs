/* Status.io Widget */

$('.current-status-indicator').ready(function($){
  var statusAPI = " https://7995836472657980.hostedstatus.com/1.0/status/61dc808a7e9a82053ce739d2";
  var maxStatusCode = "";
  var maxStatusDescription = "";
  var sc = "";
  var sd = "";
  $.getJSON(statusAPI)
  .done(function(data){
    $.each(data.result.status, function(s,status){
      $.each(data.result.status[s].containers, function(c,containers){
        sc = data.result.status[s].containers[c].status_code;
        sd = data.result.status[s].containers[c].status;
        if (maxStatusCode < sc){
          maxStatusCode = sc
          maxStatusDescription = sd
        }
      })
    })
    if (maxStatusCode === ""){
      return;
    }
    // Operational
    if (maxStatusCode === 100){
      $(".current-status-indicator").addClass("green");
      $("#current-status-description").text(maxStatusDescription);
    }
    // Scheduled Maintenance
    if (maxStatusCode === 200){
      $(".current-status-indicator").addClass("blue");
      $("#current-status-description").text(maxStatusDescription);
    }
    // Degraded Performance || Partial Outage
    if (maxStatusCode === 300 || maxStatusCode === 400){
      $(".current-status-indicator").addClass("yellow");
      $("#current-status-description").text(maxStatusDescription);
    }
    // Service Disrtuption || Security Issue
    if (maxStatusCode === 500 || maxStatusCode === 600){
      $(".current-status-indicator").addClass("red");
      $("#current-status-description").text(maxStatusDescription);
    }
  })
});
