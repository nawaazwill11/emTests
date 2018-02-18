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

function publish() {
	location.href = "mytrip.html";
}
function redirect (url) {
  location.href = url;
}
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});

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
    $(this).siblings('input').prop("readonly",true);
    $(this).siblings('.dact').hide();
    $(this).siblings('select').prop("disabled",true);
    var styles = {"border":"none","cursor":"default","width":"100%"};
    var select_styles = {"border":"none", "-webkit-appearance":"none"};
    $(this).siblings('input').css(styles);
    $(this).siblings('select').css(select_styles);
    alert("Changes Saved");
        
});
$('.edit-cancel').click(function(e){
    e.preventDefault();
    $(this).hide();
    $(this).siblings('.pass').hide();
    $(this).siblings('.passO').prop("type","password");
    $(this).siblings('.passO').prop("value","ooooooooo");
    $(this).siblings('button').css("display", "none");
    $(this).siblings('input').prop("readonly",true);
    $(this).siblings('.dact').hide();
    $(this).siblings('select').prop("disabled",true);
    var styles = {"border":"none","cursor":"default","width":"100%"};
    var select_styles = {"border":"none", "-webkit-appearance":"none"};
    $(this).siblings('input').css(styles);
    $(this).siblings('select').css(select_styles);
    $(this).siblings('input').type = "password";
        
});

