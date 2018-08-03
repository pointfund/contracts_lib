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
//= require rails-ujs

console.log("before load");



$(document).ready(function(){
// alert("what do you want");
console.log("after load ");
	$(".click-part").click(function(){
		alert("on click");
		// $( this ).toggleClass("clicked");
	});

	// $(".accord-btn").click(function(){
	// 	$(".collapse").toggleClass("active");
	// });



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



});
