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

function navigante(main,a,b,c) {
	document.getElementById(main).style.display = "block";
	document.getElementById(a).style.display = "none";
	document.getElementById(b).style.display = "none";
	document.getElementById(c).style.display = "none";
}
function pb_nav(pb_id) {
  pb_id.addClass('prog-focus')
}

function publishTrip() {
	location.href = "../mytrip";
}
function redirect (url) {
  location.href = url;
}
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});

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

function profileupload(lin, olay, D) {
          var link = $( '#profileedit' )[0];
          var overlay = $( '#olay' )[0];
          var TD = $( '#upload-overlay-photo' )[0];

          $( link ).on( 'click', function ( e ) {
              $( overlay ).show();
              $( TD ).show();
              e.stopPropagation();
          });

          $( document ).on( 'click', function ( e ) {
              if ( $( e.target ).closest( TD ).length === 0 ) {
                  $( overlay ).hide();
                  $( TD ).hide();
              }
          });
                          
          $( document ).on( 'keydown', function ( e ) {
              if ( e.keyCode === 27 ) {
                  $( overlay ).hide();
                  $( TD ).hide();
              }
          });
}

function txtInputNotNulla(inputString){
  if (/^(?!\s*$).+/.test(inputString)){
    if (/^(?![0-9]).+/.test(inputString)){
      return [true, error=""]
    }
    return[false, "Cannot begins with Digit"]
  }
  return[false, "Empty Input"]
  
}



function desginatora(func, inputString){
  var valid = func(inputString)
  if (valid[0] == true) {
    return [true, valid[1], flag=0]
  }
  return [false, valid[1], flag=1]
}