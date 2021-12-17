<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- <script src="scripts/ficha.js"></script> -->
	<title>Ficha</title>
<?php
  include 'encabezado.php';
  include 'bbdd/bbddConexion.php';
  include 'bbdd/bbddFunciones.php';

  if (isset($_POST["insertar"])){
    $jugador = $_POST["jugador"];
    $nombre = $_POST["nombre"];
    $raza = $_POST["raza"];
    $clase = $_POST["clase"];
    $trasfondo = $_POST["trasfondo"];
    $fuerza = $_POST["sctFuerza"];
    $destreza = $_POST["sctDestreza"];
    $constitucion = $_POST["sctConstitución"];
    $inteligencia = $_POST["sctInteligencia"];
    $sabiduria = $_POST["sctSabiduría"];
    $carisma = $_POST["sctCarisma"];
    $idiomas = $_POST["idiomas[]"];
    $personaje = insertarPersonaje(
      $pdo, $nombre, $clase, $raza, $fuerza, $destreza, $constitucion, $inteligencia, $sabiduria, $carisma, $trasfondo, $idiomas);
  } else {
    $personaje = $_POST["personaje"];
    [$nombre,$jugador,$raza,$clase,$trasfondo,$vida_maxima,$vida_currente,$avatar,$fuerza,$destreza,$constitucion,$inteligencia,$sabiduria,$carisma,$idiomas] =
    conseguirAtributos($personaje, $pdo);
  }
  $razaCompleta = conseguirRaza($pdo, $raza);
  $claseCompleta = conseguirClase($pdo, $clase);
  $trasfondoCompleto = conseguirTrasfondo($pdo, $trasfondo);
  $idiomasCompletos = conseguirIdiomasF($pdo);
  $armasCompletas = conseguirArmasF($pdo);
  $armadurasCompletas = conseguirArmadurasF($pdo);
  $objetosCompletos = conseguirObjetosF($pdo);
  $equipamientoCompleto = conseguirEquipamientoClase($pdo, $clase);
?>
  <div id="ficha" class="div">
    <div class="encabezadoFicha">
      <div class="nombreDiv">
				<?php if ($avatar) {
					echo "<img src='$avatar' alt='avatar'>";
				} else {
					echo "<img src='imagenes/razas/".$razaCompleta['nombre'].".jpeg' alt='avatar'>";
				} ?>

        <h1><?php echo $nombre ?></h1>
      </div>
      <div class="caracteristicasDiv">
        <p>Clase: <?php echo $claseCompleta["nombre"] ?></p>
        <p>Jugador: <?php echo $jugador ?></p>
        <p>Raza: <?php echo $razaCompleta["nombre"] ?></p>
        <p>Trasfondo: <?php echo $trasfondoCompleto["nombre"] ?></p>
      </div>
    </div>
		<hr>
		<div class="cuerpoFicha">
			<div class="puntuacionHabilidades">
				<div>
					<h4>FUERZA</h4>
					<h3><?php echo modificador($fuerza); ?></h3>
					<p><?php echo $fuerza; ?></p>
				</div>
				<div>
					<h4>DESTREZA</h4>
					<h3><?php echo modificador($destreza); ?></h3>
					<p><?php echo $destreza; ?></p>
				</div>
				<div>
					<h4>CONSTITUCIÓN</h4>
					<h3><?php echo modificador($constitucion); ?></h3>
					<p><?php echo $constitucion; ?></p>
				</div>
				<div>
					<h4>INTELIGENCIA</h4>
					<h3><?php echo modificador($inteligencia); ?></h3>
					<p><?php echo $inteligencia; ?></p>
				</div>
				<div>
					<h4>SABIDURÍA</h4>
					<h3><?php echo modificador($sabiduria); ?></h3>
					<p><?php echo $sabiduria; ?></p>
				</div>
				<div>
					<h4>CARISMA</h4>
					<h3><?php echo modificador($carisma); ?></h3>
					<p><?php echo $carisma; ?></p>
				</div>
			</div>
			<div class="habilidades">
				<div><h4><?php echo modificador($destreza);?></h4> Acrobacias <div class="gris">(Des)</div></div>
				<div><h4><?php echo modificador($inteligencia);?></h4> Arcanos <div class="gris">(Int)</div></div>
				<div><h4><?php echo modificador($fuerza);?></h4> Atletismo <div class="gris">(Fue)</div></div>
				<div><h4><?php echo modificador($carisma);?></h4> Engaño <div class="gris">(Car)</div></div>
				<div><h4><?php echo modificador($inteligencia); ?></h4> Historia <div class="gris">(Int)</div></div>
				<div><h4><?php echo modificador($carisma); ?></h4> Interpretación <div class="gris">(Car)</div></div>
				<div><h4><?php echo modificador($carisma); ?></h4> Intimidación <div class="gris">(Car)</div></div>
				<div><h4><?php echo modificador($inteligencia); ?></h4> Investigación <div class="gris">(Int)</div></div>
				<div><h4><?php echo modificador($destreza); ?></h4> Juego de Manos <div class="gris">(Des)</div></div>
				<div><h4><?php echo modificador($sabiduria); ?></h4> Medicina <div class="gris">(Sab)</div></div>
				<div><h4><?php echo modificador($inteligencia); ?></h4> Naturaleza <div class="gris">(Int)</div></div>
				<div><h4><?php echo modificador($sabiduria); ?></h4> Percepción <div class="gris">(Sab)</div></div>
				<div><h4><?php echo modificador($sabiduria); ?></h4> Perspicacia <div class="gris">(Sab)</div></div>
				<div><h4><?php echo modificador($carisma); ?></h4> Persuasión <div class="gris">(Car)</div></div>
				<div><h4><?php echo modificador($inteligencia); ?></h4> Religión <div class="gris">(Int)</div></div>
				<div><h4><?php echo modificador($destreza); ?></h4> Sigilo <div class="gris">(Des)</div></div>
				<div><h4><?php echo modificador($sabiduria); ?></h4> Supervivencia <div class="gris">(Sab)</div></div>
				<div><h4><?php echo modificador($sabiduria); ?></h4> Trato con Animales <div class="gris">(Sab)</div></div>
			</div>
			<div class="infoCombate">
				<div class="CA">
					<?php if ($equipamientoCompleto["id_armaduraOEscudo"]){
						$armadura = $armadurasCompletas[$equipamientoCompleto["id_armaduraOEscudo"]];

						if ($armadura["clase_de_armadura"]){
							$ca = $armadura["clase_de_armadura"];
						} else {
							$ca = 10;
						}
						if ($armadura["clase_de_armadura_bonus"]){
							if ($armadura["clase_de_armadura_bonus_max"]){
								if (modificadorInt(${$armadura["clase_de_armadura_bonus"]})>$armadura["clase_de_armadura_bonus_max"]){
									$ca += $armadura["clase_de_armadura_bonus_max"];
								} else {
									$ca += modificadorInt(${$armadura["clase_de_armadura_bonus"]});
								}
							} else {
								$ca += modificadorInt(${$armadura["clase_de_armadura_bonus"]});
							}
						}
					} else {
						$ca = 10 + modificadorInt($destreza);
					}
					echo "<h4>$ca</h4>";?>
					<p>Clase de Armadura</p>
				</div>
				<div class="iniciativa">
					<?php echo "<h4>".modificador($destreza)."</h4>"; ?>
					<p>Iniciativa</p>
				</div>
				<div class="velocidad">
					<?php echo "<h4>". $razaCompleta["velocidad"] ."'</h4>"; ?>
					<p>Velocidad</p>
				</div>
				<div class="vida">
					<?php echo "<h4>". $vida_maxima ."</h4>"; ?>
					<p>Vida</p>
				</div>
				<div class="dado_de_golpe">
					<?php echo "<h4>". $claseCompleta["dado_de_golpe"] ."</h4>"; ?>
					<p>Dado de Golpe</p>
				</div>
				<div class="salvaciones">

				</div>
			</div>
		</div>
  </div>

    <?php include 'pie.php' ?>
  </body>
</html>
