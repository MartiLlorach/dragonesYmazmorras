/* function passwordOlvidada() {
	alert("Se ha enviado un correo electrónico para recuperar la contraseña");
} */

function mostrarMenuUsuario() {
  var x = document.getElementById("menuUsuario");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}