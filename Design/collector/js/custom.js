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

function addItem(){
  var ul = document.getElementById("loc-attr");
  var candidate = document.getElementById("add-attr");
  var li = document.createElement("li");
  li.setAttribute('id',candidate.value);
  li.appendChild(document.createTextNode(candidate.value));
  ul.appendChild(li);
}

function removeItem(){
  var ul = document.getElementById("loc-attr");
  var candidate = document.getElementById("add-attr");
  var item = document.getElementById(candidate.value);
  ul.removeChild(item);
}