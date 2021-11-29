<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript" src="tablero.js"></script>
	<title>Dashboard</title>
</head>
<body onload="mostrarMenuUsuario()">
	<header>
	 <div id="header">
	 	<h1>D&D Generador de Fichas</h1>
	 	<div id="separacionHeader"></div>
		<div id="seccionUsuario">
	 	<button class="headerButton" onclick="mostrarMenuUsuario()">Usuario</button>
		      <div id="menuUsuario" position="absolute">
			      <p><a href="#"> Listado de fichas</a></p>
			      <p><a href="#"> Crear ficha</a></p>
			      <p><a href="#"> Testear ficha</a></p>
		      </div>
		</div>
	 	<button class="headerButton" onclick="location.href = 'tablero.php';"><img src="imagenes/inicio.png" width="50px" height="50px"></button>
	 </div>
	</header>
	<div id="menuDashboard">
		<button>Listado de fichas</button>
		<button>Crear ficha</button>
		<button>Testear ficha</button>
	</div>
	<div id="dashboardLogOut">
		<button onclick="location.href = 'paginaInicio.php';">Log Out</button>
	</div>
</body>
</html>