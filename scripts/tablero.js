$( () => {
  $("#botonListadoFichas").click( () => {
    $(location).prop('href', 'listaFichas.php');
  });
  $("#botonCrearFicha").click( () => {
    $(location).prop('href', 'crearFicha.php');
  });
  $("#botonTestearFicha").click( () => {
    $(location).prop('href', 'testeaFicha.php');
  });
})