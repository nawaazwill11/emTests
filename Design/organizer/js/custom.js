function leftOpenNav() {
    document.getElementById("leftSidenav").style.width = "280px";
}

function leftCloseNav() {
    document.getElementById("leftSidenav").style.width = "0";
}

function rightOpenNav() {
    document.getElementById("rightSidenav").style.width = "360px";
}

function rightCloseNav() {
    document.getElementById("rightSidenav").style.width = "0";
}

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});

function one() {
    var one = document.getElementById("one");
    var two = document.getElementById("two");
    var three = document.getElementById("three");
    var four = document.getElementById("four");

}

function two() {
    document.getElementById("one");
    document.getElementById("two");
    document.getElementById("three");
    document.getElementById("four");
}

function Three() {
    document.getElementById("one");
    document.getElementById("two");
    document.getElementById("three");
    document.getElementById("four");
}

function four() {
    document.getElementById("one");
    document.getElementById("two");
    document.getElementById("three");
    document.getElementById("four");
}
/*
function save() {
	location.href = "mytrip.html";
}

function abort() {
	location.href = "mytrip.html";
}

function one() {
	location.href = "plan.html";
}

function two() {
	location.href = "plan-2.html";
}
function three() {
	location.href = "plan-3.html";
}
function four() {
	location.href = "plan-4.html";
}
$(document).ready(function(e){
        $(".img-check").click(function(){
        $(this).toggleClass("check");
      });
  });
*/
var button = $( '#open' )[0];
      var elem = $( '#test' )[0];

      $( button ).on( 'click', function ( e ) {
          $( elem ).show();
          e.stopPropagation();
      });

      $( document ).on( 'click', function ( e ) {
          if ( $( e.target ).closest( elem ).length === 0 ) {
              $( elem ).hide();
          }
      });
                      
      $( document ).on( 'keydown', function ( e ) {
          if ( e.keyCode === 27 ) {
              $( elem ).hide();
          }
      });