<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="crearCuenta.js"></script>
	<title>Crear Cuenta</title>
</head>
<body>
<?php include 'encabezado.php'; ?>
<div id="paginaCrearCuenta">
	<form id="formularioCrearCuenta" autocomplete="off" method="post">
		<h2>Crea una cuenta</h2>
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
		<p id="errores">No hay errores</p>
		<input type="submit" value="Registrarte">
	</form>
	<button id="salir" onclick="salir()">Salir</button>
	<script>
		function salir() {
			window.location="paginaInicio.php";
		}
	</script>
	<?php
		if ($_POST['nuevoUsuario']) {
			$contrasena=$_POST['nuevaContrasena'];
			$contrasena2=$_POST['nuevaContrasena2'];
			echo "<h1>Sies</h1>";
			echo "<script>compararContrasena('$contrasena', '$contrasena2')</script>";
		} else {
			echo "<h1>Noes</h1>";
		}
	?>
</div>
</body>
</html>