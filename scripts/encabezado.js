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

// Funcion de alertas

function alerta(txt,tipo){
  //Creacion del div de la alerta y de la cruzeta que lo cierra.
  $('body').append('<div id="alerta" class="alerta"> </div>');
  $('#alerta').append('<span class="closebtn" onclick="this.parentElement.remove();">&times;</span>');

  //Seleccion de tipo de alerta segun los parametros pasados a la funcion
  if (tipo=='mal') {
    $('#alerta').attr('class','alerta mal');
    $('#alerta').append('<p><strong>Peligro!</strong>'+txt+'</p>');
  }else if (tipo=='bien') {
    $('#alerta').attr('class','alerta bien');
    $('#alerta').append('<p><strong>Éxito!</strong>'+txt+'</p>');
  }else if(tipo=='aviso'){
    $('#alerta').attr('class','alerta aviso');
    $('#alerta').append('<p><strong>Cuidado!</strong>'+txt+'</p>');
  }else if(tipo=='info'){
    $('#alerta').attr('class','alerta info');
    $('#alerta').append('<p><strong>Información!</strong>'+txt+'</p>');
  }
}