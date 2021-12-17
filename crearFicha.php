<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="scripts/crearFicha.js"></script>
	<title>Crear Ficha</title>
<?php
    include 'encabezado.php';
    include 'bbdd/bbddConexion.php';
    include 'bbdd/bbddFunciones.php';
    inicializarVariables($pdo);
?>
	<form method="post" id="formFicha" action="ficha.php">
		<input type="hidden" name="insertar" value="1">
		<input type="hidden" name="jugador" value='<?php echo $_SESSION['usuario'] ?>'>
    <div id="crearFicha">
        <div class="div divBotonesNavegacion">
            <button class = "btn btnAceptar" type="button" accesskey="a"><p>Aceptar <i class="fa fa-check"></i></p></button>
            <button class = "btn btnCancelar" type="button" accesskey="c"><p>Cancelar <i class="fa fa-times"></i></p></button>
        </div>
    </div>
	</form>
		<?php include 'pie.php' ?>
  </body>
</html>
