<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>D&D Generador de fichas</title>
<?php include 'encabezado.php'; ?>
	<div id="paginaInicio">
		<div id="paginaInicioIzq">
			<img width="400px" height="200px" src="imagenes/portadadnd.png">
			<p>Si eres diseñador o has trasteado con programas de diseño, probablemente te hayas encontrado con un texto conocido como Lorem Ipsum. ... Su título deriva del latín dolorem ipsum, que significa «el dolor en sí».</p>
		</div>
		<div id="paginaInicioDer">
			<form id="formularioLogin" autocomplete="off" action="tablero.php" method="post">
				<h2>Iniciar sesión</h2>
				<input type="text" name="user" placeholder="Usuario" required>
				<input type="password" name="password" placeholder="Contraseña" required>
				<input type="submit" value="Entrar">
				<a class="link" onclick="passwordOlvidada()"><u>¿Has olvidado la contraseña?</u></a>
				<button>Crear una cuenta nueva</button>
			</form>
		</div>
	</div>
</body>
</html>
