<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="scripts/crearFicha.js"></script>
	<title>Tus Fichas</title>
<?php 
    include 'encabezado.php';
    include 'bbdd/bbddConexion.php';
    include 'bbdd/bbddFunciones.php';
    conseguirRazas($pdo);        
?>
    <div id="crearFicha">
        <div class="div divBotonesNavegacion">
            <button class = "btn btnAceptar"><p>Aceptar <i class="fa fa-check"></i></p></button>
            <button class = "btn btnCancelar"><p>Cancelar <i class="fa fa-times"></i></p></button>
        </div>
    </div>
  </body>
</html>