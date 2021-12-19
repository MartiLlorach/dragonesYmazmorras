<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="scripts/ficha.js"></script>
	<title>Ficha</title>
<?php
  include 'encabezado.php';
  include 'bbdd/bbddConexion.php';
  include 'bbdd/bbddFunciones.php';

  if (isset($_POST['msg'])){
	  echo "<script>alerta('".$_POST["msg"]."','".$_POST["tipo"]."')</script>";
  }

  if (isset($_POST["insertar"])){
    $jugador = $_POST["jugador"];
		$jugador_nombre = $_SESSION['usuario'];
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
    [$nombre,$jugador,$jugador_nombre,$raza,$clase,$trasfondo,$vida_maxima,$vida_currente,$avatar,$fuerza,$destreza,$constitucion,$inteligencia,$sabiduria,$carisma,$idiomas] =
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
	$conjurosClase = conseguirConjurosClase($pdo, $clase);
	$conjuros = conseguirConjuros($pdo);

?>
  <div id="ficha" class="div">
    <div class="encabezadoFicha">
      <div class="nombreDiv">
				<?php if ($avatar) {
					echo "<img id='avatar' src='$avatar' class='avatar' alt='avatar'>";
				} else {
					echo "<img id='avatar' src='imagenes/razas/".$razaCompleta['nombre'].".jpeg' class='avatar' alt='avatar'>";
				} ?>

        <h1><?php echo $nombre ?></h1>
      </div>
      <div class="caracteristicasDiv">
        <h1>Clase: <?php echo $claseCompleta["nombre"] ?></h1>
        <h1>Jugador: <?php echo $jugador_nombre ?></h1>
        <h1>Raza: <?php echo $razaCompleta["nombre"] ?></h1>
        <h1>Trasfondo: <?php echo $trasfondoCompleto["nombre"] ?></h1>
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
			<div class="combate">
				<div class="infoCombate">
					<div class="row">
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
					</div>
					<div class="row">
						<div class="vida">
							<?php echo "<h4>". $vida_maxima ."</h4>"; ?>
							<p>Vida</p>
						</div>
						<div class="dado_de_golpe">
							<?php echo "<h4>". $claseCompleta["dado_de_golpe"] ."</h4>"; ?>
							<p>Dado de Golpe</p>
						</div>
						<div class="salvaciones">
							<h4>Exitos: O O O</h4>
							<h4>Fallos: O O O</h4>
							<p>tiradas de salvavion</p>
						</div>
					</div>
				</div>
				<div class="ataques">
					<h4>Ataques y conjuros</h4>
					<?php $ataques = [];
					 array_push($ataques, ["Ataque desarmado", "1".modificador($fuerza), "contundente"]);
					 if ($equipamientoCompleto["id_arma"]){
						 $arma = $armasCompletas[$equipamientoCompleto["id_arma"]];
						 array_push($ataques, [$arma['nombre'],$arma['daño'].modificador($fuerza), $arma["daño_tipo"]]);
					 }
					 if ($conjurosClase) {
						 array_push($ataques, [$conjuros[$conjurosClase[0]]["nombre"],"",""]);
						 array_push($ataques, [$conjuros[$conjurosClase[1]]["nombre"],"",""]);
					 }
					 echo "<table><tr><th>Acción</th><th>Daño</th><th>Tipo</th>";
					 foreach ($ataques as $ataque) {
						 	echo "<tr><td>$ataque[0]</td><td>$ataque[1]</td><td>$ataque[2]</td>";
					 }
					 ?>
				 	</table>
				</div>
				<div class="equipamiento">
					<h4>Equipamiento</h4>
					<table>
						<tr>
							<th>Nombre</th><th>Peso</th>
						</tr>
					<?php if ($equipamientoCompleto['id_arma']){
						echo "<tr><td>". $armasCompletas[$equipamientoCompleto['id_arma']]["nombre"] ."</td>";
						echo "<td>". $armasCompletas[$equipamientoCompleto['id_arma']]["peso"] ."</td></tr>";
					}
					if ($equipamientoCompleto['id_armaduraOEscudo']){
						echo "<tr><td>". $armadurasCompletas[$equipamientoCompleto['id_armaduraOEscudo']]["nombre"] ."</td>";
						echo "<td>". $armadurasCompletas[$equipamientoCompleto['id_armaduraOEscudo']]["peso"] ."</td></tr>";
					}
					if ($equipamientoCompleto['id_objeto']){
						echo "<tr><td>". $objetosCompletos[$equipamientoCompleto['id_objeto']]["nombre"] ."</td>";
						echo "<td>". $objetosCompletos[$equipamientoCompleto['id_objeto']]["peso"] ."</td></tr>";
					}
					?>
				</table>
				</div>
			</div>
		</div>
		<div id="divFormularioAvatar">
			<?php if ($avatar) {
						echo "<img src='$avatar' class='avatar' alt='avatar'>";
					} else {
						echo "<img src='imagenes/razas/".$razaCompleta['nombre'].".jpeg' class='avatar' alt='avatar'>";
				} ?>
			<form action="upload.php" method="post" enctype="multipart/form-data">
				<input type="hidden" name="personaje_id" value=<?php echo $personaje; ?>>
				<p>Selecciona una imagen: <input type="file" name="fileToUpload" id="fileToUpload" required></p>
				<p><input type="submit" value="Subir" name="submit">
				<button id="btnSalirFormulario" type="button">Salir</button></p>
			</form>
		</div>
    </div>

    <?php include 'pie.php' ?>

	
  </body>
</html>
