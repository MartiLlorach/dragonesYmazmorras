<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>Crear Cuenta</title>
	<?php
		$banderaCrearCuenta = true;
		include 'encabezado.php';
	?>
<div id="paginaCrearCuenta">
	<form id="formularioCrearCuenta" autocomplete="off" method="post">
		<h2>Crea una cuenta</h2>
		<div id="camposFormularios">
			<label>Nombre de usuario:</label>
			<input type="text" id="nuevoUsuario" name="nuevoUsuario" placeholder="Usuario" maxlength="10" required><br>
			<label>Fecha de nacimiento:</label>
			<input type="date" id="nacimiento" name="nacimiento" required><br>
			<label>Correo electrónico:</label>
			<input type="email" id="nuevoCorreo" name="nuevoCorreo" placeholder="Correo electrónico" required><br>
			<label>Contraseña:</label>
			<input type="password" id="nuevaContrasena" name="nuevaContrasena" placeholder="Contraseña" maxlength="10" required><br>
			<label>Repite la contraseña:</label>
			<input type="password" id="nuevaContrasena2" name="nuevaContrasena2" placeholder="Contraseña" maxlength="10" required><br>
		</div>
		<div id="botonesFormulario">
			<button id="salir" onclick="window.location='paginaInicio.php'" accesskey="s">Salir</button>
			<input type="submit" value="Registrarte" accesskey="r">
		</div>
	</form>
</div>
<?php
    if(!isset($_POST["nuevoUsuario"])){
        die();
    }
  	include 'bbdd/bbddConexion.php';
	include 'bbdd/bbddFunciones.php';
	usuarioCorrecto($pdo);
?>
</body>
</html>
