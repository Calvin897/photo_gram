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
  });
});
