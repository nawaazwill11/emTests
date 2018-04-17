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

$('.edit-click').click(function(){
    $(this).siblings('.li-2').children('input').prop("readonly",false);
    $(this).siblings('.li-2').children('.pass').show();
    $(this).siblings('.li-2').children('.passO').prop("value","");
    $(this).siblings('.li-2').children('.pass').prop("value","");
    $(this).siblings('.li-2').children('button').show();
    $(this).siblings('.pli-3').children('button').show();
    $(this).siblings('.li-2').children('.dact').show();
    $(this).siblings('.pli-3').children('select').prop("disabled",false);
    var styles = {"border":"lightgrey solid 1px","cursor":"auto","width":"50%"};
    var select_styles = {"border":"lightgrey solid 1px", "-webkit-appearance":"menulist"};
    $(this).siblings('.li-2').children('input').css(styles);
    $(this).siblings('.pli-3').children('select').css(select_styles);
    
});
$('.edit-done').click(function(e){
    e.preventDefault();
    $(this).hide();
    $(this).siblings('.pass').hide();
    $(this).siblings('.passO').prop("type","password");
    $(this).siblings('.passO').prop("value","ooooooooo");
    $(this).siblings('button').css("display", "none");
   // $(this).siblings('input').prop("readonly",true);
    $(this).siblings('.dact').hide();
    $(this).siblings('select').prop("disabled",true);
    var styles = {"border":"none","cursor":"default","width":"100%"};
    var select_styles = {"border":"none", "-webkit-appearance":"none"};
    $(this).siblings('input').css(styles);
    $(this).siblings('select').css(select_styles);
    //alert("Changes Saved");
    $.ajax({
            type: 'POST', 
            url: '#', 
            dataType: 'json',
            data: $('#gen_form').serialize(),
            success: function(x) {   
              if (x['success'] == true) {
                alert('Changes saved!!')
              }     
              else{
                alert('Could not save changes!')
              }
            }
    });
        
});
$('.privdone').click(function(e){
    e.preventDefault();
    $(this).hide();
    $(this).siblings('.pass').hide();
    $(this).siblings('.passO').prop("type","password");
    $(this).siblings('.passO').prop("value","ooooooooo");
    $(this).siblings('button').css("display", "none");
    //$(this).siblings('input').prop("readonly",true);
    $(this).siblings('.dact').hide();
    $(this).siblings('select').prop("disabled",true);
    var styles = {"border":"none","cursor":"default","width":"100%"};
    var select_styles = {"border":"none", "-webkit-appearance":"none"};
    $(this).siblings('input').css(styles);
    $(this).siblings('select').css(select_styles);
    //alert("Changes Saved");
    $.ajax({
            type: 'POST', 
            url: '#', 
            dataType: 'json',
            data: $('#priv_form').serialize(),
            success: function(x) {   
              if (x['success'] == true) {
                alert('Changes saved!!')
              }     
              else{
                alert('Could not save changes!')
              }
            }
    });
        
});
$('.edit-cancel').click(function(e){
    e.preventDefault();
    $(this).hide();
    $(this).siblings('.pass').hide();
    $(this).siblings('.passO').prop("type","password");
    $(this).siblings('.passO').prop("value","ooooooooo");
    $(this).siblings('button').css("display", "none");
   // $(this).siblings('input').prop("readonly",true);
    $(this).siblings('.dact').hide();
    $(this).siblings('select').prop("disabled",true);
    var styles = {"border":"none","cursor":"default","width":"100%"};
    var select_styles = {"border":"none", "-webkit-appearance":"none"};
    $(this).siblings('input').css(styles);
    $(this).siblings('select').css(select_styles);
    $(this).siblings('input').type = "password";
        
});


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