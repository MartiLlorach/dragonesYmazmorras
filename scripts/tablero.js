$( () => {
  $("#botonListadoFichas").click( () => {
    $(location).prop('href', 'listaFichas.php');
  });
  $("#botonCrearFicha").click( () => {
    $(location).prop('href', 'crearFicha.html');
  });
  $("#botonTestearFicha").click( () => {
    $(location).prop('href', 'testeaFicha.html');
  });
})