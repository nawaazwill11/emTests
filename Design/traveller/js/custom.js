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
    document.getElementById("one").style.zIndex = "20";
    document.getElementById("two").style.zIndex = "19";
    document.getElementById("three").style.zIndex = "19";
    document.getElementById("four").style.zIndex = "19";
}

function two() {
    document.getElementById("one").style.zIndex = "19";
    document.getElementById("two").style.zIndex = "20";
    document.getElementById("three").style.zIndex = "19";
    document.getElementById("four").style.zIndex = "19";
}

function Three() {
    document.getElementById("one").style.zIndex = "19";
    document.getElementById("two").style.zIndex = "19";
    document.getElementById("three").style.zIndex = "20";
    document.getElementById("four").style.zIndex = "19";
}

function four() {
    document.getElementById("one").style.zIndex = "19";
    document.getElementById("two").style.zIndex = "19";
    document.getElementById("three").style.zIndex = "19";
    document.getElementById("four").style.zIndex = "20";
}

function save() {
	location.href = "mytrip.html";
}

function abort() {
	location.href = "mytrip.html";
}


$(document).ready(function(e){
        $(".img-check").click(function(){
        $(this).toggleClass("check");
      });
  });