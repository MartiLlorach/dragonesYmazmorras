$( () => {
    $(".btnAceptar").click( () => {
        aceptarClick();
    });
    $(".btnCancelar").click( () => {
        cancelarClick();
    });

    insertarInpNombre();
} )

var razas;
function definirRazas(razasBbdd){
    razas = razasBbdd;
}
var clases;
function definirClases(clasesBbdd){
    clases = clasesBbdd;
}
var trasfondos;
function definirTrasfondos(trasfondosBbdd){
    trasfondos = trasfondosBbdd;
}
var idiomas;
function definirIdiomas(idiomasBbdd){
    idiomas = idiomasBbdd;
}

function aceptarClick(){
    var count = ($('#crearFicha').children().length) - 1;
    switch (count) {
        case 1:
            if ($("#InpNombrePersonaje").val()==''){
                alerta("Escribe un nombre","aviso");
            } else {
                toggleNombre();
                insertarSctRazas();
            }
            break;
        case 2:
            if (($("#sctRaza").val() == null) || ($("#sctSubraza").length == 1 && $("#sctSubraza").val() == null)) {
                alerta("Selecciona una raza","aviso");
            } else {
                toggleRaza();
                insertarSctClases();
            }
            break;
        case 3:
            if ($("#sctClase").val() == null) {
                alerta("Selecciona una clase","aviso");
            } else {
                toggleClase();
                insertarSctHabilidades();
            }
            break;
        case 4:
            toggleHabilidades();
            insertarSctTrasfondos();
            break;
        case 5:
            if ($("#sctTrasfondo").val() == null) {
                alerta("Selecciona un trasfondo","aviso");
            } else {
                toggleTrasfondo();
                insertarSctIdiomas();
            }
            break;
        case 6:
            toggleIdioma();
            break;
    }
}
function cancelarClick(){
    var count = ($('#crearFicha').children().length) - 1;
    switch (count) {
        case 1:
            $(location).prop('href', 'tablero.php');
            break;
        case 2:
            $("#divRaza").remove();
            toggleNombre();
            break;
        case 3:
            $("#divClase").remove();
            toggleRaza();
            break;
        case 4:
            $("#divHabilidades").remove();
            toggleClase();
            break;
        case 5:
            $("#divTrasfondo").remove();
            toggleHabilidades();
            break;
        case 6:
            $("#divIdioma").remove();
            toggleTrasfondo();
            break;
    }

}


function insertarInpNombre(){
    $('<div>', {
        id: 'divNombrePersonaje',
        class: 'div divNombre'
    }).insertBefore('.divBotonesNavegacion');
    $('<label>', {
        id: 'lblNombrePersonaje',
        class: 'lbl lblNombre',
        for: 'InpNombrePersonaje',
        text: 'Nombre de tu personaje: '
    }).appendTo('#divNombrePersonaje');
    $('<input>', {
        id: 'InpNombrePersonaje',
        class: 'inp inpNombre'
    }).appendTo('#divNombrePersonaje');
}
function toggleNombre(){
    if ($('#InpNombrePersonaje').attr("disabled")){
        $('#InpNombrePersonaje').attr("disabled", false);
    } else {
        $('#InpNombrePersonaje').attr("disabled", true);
    }
}

function insertarSctRazas(){
    $('<div>', {
        id: 'divRaza',
        class: 'div divRaza'
    }).insertBefore('.divBotonesNavegacion');
    $('<label>', {
        class: 'lbl lblRaza',
        text: 'Escoge una raza:',
        for: 'sctRaza'
    }).appendTo("#divRaza");
    $('<select>', {
        name: 'raza',
        id: 'sctRaza'
    }).appendTo("#divRaza");
    $('<option>', {
        disabled: true,
        selected: true,
        hidden: true,
        text: "Clica para ver las razas"
    }).appendTo("#sctRaza");
    for (var raza in razas){
        if (!razas[raza]['id_padre']){
            $('<option>', {
                value: raza,
                text: razas[raza]['nombre']
            }).appendTo("#sctRaza");
        }
    }

    $("#sctRaza").change( (e) => {

        if ($('#descripcionRaza').length) {
            $('#descripcionRaza').remove();
        }
        if ($('#sctSubraza').length) {
            $('#sctSubraza').remove();
            $('#lblSubraza').remove();

        }

        var padre = false;
        for (var raza in razas){
            if (razas[raza]['id_padre'] == $(e.target).val()){
                padre = true;
            }
        }

        if (padre) {

            $('<label>', {
                class: 'lbl lblRaza',
                id: 'lblSubraza',
                text: 'Escoge una subraza:',
                for: 'sctSubraza'
            }).appendTo("#divRaza");
            $('<select>', {
                name: 'subraza',
                id: 'sctSubraza',
            }).appendTo("#divRaza");
            $('<option>', {
                disabled: true,
                selected: true,
                hidden: true,
                text: "Clica para ver las subrazas"
            }).appendTo("#sctSubraza");
            for (var raza in razas){
                if (razas[raza]['id_padre'] == $(e.target).val()){
                    $('<option>', {
                        value: raza,
                        text: razas[raza]['nombre']
                    }).appendTo("#sctSubraza");
                }
            }

            $("#sctSubraza").change( (e2) => {

                if ($('#descripcionRaza').length) {
                    $('#descripcionRaza').remove();
                }

                $('<div>', {
                    id: 'descripcionRaza',
                    class: 'descripcion'
                }).appendTo('#divRaza');
                $('<img>', {
                    src: 'imagenes/razas/' + (razas[$(e2.target).val()]['nombre']).replace(/\s+/g, '') + ".jpeg"
                }).appendTo('#descripcionRaza');
                $('<p>', {
                    text: razas[razas[$(e2.target).val()]["id_padre"]]["descripcion"]
                }).appendTo('#descripcionRaza');
            });

        } else {
            $('<div>', {
                id: 'descripcionRaza',
                class: 'descripcion'
            }).appendTo('#divRaza');
            $('<img>', {
                src: 'imagenes/razas/' + razas[$(e.target).val()]['nombre'].replace(/\s+/g, '') + ".jpeg"
            }).appendTo('#descripcionRaza');
            $('<p>', {
                text: razas[$(e.target).val()]["descripcion"]
            }).appendTo('#descripcionRaza');
        }
    });
}

function toggleRaza(){
    if ($('#sctRaza').attr("disabled")){
        $('#sctRaza').attr("disabled", false);
    } else {
        $('#sctRaza').attr("disabled", true);
    }
    if ($('#sctSubraza').attr("disabled")){
        $('#sctSubraza').attr("disabled", false);
    } else {
        $('#sctSubraza').attr("disabled", true);
    }
}

function insertarSctClases(){
    $('<div>', {
        id: 'divClase',
        class: 'div divClase'
    }).insertBefore('.divBotonesNavegacion');
    $('<label>', {
        class: 'lbl lblClase',
        text: 'Escoge una clase:',
        for: 'sctClase'
    }).appendTo("#divClase");
    $('<select>', {
        name: 'clase',
        id: 'sctClase'
    }).appendTo("#divClase");
    $('<option>', {
        disabled: true,
        selected: true,
        hidden: true,
        text: "Clica para ver las clases"
    }).appendTo("#sctClase");
    for (var clase in clases){
        $('<option>', {
            value: clase,
            text: clases[clase]['nombre']
        }).appendTo("#sctClase");
    }

    $("#sctClase").change( (e) => {

        if ($('#descripcionClase').length) {
            $('#descripcionClase').remove();
        }

        $('<div>', {
            id: 'descripcionClase',
            class: 'descripcion'
        }).appendTo('#divClase');
        $('<img>', {
            src: 'imagenes/clases/' + clases[$(e.target).val()]['nombre'].replace(/\s+/g, '') + ".jpeg"
        }).appendTo('#descripcionClase');
        $('<p>', {
            text: clases[$(e.target).val()]["descripcion"]
        }).appendTo('#descripcionClase');

    });
}

function toggleClase(){
    if ($('#sctClase').attr("disabled")){
        $('#sctClase').attr("disabled", false);
    } else {
        $('#sctClase').attr("disabled", true);
    }
}

function insertarSctHabilidades(){
  let puntos = 27;

  let costes = {
    8:0,
    9:1,
    10:2,
    11:3,
    12:4,
    13:5,
    14:7,
    15:9
  }

  $("<div>", {
    id: "divHabilidades",
    class: "div divHabilidades"
  }).insertBefore('.divBotonesNavegacion');
  $("<h4>" , {
    id: 'h4Puntuacion',
    text: "27/27"
  }).appendTo("#divHabilidades");
  $("<div>", {
    id: "contenedorHabilidades"
  }).appendTo("#divHabilidades");
  let habilidades = ["Fuerza", "Destreza", "Constitución", "Inteligencia", "Sabiduría", "Carisma"];
  for (var i = 0; i < habilidades.length; i++) {
    $("<div>", {
      id: `div${habilidades[i]}`,
      class: "divHabilidad"
    }).appendTo('#contenedorHabilidades');
    $("<label>", {
      class: "lbl lblHabilidad",
      for: `sct${habilidades[i]}`,
      text: `${habilidades[i]}`
    }).appendTo(`#div${habilidades[i]}`);
    $("<select>", {
      class: "sctHabilidad",
      id: `sct${habilidades[i]}`
    }).appendTo(`#div${habilidades[i]}`);
    $("<option>", {
      text: 8,
      value: 8,
      puntos: 0,
      selected: true
    }).appendTo(`#sct${habilidades[i]}`);

    let selected = parseInt($(`#sct${habilidades[i]}`).val());
    for (var j = 9; j <= 15; j++) {
      let diferencia = costes[selected] - costes[j];
      if ( diferencia>0 ) {
        diferencia = "+" +diferencia;
      }
      let textoOpcion = j + " (" + diferencia + " puntos)";
      $("<option>", {
        text: textoOpcion,
        value: j,
        puntos: costes[j]
      }).appendTo(`#sct${habilidades[i]}`);
    }
  }

  let anteriores = {
    "sctFuerza" : 8,
    "sctDestreza" : 8,
    "sctConstitución" : 8,
    "sctInteligencia" : 8,
    "sctSabiduría" : 8,
    "sctCarisma" : 8
  };
  $(".sctHabilidad").change( (e) => {
    let selected = $(e.target).val();

    puntos += costes[anteriores[$(e.target).attr('id')]]-costes[selected];
    if (puntos<0){
      alerta("No puedes tener puntos de compra negativos","aviso");
      puntos -= costes[anteriores[$(e.target).attr('id')]]-costes[selected];
      $(e.target).val(anteriores[$(e.target).attr('id')]);
    } else {
      anteriores[$(e.target).attr('id')] = selected;

      $("#h4Puntuacion").remove();
      $("<h4>", {
        text: `${puntos}/27`,
        id: "h4Puntuacion"
      }).prependTo("#divHabilidades");

      $(e.target).empty();

      for (var j = 8; j<=15; j++){
        if (j == selected){
          $("<option>", {
            text: j,
            val: j,
            puntos: costes[selected] - costes[j],
            selected: true
          }).appendTo($(e.target));
        } else {
          let diferencia = costes[selected] - costes[j];
          if ( diferencia>0 ) {
            diferencia = "+" +diferencia;
          }
          let textoOpcion = j + " (" + diferencia + " puntos)";
          $("<option>", {
            text: textoOpcion,
            value: j,
            puntos: costes[selected] - costes[j]
          }).appendTo($(e.target));

        }
      }
    }
  });
}

function toggleHabilidades(){
  if ($(".sctHabilidad").attr("disabled")){
      $('.sctHabilidad').attr("disabled", false);
  } else {
      $('.sctHabilidad').attr("disabled", true);
  }
}

function insertarSctTrasfondos(){
    $('<div>', {
        id: 'divTrasfondo',
        class: 'div divTrasfondo'
    }).insertBefore('.divBotonesNavegacion');
    $('<label>', {
        class: 'lbl lblTrasfondo',
        text: 'Escoge un trasfondo:',
        for: 'sctTrasfondo'
    }).appendTo("#divTrasfondo");
    $('<select>', {
        name: 'trasfondo',
        id: 'sctTrasfondo'
    }).appendTo("#divTrasfondo");
    $('<option>', {
        disabled: true,
        selected: true,
        hidden: true,
        text: "Clica para ver los trasfondos"
    }).appendTo("#sctTrasfondo");
    for (var trasfondo in trasfondos){
        $('<option>', {
            value: trasfondo,
            text: trasfondos[trasfondo]['nombre']
        }).appendTo("#sctTrasfondo");
    }

    $("#sctTrasfondo").change( (e) => {

        if ($('#descripcionTrasfondo').length) {
            $('#descripcionTrasfondo').remove();
        }

        $('<div>', {
            id: 'descripcionTrasfondo',
            class: 'descripcion'
        }).appendTo('#divTrasfondo');
        $('<p>', {
            text: trasfondos[$(e.target).val()]["descripcion"]
        }).appendTo('#descripcionTrasfondo');

    });
}

function toggleTrasfondo(){
    if ($('#sctTrasfondo').attr("disabled")){
        $('#sctTrasfondo').attr("disabled", false);
    } else {
        $('#sctTrasfondo').attr("disabled", true);
    }
}

function insertarSctIdiomas(){
    $('<div>', {
        id: 'divIdioma',
        class: 'div divIdioma'
    }).insertBefore('.divBotonesNavegacion');
    var numIdiomas = conseguirNumeroIdiomas();

    if (numIdiomas != 0) {
        var stringIdiomas = "idiomas";
        if (numIdiomas==1) {
            stringIdiomas = "idioma";
        }
        $('<h4>', {
            class: 'h4 h4Idioma',
            text: 'Escoge ' + numIdiomas + ' ' + stringIdiomas,
        }).appendTo("#divIdioma");
        for (var idioma in idiomas){
            $("<input>", {
                type: "checkbox",
                name: idiomas[idioma]["nombre"],
                id: idiomas[idioma]["nombre"],
                class: "ckbIdioma"
            }).appendTo("#divIdioma");
            $("<label>", {
                for: idiomas[idioma]["nombre"],
                text: idiomas[idioma]["nombre"]
            }).appendTo("#divIdioma");
        }
    } else {
        $('<h4>', {
            class: 'h4 h4Idioma',
            text: "No tienes idiomas a elegir"
        }).appendTo("#divIdioma");
    }

    $(".ckbIdioma").change( (e) => {

        if ($(".ckbIdioma:checked").length > numIdiomas){
            if (numIdiomas = 1) alerta(`Solo puedes tener ${numIdiomas} idioma`,"aviso");
            else alerta(`Solo puedes tener ${numIdiomas} idiomas`,"aviso");
            $(e.target).prop("checked", false);
        }


    });
}

function toggleIdioma(){
    if ($('.ckbIdioma').attr("disabled")){
        $('.ckbIdioma').attr("disabled", false);
    } else {
        $('.ckbIdioma').attr("disabled", true);
    }
}

function conseguirNumeroIdiomas(){
    var raza = $("#sctRaza").val();
    var subraza = $("#sctSubraza").val();
    var clase = $("#sctClase").val();
    var trasfondo = $("#sctTrasfondo").val();

    var numIdiomas = 0;
    numIdiomas += parseInt(razas[raza]["idiomas_elegir"]);
    if (subraza) {
        numIdiomas += parseInt(razas[subraza]["idiomas_elegir"]);
    }
    numIdiomas += parseInt(clases[clase]["idiomas_elegir"]);
    numIdiomas += parseInt(trasfondos[trasfondo]["idiomas_elegir"]);

    return numIdiomas;
}
