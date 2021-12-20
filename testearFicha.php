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
		[$nombre,$jugador,$jugador_nombre,$raza,$clase,$trasfondo,$vida_maxima,$vida_currente,$avatar,$fuerza,$destreza,$constitucion,$inteligencia,$sabiduria,$carisma,$idiomas] = conseguirAtributos($_POST['personaje'],$pdo);
		if ($avatar){
			$ruta = $avatar;
		} else {
			$ruta = 'imagenes/razas/Semiorco.jpeg';
		}
		echo "
		<div id='menuTestear'>
			<div class='tuFicha'>
				<img src=$ruta alt='avatar'>
				<h1>$nombre</h1>
				<personaje fuerza=$fuerza destreza=$destreza constitucion=$constitucion inteligencia=$inteligencia sabiduria=$sabiduria carisma=$carisma hidden>
			</div>
			<div class='botones'>
				<button type='button' id='btnfuerza' accesskey='f'>Fuerza</button>
				<button type='button' id='btndestreza' accesskey='d'>Destreza</button>
				<button type='button' id='btnconstitucion' accesskey='c'>Constitución</button>
				<button type='button' id='btninteligencia' accesskey='i'>Inteligencia</button>
				<button type='button' id='btnsabiduria' accesskey='b'>Sabiduría</button>
				<button type='button' id='btncarisma' accesskey='r'>Carisma</button>
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
