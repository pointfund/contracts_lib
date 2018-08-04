// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//



//= require jquery
//= require turbolinks
//= require activestorage
//= require_tree .
//= require jquery

//= require jquery_ujs
//= require bootstrap-sprockets


console.log("before load");

$( document ).ready(function() {

console.log("moo during you sick sick being");

   $("#hide").click(function(){
    $("p").hide();
   });
});

// $(document).on 'turbolinks:load', ready

console.log(" after load");
// document.addEventListener("turbolinks:load", function() {
//  alert("ok!")
// });

// $(document).ready(function(){
// alert("what do you want");
// // console.log("after load ");
// // 	$(".click-part").click(function(){
// // 		alert("on click");
// // 		// $( this ).toggleClass("clicked");
// // 	});

// 	// $(".accord-btn").click(function(){
// 	// 	$(".collapse").toggleClass("active");
// 	// });



// });

// $(document).ready(function(){
// // alert("what do you want");
// 	$(".click-part").click(function(){
// 		alert("what do you want");
// 	// 	$(this).alert();
// 	// 	// $( this ).toggleClass("clicked");


// 	});

// 	// $(".accord-btn").click(function(){
// 	// 	$(".collapse").toggleClass("active");
// 	// });



// });
