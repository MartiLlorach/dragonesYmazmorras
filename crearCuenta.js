function enviarFormulario() {
	console.log("Cuenta creada con éxito");
	window.location("paginaInicio.php");
}

function compararContrasena(contrasena, contrasena2) {
	if (contrasena === contrasena2) {
		console.log("Las contraseñas coinciden");
		comprobarUsuario(usuario);
	}
	else {
		console.log("Las contraseñas no coinciden");
		document.getElementById['errores'].innerHTML="Las contraseñas no coinciden";
		// mostrarError("Las contraseñas no coinciden");
	}
}

function comprobarUsuario(usuario) {

}

function mostrarError(error) {
	console.log("Entrando en mostrarError()");
	//var span = $(#nuevaContrasena2).after($('<span />').addClass('error').html(error));
}