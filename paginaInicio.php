<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>D&D Generador de fichas</title>
<?php
	$banderaInicio = true;
	include 'encabezado.php';
	if (isset($_SESSION['creacion'])){
		echo "<script>alerta('Cuenta creada con éxito.','bien');</script>";
		unset($_SESSION['creacion']);
	}
?>
	<div id="paginaInicio">
		<div id="paginaInicioIzq">
			<img src="imagenes/logoDnd.png">
			<p>
				Bienvenido al generador de fichas para D&D 5e, en este generador podrás generar tus fichas y posteriormente enfrentarlas para ver cómo rendirían en el juego real.
			</p>
		</div>
		<?php
			if (!isset($_SESSION["usuario"])) {
		?>
		<div id="paginaInicioDer">
			<form id="formularioLogin" autocomplete="off" method="post">
				<h2>Iniciar sesión</h2>
				<input type="text" id="usuario" name="usuario" placeholder="Usuario" maxlength="10" required>
				<input type="password" id="contrasena" name="contrasena" placeholder="Contraseña" maxlength="10" required>
				<input type="submit" value="Entrar">
				<a class="link"><u>¿Has olvidado la contraseña?</u></a>
			</form>
			<button id="crearCuenta" onclick="window.location='crearCuenta.php'" accesskey="c">Crear una cuenta nueva</button>
			<?php
				include 'bbdd/bbddConexion.php';
				include 'bbdd/bbddFunciones.php';
			  if(isset($_POST["usuario"])){
					login($_POST["usuario"], $_POST["contrasena"], $pdo);
		    }

		  ?>
		</div>
		<?php } ?>
	</div>
	<?php include 'pie.php' ?>
</body>
</html>
