<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="scripts/listaFichas.js"></script>
	<title>Tus Fichas</title>
<?php include 'encabezado.php'; ?>
  <body id="listaFichas">
    <?php
      include 'bbdd/bbddConexion.php';
      include 'bbdd/bbddFunciones.php';
      conseguirFichas($_SESSION["usuario"],$pdo); //la funcion esta hay q arreglarla
    ?>
  </body>
</html>
