<?php
function login($usuario, $contrasena, $oBbdd){

  $contrasena = hash('sha256', $contrasena);
  $query = $oBbdd->prepare("select * FROM usuarios where nombre= :usuario and contrasena= :contrasena");

  $query->bindParam(':usuario', $usuario);
  $query->bindParam(':contrasena',$contrasena);

  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }

  $row = $query->fetch();
  if($row){
    $_SESSION['usuario'] = $row["nombre"];
    header('Location: '.'tablero.php');
  }else{
    echo "<p class=errorMsg>ususario o contraseña incorrecto</p>";
  }

  unset($query);
}

function conseguirFichas($usuario, $oBbdd){

  $queryUsr = $oBbdd->prepare("select id FROM usuarios where nombre= :nombre_jugador");
  $queryUsr->bindParam(':nombre_jugador', $usuario);
  $queryUsr->execute();

  $eUsr= $queryUsr->errorInfo();
  if ($eUsr[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $eUsr[2]);
  } else {
    $rowUsr = $queryUsr->fetch();
    $id_usuario = $rowUsr["id"];

    $queryPrs = $oBbdd->prepare("select * FROM personajes where jugador= :id_jugador");
    $queryPrs->bindParam(':id_jugador', $id_usuario);
    $queryPrs->execute();

    $ePrs= $queryPrs->errorInfo();
    if ($ePrs[0]!='00000') {
      echo "\nPDO::errorInfo():\n";
      die("Error accedint a dades: " . $ePrs[2]);
    } else {
      while ($rowPrs = $queryPrs->fetch()) {
          $raza = conseguirNombreTabla($rowPrs["raza"], "razas", $oBbdd);
          $clase = conseguirNombreTabla($rowPrs["clase"], "clases", $oBbdd);
          printarResumenFicha($rowPrs["nombre"],$raza,$clase);
      }
    }

    unset($queryUsr);
    unset($queryPrs);
  }
}

function printarResumenFicha($nombre, $raza, $clase){
  echo "
  <div class='resumenFicha'>
    <div class='imgRaza'></div>
    <p>$nombre</p>
    <p>$raza</p>
    <p>$clase</p>
    <div class='resumenBotones'>
      <button class='verFicha'><i class='far fa-eye'></i></button>
      <button class='eliminarFicha'><i class='fas fa-trash-alt'></i></button>
    </div>
  </div>
  ";
}

function conseguirNombreTabla($id, $tabla, $oBbdd){
  $query = $oBbdd->prepare("select * FROM $tabla where id= :id");
  $query->bindParam(':id', $id);
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }

  $row = $query->fetch();
  if($row){
    return $row["nombre"];
  }else{
    trigger_error("no existe el id $id en la tabla $tabla");
  }

  unset($query);
}
?>
