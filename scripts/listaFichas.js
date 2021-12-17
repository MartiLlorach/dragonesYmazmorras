$( () => {
  $('.verFicha').click( () => {
    alerta('No se ha implementado la visualización de fichas','info');
  });
  $('.eliminarFicha').click( () => {
    alerta('No se ha implementado la eliminación de fichas','info');
  });
})


function importarImagen() {
  if ($('#importar')) {
    $('#importar').remove();
  }
  $('body').append('<div id="importar" class="alerta"> </div>');
  $('#importar').append('<span class="closebtn" onclick="this.parentElement.remove();">&times;</span>');

  $('#importar').attr('class','alerta info');
  $('#importar').append('<form action="upload.php" method="post" enctype="multipart/form-data">Selecciona una imagen de tu ordenador:<input type="file" name="imagenACargar" id="fileToUpload"><input type="submit" value="Cargar imagen" name="imagenCargada"></form>');
}