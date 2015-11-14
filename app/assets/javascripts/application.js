// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//

// window.setInterval('ajaxcall()', 15000);
//
// function ajaxcall() {
//   responce = $.ajax({
//     url: "/refresh/",
//     url: "/teacher_refresh/",
//   });
// }

function teacher_ajaxcall() {
  response = $.ajax({
    url: "/teacher_refresh/",
  });
}

$(function() {
  if ($("#teacher_refresh").length > 0) {
    window.setInterval('teacher_ajaxcall()', 15000);
  }
});

// function student_ajaxcall() {
//   response = $.ajax({
//     url: "/refresh/",
//   });
// }
//
// $(function() {
//   if ($("#student_button").length > 0) {
//     window.setInterval('student_ajaxcall()', 15000);
//   }
// });

function highlight() {
  $(':input.score').click(function() {
    $('input.score').removeClass("blue");
    $(this).addClass("blue");
  });
};

$(highlight)
