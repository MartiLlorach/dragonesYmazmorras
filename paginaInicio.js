function logInCorrecto(user) {
	console.log(user);
	// const url = "tablero.php?usuario=", user;
	window.open("tablero.php?usuario=",user,"_self"); 
}

function logInIncorrecto() {
  	document.getElementById('usuario').style.backgroundColor = "red";
  	document.getElementById('contrasena').style.backgroundColor = "red";
}