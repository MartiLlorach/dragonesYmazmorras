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
        <p>Nombre: <?php echo $nombre ?></p>
      </div>
      <div class="caracteristicasDiv">
        <p>Clase: <?php echo $claseCompleta["nombre"] ?></p>
        <p>Jugador: <?php echo $jugador ?></p>
        <p>Raza: <?php echo $razaCompleta["nombre"] ?></p>
        <p>Trasfondo: <?php echo $trasfondoCompleto["nombre"] ?></p>
      </div>
    </div>
  </div>

    <?php include 'pie.php' ?>
  </body>
</html>
