<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="scripts/testearFicha.js"></script>
	<title>Tablero</title>
<?php include 'encabezado.php';
	include 'bbdd/bbddConexion.php';
	include 'bbdd/bbddFunciones.php';
	if ($_POST['personaje']){
		echo "
		<div id='menuTestear'>
			<div class='tuFicha'>
				<img src='imagenes/razas/Semiorco.jpeg' alt='avatar'>
				<h1>Juan</h1>
				<personaje fuerza=12 destreza=12 constitucion=12 inteligencia=12 sabiduria=12 carisma=12 hidden>
			</div>
			<div class='botones'>
				<button type='button' id='btnfuerza'>Fuerza</button>
				<button type='button' id='btndestreza'>Destreza</button>
				<button type='button' id='btnconstitucion'>Constitución</button>
				<button type='button' id='btninteligencia'>Inteligencia</button>
				<button type='button' id='btnsabiduria'>Sabiduría</button>
				<button type='button' id='btncarisma'>Carisma</button>
			</div>
			<div class='fichaEnfrentada'>
				<img src='imagenes/razas/Dummy.jpg' alt=avatar>
				<h1>Muñeco de pruebas</h1>
			</div>
		</div>
		";
	} else {
		conseguirFichasBis($_SESSION['usuario'], $pdo);
	}
?>

	<?php include 'pie.php' ?>
</body>
</html>
