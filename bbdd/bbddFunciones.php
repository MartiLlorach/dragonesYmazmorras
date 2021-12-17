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
    echo "<script>alerta('Credenciales incorrectas','mal');</script>";
  }
  unset($query);
}

function usuarioCorrecto($oBbdd) {
    //preparem i executem la consulta
      $query = $oBbdd->prepare("select * from usuarios where nombre= :user");
      $query->bindParam(':user', $_POST["nuevoUsuario"]);
      $query->execute();
        //comprovo errors:
      $e= $query->errorInfo();
      if ($e[0]!='00000') {
        echo "\nPDO::errorInfo():\n";
        die("Error accedint a dades: " . $e[2]);
      }
      //anem agafant les fileres d'amb una amb una
      $row = $query->fetch();
      if($row){
          echo "<script>alerta('El nombre de usuario ya existe.','mal');</script>";
      }else{
        if (strcmp($_POST['nuevaContrasena'], $_POST['nuevaContrasena2']) === 0){
          $encriptedPwd = hash("sha256", $_POST["nuevaContrasena"]);
          //preparem i executem la consulta
          $query = $oBbdd->prepare("insert into usuarios(id,nombre,contrasena,fecha,email)
          Values(null,:user,:password,:fecha,:email)");
          $query->bindParam(':user', $_POST["nuevoUsuario"]);
          $query->bindParam(':password', $encriptedPwd);
          $query->bindParam(':fecha', $_POST['nacimiento']);
          $query->bindParam(':email', $_POST['nuevoCorreo']);
          $query->execute();
          $_SESSION['creacion'] =true;
          header("Location: paginaInicio.php");
        }else{
          echo "<script>alerta('Las contraseñas no coinciden.','mal');</script>";
        }
      }
      //eliminem els objectes per alliberar memòria
      unset($pdo);
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
      $cont = 0;
      while ($rowPrs = $queryPrs->fetch()) {
          $raza = conseguirNombreTabla($rowPrs["raza"], "razas", $oBbdd);
          $clase = conseguirNombreTabla($rowPrs["clase"], "clases", $oBbdd);
          printarResumenFicha($rowPrs["id"], $rowPrs["nombre"],$raza,$clase,$rowPrs["avatar"]);
          $cont++;
      }
      if (!$cont) {
        echo "<div class='noFichas'><h4>No tienes fichas</h4></div>";
      }
    }

    unset($queryUsr);
    unset($queryPrs);
  }
}

function printarResumenFicha($id, $nombre, $raza, $clase, $avatar){
  
  if ($avatar==null) {
    $src ="";
    switch ($raza) {
      case 'Humano':
        $src = "imagenes/razas/Humano.jpeg";
        break;
      case 'Semielfo':
        $src = 'imagenes/razas/Semielfo.jpeg';
        break;
      case 'Semiorco':
        $src = 'imagenes/razas/Semiorco.jpeg';
        break;
      case 'Tiflin':
        $src = 'imagenes/razas/Tiflin.jpeg';
        break;
      case 'Alto Elfo':
        $src = 'imagenes/razas/AltoElfo.jpeg';
        break;
    }
  } else {
    $src = $avatar;
  }
  echo "
  <div class='resumenFicha'>
    <img class='imgRaza' src=$src onclick='importarImagen($id)'/>
    <p>$nombre</p>
    <p>$raza</p>
    <p>$clase</p>
    <div class='resumenBotones'>
      <button class='verFicha'><i class='fa fa-eye'></i></button>
      <button class='eliminarFicha'><i class='fa fa-trash'></i></button>
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

function conseguirRazas($oBbdd){
  $razas = [];

  $query = $oBbdd->prepare("select * from razas");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while ($row = $query -> fetch()) {
      $razas[$row['id']] = [
        'nombre' => $row['nombre'],
        'descripcion' => $row['descripcion'],
        'edad' => $row['edad'],
        'alineamiento' => $row['alineamiento'],
        'tamaño' => $row['tamaño'],
        'velocidad' => $row['velocidad'],
        'idiomas_elegir' => $row['idiomas_elegir']
      ];

      if ($row['id_padre']) {
        $razas[$row['id']]['id_padre'] = $row['id_padre'];
      }
    }
    $jsonRazas = json_encode($razas);
    echo "
      <script> definirRazas((" . $jsonRazas . ")) </script>
    ";

  }
  unset($query);
}

function conseguirClases($oBbdd){
  $clases = [];

  $query = $oBbdd->prepare("select * from clases");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while ($row = $query -> fetch()) {
      $clases[$row['id']] = [
        'nombre' => $row['nombre'],
        'dado_de_golpe' => $row['dado_de_golpe'],
        'idiomas_elegir' => $row['idiomas_elegir'],
        'riqueza_inicial' => $row['riqueza_inicial'],
        'descripcion' => $row['descripcion']
      ];
    }
    $jsonClases = json_encode($clases);
    echo "
      <script> definirClases((" . $jsonClases . ")) </script>
    ";

  }
  unset($query);
}

function conseguirTrasfondos($oBbdd){
  $trasfondos = [];

  $query = $oBbdd->prepare("select * from trasfondos");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while ($row = $query -> fetch()) {
      $trasfondos[$row['id']] = [
        'nombre' => $row['nombre'],
        'descripcion' => $row['descripcion'],
        'idiomas_elegir' => $row['idiomas_elegir']
      ];
    }
    $jsonTrasfondos = json_encode($trasfondos);
    echo "
      <script> definirTrasfondos((" . $jsonTrasfondos . ")) </script>
    ";

  }
  unset($query);
}

function conseguirIdiomas($oBbdd){
  $idiomas = [];

  $query = $oBbdd->prepare("select * from idiomas");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while ($row = $query -> fetch()) {
      $idiomas[$row['id']] = [
        'nombre' => $row['nombre'],
        'escritura' => $row['escritura']
      ];
    }
    $jsonIdiomas = json_encode($idiomas);
    echo "
      <script> definirIdiomas((" . $jsonIdiomas . ")) </script>
    ";

  }
  unset($query);
}
function subirAvatar($urlAvatar, $oBbdd) {
  $query = $oBbdd->prepare("UPDATE personajes SET avatar = '$urlAvatar'");
  $query->execute();
}
?>

