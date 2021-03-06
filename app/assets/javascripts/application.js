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
//= require bootstrap-sprockets
//= require_tree .
$( document ).ready(function() {
  $("#change_green").click(function() {
  	$('.text-primary').toggleClass('text-primary text-success');
  	$('.btn-primary').toggleClass('btn-primary btn-success');
  	$('#change_blue').toggleClass('btn-success btn-primary');

  });

  $("#change_blue").click(function() {
  	$('.text-success').toggleClass('text-success text-primary');
  	$('.btn-success').toggleClass('btn-success btn-primary');
  	$('#change_green').toggleClass('btn-primary btn-success');
  });

  $("#myModal").modal({show:false }); 
});