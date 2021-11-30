$( () => {
  $('#botonUsuario').click( () => {
    cambiarDespleglable();
  });
  $('#botonCasa').click( () => {
    $(location).prop('href', 'tablero.php');
  });
  $('#cierraSesion').click( () => {
    $(location).prop('href', 'logout.php');
  });
})

function cambiarDespleglable(){
  $('#encabezadoDesplegable').toggleClass("show");
}
