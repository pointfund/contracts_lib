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

	$(".info-item .btn").click(function() {
	  $(".container").toggleClass("log-in");
	});
	$(".container-form .btn").click(function() {
	  $(".container").addClass("active");
	});









	
	console.log("moo during you sick sick being");
	// $("#hide").click(function(){
	// 	$("p").hide();
	// });
	// $(".panel-main").toggleClass("panel-show").fadeIn();

	// $(".panel-button-basic").click(function(){
	// 	// alert("hello");
	// 	$(".panel-basic").toggleClass("panel-show");
	// });
	function record_display(){
		$(".panel-name").slideToggle();

		$(".panel-button-name").click(function(){
			// alert("name");
			$(".panel-name").slideToggle();
			// $(".panel-button-name").css("background-color", "#fff");
			$(this).toggleClass("panel-button-alert");
		});

		$(".panel-button-client ").click(function(){
		// alert("hello");
			$(".panel-client").slideToggle();
			$(this).toggleClass("panel-button-alert");
		});	

		$(".panel-button-agent ").click(function(){
		// alert("hello");
			$(".panel-agent").slideToggle();
			$(".panel-page").toggleClass("panel-button-alert");
		});

	}
	// $(".panel-page ").click(function(){
	// alert("hello");
		// $(".panel_selection-page").slideToggle();
		// $(this).toggleClass("panel-button-alert");
	// });
	function high_page(){
		var que = $("#mark").text();
		console.log(que + " in que");
		que.replace(/\s+/g, '');
		var newque = que.split(',').map(Number);

		

		var found = $(".clicked");
		console.log(found);
		for (var i = 0;  i <= newque.length - 2 ; i++) {
			console.log(newque[i] + " picked ");
			for (var v = 0;  v <= found.length - 1; v++) {
				if(v == newque[i]){
					$(".clicked:nth-child(1)").css("border", "3px solid red");
				} 
			}
		}



		// for (var i = 0;  i <= newque.length - 1; i++) {
		// 	var newvar = newque[i];
		// 	console.log(newque[i] + " show " + "out of " + found.length + " in list ");
		// 	found.filter(function(index){
		// 		// console.log(index + 1);
		// 	if(found.includes(newque[i])){
		// 		var gotya = found[index];
		// 		console.log("found one :" + newque[i] );
		// 		$(gotya).css("background-color","#f0e");
		// 	}

		// });
			// if(found[newque[i]] != null){
			// 	found[newque[i]].css("border", "2px solid yellow")
			// }
			// console.log(found.length);
			// $.inArray( found,  newque[i]) ;
			// $(".panel_selection:nth-of-type()").css("border", "2px solid yellow");
			// .css("border", "2px solid yellow").css( "background-color", "blue" );;
			
			// $(".panel_selection").filter(i).css("opacity", "0.5");
		}
	// } 
	// );
	// arr = jQuery.grep(newque, function( n, i ) {
	//   return ( n !== 5 && i > 4 );
	// });
	// $(".page-selection .clicked:nth-child(1)").css("border", "3px solid red");
	// $(".clicked").filter(":even").css("border", "3px solid red");
	// $(".clicked").filter("2").css("border", "4px solid yellow");
	document.addEventListener("turbolinks:load", function() {
		record_display();
		high_page();
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
