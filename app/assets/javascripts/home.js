// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$( document ).ready(function() {

	$(function() {
    var flashCallback;
    flashCallback = function() {
        return $(".alert").fadeOut();
    };
    $(".alert").bind('click', (function(_this) {
        return function(ev) {
            return $(".alert").fadeOut();
        };
    })(this));
    return setTimeout(flashCallback, 2000);

	});

    $('.js_text').froalaEditor();

});