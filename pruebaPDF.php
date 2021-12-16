<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>D&D Generador de fichas</title>
	<style type="text/css">
		* PALETA DE COLORES */

@import url('https://fonts.googleapis.com/css2?family=Eczar:wght@400;500;600;700;800&family=Open+Sans&display=swap');

:root {
	--color1: #CD5200;
	--color2: #DF0000;
	--color3: #FFFFFF;
	--color4: #A6A6A6;
	--color5: #4F4F4F;
	--color6: #000000;
}


/* ESTILOS GENERALES */
html{
	position: relative;
	min-height: 100%
}
body {
	background-image: url("imagenes/fondoLava.jpg");
	background-size: cover;
	background-color: var(--color6);
	font-family: 'Open Sans', sans-serif;
	margin: 0 0 212px;
	display: block;
	min-height: 100%;
}

h1, h2, h3{
	font-family: 'Eczar', serif;
}

button:hover, input[type=submit]:hover{
	background-color: #ddd;
	color: var(--color2);
	cursor: pointer;
}

.link {
	color: var(--color1);
	cursor: pointer;
}

.titulo{
	font-family: 'Eczar', serif;
	color: var(--color2);
	text-shadow: 2px 0 0 var(--color6),
		-2px 0 0 var(--color6),
		0 2px 0 var(--color6),
		0 -2px 0 var(--color6),
		1px 1px var(--color6),
		-1px -1px 0 var(--color6),
		1px -1px 0 var(--color6),
		-1px 1px 0 var(--color6);
	margin: 10px;
}

footer {
	background-color: var(--color5);
	display: flex;
	justify-content: space-around;
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	border-top: 2px solid var(--color4);
	height: min-content;
	margin-top: 50px;
}

footer #contactaDesarrolladores{
	display: flex;
	flex-direction: column;
}

footer div{
	width: 30%;
	padding: 5px;
	text-align: center;
}

footer div:nth-child(2){
	border-left: 1px solid var(--color6);
	border-right: 1px solid var(--color6);
}

footer img{
	width: 25vw;
}

footer a{
	color: #FF8C40;
}

/* ESTILOS ENCABEZADO */

#encabezado {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	display: flex;
	background-color: var(--color5);
	flex-direction: row;
  	flex-wrap: nowrap;
  	justify-content: space-between;
  	align-items: baseline;
	padding: 0 10px;
	margin: 8px 8px 20px;
	border-radius: 5px;
	border: 2px solid var(--color4);
	z-index: 1000;
}

#encabezado button {
	width: fit-content;
	font-size: 20px;
	margin: 10px;
	padding: 5px;
	align-items: center;
}

#botonUsuario{
  position: relative;
  display: inline-block;
}

.encabezadoDesplegable {
  display: none;
  position: absolute;
  background-color: var(--color3);
  width: 150px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  top: 59px;
  right: 74px;
}

.encabezadoDesplegable a {
  color: var(--color6);
  padding: 5px 12px;
  text-decoration: none;
  display: block;
}

.encabezadoDesplegable a:hover {
	background-color: #ddd;
	color: var(--color2);
}

.show {display:block;}

.botonesEncabezado {
	display: flex;
}

#botonCierreSes {
	position: absolute;
	width: 200px;
	right: 50px;
	top: 50px;
}

/* ESTILOS ALERTAS */

.alerta{
	position: fixed;
	width: 20vw;
	height: 20vh;
	top: 25vh;
	right: 42vw;
	border: solid black 2px;
}

.alerta.mal {background-color: red;}
.alerta.bien {background-color: #04AA6D;}
.alerta.info {background-color: #2196F3;}
.alerta.aviso {background-color: #ff9800;}

.closebtn {
  margin: 2% 2% 0% 0%;
  color: black;
  font-weight: bold;
  float: right;
  font-size: 40px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: white;
}

#alerta > p{
	margin: 15% 0% 0% 5%;
}

#alerta > p > strong{
	margin-right: 1%;
}
/* ESTILOS PAGINA INICIO */

#paginaInicio {
	display: flex;
	justify-content: space-around;
	align-items: center;
}

#paginaInicioIzq {
	width: 40%;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: var(--color4);
	box-shadow: 5px 10px 8px var(--color6);
	border-radius: 5px;
}

#paginaInicioIzq img {
	width: 400px;
}

#paginaInicioDer {
	width: fit-content;
	justify-content: center;
	text-align: center;
	background-color: var(--color4);
	box-shadow: 5px 10px 8px var(--color6);
	border-radius: 5px;
}

#paginaInicioDer .errorMsg {
	color: var(--color2);
	display: block;
}

#formularioLogin {
	display:  flex;
	flex-direction: column;
	align-items: center;
}

#formularioLogin input, #formularioLogin a{
	width: 300px;
	height: 40px;
	display:  flex;
	justify-content: center;
	align-items: flex-start;
	margin: 10px;
}

#crearCuenta {
	display: block;
	width: 300px;
	height: 40px;
	margin: 10px auto;
	font-size: 20px;
}

input[type=submit] {
	font-size: 20px;
}

#formularioLogin button {
	font-size: 20px;
	margin: 10px;
	align-items: center;
}

/* ESTILOS TABLERO */
 #menuTablero {
	 padding: 10px 0;
	 margin: auto;
	 width: min-content;
	 background-color: var(--color4);
	 border-radius: 5px;
 }
 #menuTablero button {
	 font-size: 20px;
	 align-items: center;
	 width: 300px;
	 height: 40px;
	 display: block;
	 margin: 10px;
 }


/* ESTILOS CREAR CUENTA */
#paginaCrearCuenta {
	display: flex;
	justify-content: center;
}

#formularioCrearCuenta {
	display: block;
	background-color: var(--color4);
	text-align: right;
	padding: 20px;
}
#formularioCrearCuenta h2 {
	text-align: center;
	font-size: 35px;
}
#formularioCrearCuenta input, label {
	font-size: 20px;
}

#camposFormulario {
	justify-content: flex-end;
}


#botonesFormulario {
	display: flex;
	justify-content: space-between;
	align-content: flex-end;
	font-size: 20px;
	margin-top: 10px;
}

#botonesFormulario button {

	font-size: 20px;
}

/* ESTILOS LISTA FICHAS */
#listaFichas .resumenFicha{
	display: flex;
	width: min-content;
	margin: 10px auto;
	background: var(--color4);
	border-radius: 5px;
	align-items: center;
}

#listaFichas .noFichas{
	width: max-content;
	margin: 10px auto;
	background: var(--color4);
	border-radius: 5px;
	align-items: center;
	padding: 5px 20px;
}

#listaFichas .resumenBotones{
	display: flex;
	flex-direction: column;
}

#listaFichas .resumenFicha button{
	margin: 2px 5px;
}

#listaFichas .resumenFicha .verFicha{
	background-color: rgb(0, 100, 0);
	color: var(--color6);
}
#listaFichas .resumenFicha .eliminarFicha{
	background-color: rgb(200, 0, 0);
	color: var(--color6);
}
#listaFichas .resumenFicha .verFicha:hover{
	color: var(--color3);
	background-color: rgb(0, 80, 0);
}
#listaFichas .resumenFicha .eliminarFicha:hover{
	color: var(--color3);
	background-color: rgb(180, 0, 0);
}

#listaFichas .resumenFicha .imgRaza{
	width: auto;
	height: 50px;
	margin-left: 10px;
}
#listaFichas .resumenFicha p{
	padding: 10px;
}
#listaFichas{
	text-align: center;
}

/* ESTILOS CREACION DE PERSONAJE */
#crearFicha {
	text-align: center;
}
#crearFicha .div{
	background-color: var(--color4);
	width: max-content;
	padding: 50px;
	margin: 25px auto;
	border-radius: 5px;
}
#crearFicha .divBotonesNavegacion{
	padding: 10px;
}
#crearFicha .divBotonesNavegacion .btnAceptar:hover{
	color: var(--color3);
	background-color: rgb(0, 80, 0);
}
#crearFicha .divBotonesNavegacion .btnCancelar:hover{
	color: var(--color3);
	background-color: rgb(180, 0, 0);
}
#crearFicha .btnAceptar{
	background-color: rgb(0, 100, 0);
}
#crearFicha .btnCancelar{
	background-color: rgb(200, 0, 0);
}
#crearFicha .descripcion{
	width: 1000px;
	display: flex;
	align-items: center;
}
.descripcion img{
	width: 100px;
	height: 100px;
	margin: 10px;
}
#crearFicha #divRaza select, #crearFicha #divClase select, #crearFicha #divTrasfondo select{
	margin: 5px;
}
#crearFicha .ckbIdioma:checked + label{
	background-color: var(--color1);
	border-radius: 5px;
}
#crearFicha #divIdioma label{
	padding: 2px;
}
#crearFicha #divHabilidades{
		display: flex;
		flex-direction: column;
}
#crearFicha #contenedorHabilidades{
	display: flex;
  width: 40%;
}
#crearFicha #contenedorHabilidades .divHabilidad{
	display: flex;
	flex-direction: column;
	align-items: center;
	border-radius: 5px;
	border: 2px solid var(--color4);
	background-color: var(--color5);
	padding: 5px;
	color: var(--color3);
}
#crearFicha #contenedorHabilidades .sctHabilidad{
	width: 5vw;
}

	</style>
</head>
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
			<button id="crearCuenta" onclick="window.location='crearCuenta.php'">Crear una cuenta nueva</button>
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
