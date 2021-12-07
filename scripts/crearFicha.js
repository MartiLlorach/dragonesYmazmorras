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
function conseguirRazas(razasBbdd){
    razas = razasBbdd;
}

function aceptarClick(){
    var count = ($('#crearFicha').children().length) - 1;
    switch (count) {
        case 1:
            toggleNombre();
            insertarSctRazas();
            break;
        case 2:
            toggleRaza();
            //insertar seleccion clase
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
                    src: 'imagenes/razas/' + "AltoElfo" + ".jpeg"
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
                src: 'imagenes/razas/' + razas[$(e.target).val()]['nombre'] + ".jpeg"
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