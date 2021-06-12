// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "jquery";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

window.loadFile = function(event) {
  var output = document.getElementById("image-preview");
  output.src = URL.createObjectURL(event.target.files[0]);
};

import "controllers";
$(document).on("turbolinks:load", function() {
  $(document).ready(function() {
    $(".more-comments").click(function() {
      $(this).on("ajax:success", function(event) {
        var postId = $(this).data("post-id");
        $("#comments_" + postId).html(event.detail[2].responseText);
        $("#comments-paginator-" + postId).html(
          "<a id='more-comments' data-post-id=" +
            postId +
            "data-type='html' data-remote='true' href='/posts/" +
            postId +
            "/comments>show more comments</a>"
        );
      });
    });

    // $(".js-hit-my-controller").click(function() {
    //   var wednesdayVar = $(this).attr("wednesday_baby");
    //   var imGayVar = $(this).attr("im_gay");
    //   var donkeyArmsVAr = $(this).attr("donkey_string");
    //   var clownHeadVar = $(this).attr("clown_id");

    //   var theUser = $(this).attr("users_id");

    //   $.ajax({
    //     type: "GET",
    //     url: "/coolio_man?im_gay=" + imGayVar + "&clownhead=" + clownHeadVar,
    //     // data: $(this).serialize(),  this is for wrapping your url in a string i think, google me
    //     data: {
    //       im_the_params: {
    //         donkey_arms: donkeyArmsVAr,
    //         wendnesday: wednesdayVar,
    //         user_id: theUser
    //       }
    //     },
    //     success: function(response) {
    //       alert("we back from controller here");
    //     }
    //   });
    // });

    // $(".js-nav-bar").click(function() {
    // var reads = $(this).attr("js-nav-bar");

    // $.ajax({
    //   type: "GET",
    //   url: "/seen?",
    // data: $(this).serialize(),  this is for wrapping your url in a string i think, google me
    // data: {
    //   read: true
    // },
    // success: function(response) {
    //   alert("we back from controller here");
    // $("js-reset").html(
    //   "<%=j render partial: 'shared/notices/notice_dropdown' %>"
    // );
    //     }
    //   });
    // });
  });
});
