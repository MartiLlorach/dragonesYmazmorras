$( () => {
  $('#botonUsuario').click( () => {
    cambiarDespleglable();
  });
  $('#botonCasa').click( () => {
    $(location).prop('href', 'index.php')
  });
})

function cambiarDespleglable(){
  $('#encabezadoDesplegable').toggleClass("show");
}
