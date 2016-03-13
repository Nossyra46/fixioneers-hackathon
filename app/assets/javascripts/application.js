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
//= require twitter/bootstrap
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require_tree .

$(document).ready(function () {

  $('#text-modal-single').hide();
  var id;

  if ($('.modal-btn').length) {
    $('.modal-btn').click(function (event) {
      event.preventDefault();
      $('#text-modal-single').show();
      id = event.target.id;
      // console.log(event.target);
      return id;
    });

    $('#close-modal').click(function (event) {
      event.preventDefault();
      $('#text-modal-single').hide();
    });

    $('#send-modal').click(function (event) {
      console.log(event.target.form[0].value);
      event.preventDefault();
      $.ajax({
        type: 'POST',
        url: '/sms/' + id + '/single_message',
        data: {message: event.target.form[0].value},
        success: function (res) {
          console.log(res);
        },
        error: function (err) {
          console.log(err);
        }
      });
      $('#text-modal-single').hide();
    });
  }

});
