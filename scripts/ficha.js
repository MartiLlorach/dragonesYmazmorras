$( () => {
    $("#avatar").click( () => {
        $('#divFormularioAvatar').show("fast");
    });
    $("#btnSalirFormulario").click( () => {
        $('#divFormularioAvatar').hide("fast");
    });
})
