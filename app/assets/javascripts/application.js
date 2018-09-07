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
var psge_A = [0, 1, 2, 4, 5, 6, 7, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
var psge_B = [0, 1, 2, 4, 5, 6, 7, 8, 9, 10 ];
var psge_C = [0, 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
var psge_D = [0, 1, 2, 4, 5, 6, 7, 8 ];
var psge_E = [0, 1, 2, 4, 5, 6, 7, 8, 9, 10, 13, ];
var psge_F = [0, 1, 2, 4, 5, 6, 7, 8, 9, 10];
var psge_G = [0, 1, 2, 4, 5, 6, 7, 8, 9, 10];
var psge_H = [0, 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
var psge_I = [0, 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];














// switch(expression) {
//     case x:
//         code block
//         break;
//     case y:
//         code block
//         break;
//     default:
//         code block
// }


var sampl = [2, 4, 5, 6, 7, 8];

// var required = []
// $(".form-control").eq( 3 ).css( "background-color", "#88f" );

// $pizza.css('background-color', '#88f');
// console.log( $(".form-control").get(3).css("background-color") );
console.log("hello");
recs = $(".form-control");
// var picks = [1]

// required[3].css('background-color', '#111');

for (var i = 0;  i <= recs.length - 1 ; i++) {
	// required.push( $(".form-control") );
	if(psge_A.includes(i)){
		$(".form-control").eq( i ).css( "background-color", "#aaead7" );
		// if(picks.includes(i)){
		// 	$(".form-control").css('background-color', '#88f');
		// }
	}
}






// required[0].css('background-color', '#88f');

// required[2].css('background-color', '#88f');
// console.log(required.length + " : person");


	$(".info-item .btn").click(function() {
	  $(".container").toggleClass("log-in");
	});
	$(".container-form .btn").click(function() {
	  $(".container").addClass("active");
	});
// $(".thumbnail img").hover(function() {
// 	$(this).css("border", "10px solid blue");
// });

	// console.log("moo during you sick sick being");
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
					var my_page = "#page_" + v;

					$(my_page + ' .btn-success').slideUp("10", "linear") ;
					// $(my_page + ' .thumbnail').slideUp("10", "linear") ;
					// $(my_page + ' .thumbnail').slideUp("10", "linear") ;
					$(my_page + ' .viewer-image').addClass("remove-page") ;
					$(my_page + ' .panel-button').css('background-color', '#88f');
					$(my_page).css('opacity', '0.7');
				}
				else{
					// $(my_page + ' .btn-success').slideUp("10", "linear") ;
				}
			}
		}


	var mars = $('.panel_selection');

		for (var i = 0;  i <= mars.length - 2 ; i++) {
			var my_page = "#page_" + i;
			if($(my_page + ' .viewer-image').hasClass("remove-page") != true ){
				$(my_page + ' .btn-warning').slideUp("10", "linear") ;
			} 
		}
		// $('#page_1').click(function(){
		// 	$('#page_1 .thumbnail').slideUp("30", "linear") ;
		// 	$('#page_1 .thumbnail').slideDown("100", "linear") ;

		//  });
		// $(my_page + ' .thumbnail').css('border', '5px solid red');
		// var my_page = "#page_" + found;
		// $(my_page + ' .thumbnail').css('border', '5px solid red');

		// $('#page_1 .thumbnail').css('border', '5px solid #111');

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
