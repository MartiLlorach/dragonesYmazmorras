<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>D&D Generador de fichas</title>
<?php include 'encabezado.php'; ?>
	<div id="paginaInicio">
		<div id="paginaInicioIzq">
			<img src="imagenes/logoDnd.png">
			<p>
				Bienvenido al generador de fichas para D&D 5e, en este generador podras generar tus fichas y posteriormente enfrentarlas para ver cómo rendirian en el juego real.
			</p>
		</div>
		<div id="paginaInicioDer">
			<form id="formularioLogin" autocomplete="off" method="post">
				<h2>Iniciar sesión</h2>
				<input type="text" id="usuario" name="usuario" placeholder="Usuario" maxlength="10" required>
				<input type="password" id="contrasena" name="contrasena" placeholder="Contraseña" maxlength="10" required>
				<input type="submit" value="Entrar">
				<a class="link"><u>¿Has olvidado la contraseña?</u></a>
			</form>
			<button id="crearCuenta" onclick="crearCuenta()">Crear una cuenta nueva</button>
			<script>
				function crearCuenta() {
					window.location="crearCuenta.php";
				}
			</script>
			<?php
				include 'bbdd/bbddConexion.php';
				include 'bbdd/bbddFunciones.php';
			  if(isset($_POST["usuario"])){
					login($_POST["usuario"], $_POST["contrasena"], $pdo);
		    }

		  ?>
		</div>
	</div>
</body>
</html>
