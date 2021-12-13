$( () => {
  $("#botonListadoFichas").click( () => {
    $(location).prop('href', 'listaFichas.php');
  });
  $("#botonCrearFicha").click( () => {
    $(location).prop('href', 'crearFicha.php');
  });
  $("#botonTestearFicha").click( () => {
    //$(location).prop('href', 'testeaFicha.php');
    alerta('Aún no se ha implementado la funcionalidad de este botón','info');
  });
})
