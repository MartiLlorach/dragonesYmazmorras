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
          printarResumenFicha($rowPrs["nombre"], $raza, $clase, $rowPrs["avatar"], $oBbdd);
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

function printarResumenFicha($nombre, $raza, $clase, $avatar, $oBbdd){

  $query = $oBbdd->prepare("select id from usuarios where nombre='$_SESSION[usuario]'");
  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }
  $row = $query->fetch();
  $jugador = $row["id"];

  unset($query);


  $query = $oBbdd->prepare("select id from personajes where nombre='$nombre' and jugador=$jugador");

  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }
  $row = $query->fetch();
  $personaje_id = $row["id"];

  unset($query);

  if ($avatar) {
    $src = $avatar;
  } else {
    $src = 'imagenes/razas/'.$raza.'.jpeg';
  }

  echo "
  <div class='resumenFicha'>
    <img class='imgRaza' src=$src></img>
    <p>$nombre</p>
    <p>$raza</p>
    <p>$clase</p>
    <div class='resumenBotones'>
      <form method=post action=ficha.php>
      <button class='verFicha' name='personaje' value=$personaje_id ><i class='fa fa-eye'></i></button>
      </form>
      <button class='eliminarFicha'><i class='fa fa-trash'></i></button>
    </div>
  </div>
  ";
}

function conseguirFichasBis($usuario, $oBbdd){

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
          printarResumenFichaBis($rowPrs["nombre"], $raza, $clase, $rowPrs["avatar"], $oBbdd);
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

function printarResumenFichaBis($nombre, $raza, $clase, $avatar, $oBbdd){

  $query = $oBbdd->prepare("select id from usuarios where nombre='$_SESSION[usuario]'");
  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }
  $row = $query->fetch();
  $jugador = $row["id"];

  unset($query);


  $query = $oBbdd->prepare("select id from personajes where nombre='$nombre' and jugador=$jugador");

  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }
  $row = $query->fetch();
  $personaje_id = $row["id"];

  unset($query);

  if ($avatar) {
    $src = $avatar;
  } else {
    $src = 'imagenes/razas/'.$raza.'.jpeg';
  }

  echo "
  <div class='resumenFicha'>
    <img class='imgRaza' src=$src></img>
    <p>$nombre</p>
    <p>$raza</p>
    <p>$clase</p>
    <div class='resumenBotones'>
      <form method=post>
      <button class='verFicha' name='personaje' value=$personaje_id >Seleccionar</button>
      </form>
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

function conseguirArmas($oBbdd){
  $armas = [];

  $query = $oBbdd->prepare("select * from armas");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while ($row = $query -> fetch()) {
      $armas[$row['id']] = [
        'nombre' => $row['nombre'],
        'daño' => $row['daño'],
        'daño_tipo' => $row['daño_tipo'],
        'peso' => $row['peso']
      ];
    }
    $jsonArmas = json_encode($armas);
    echo "
      <script> definirArmas((" . $jsonArmas . ")) </script>
    ";

  }
  unset($query);
}

function conseguirArmaduras($oBbdd){
  $armaduras = [];

  $query = $oBbdd->prepare("select * from armadurasyescudos");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while ($row = $query -> fetch()) {
      $armaduras[$row['id']] = [
        'nombre' => $row['nombre'],
        'tipo' => $row['tipo'],
        'clase_de_armadura' => $row['clase_de_armadura'],
        'clase_de_armadura_bonus' => $row['clase_de_armadura_bonus'],
        'clase_de_armadura_bonus_max' => $row['clase_de_armadura_bonus_max'],
        'peso' => $row['peso']
      ];
    }
    $jsonArmaduras = json_encode($armaduras);
    echo "
      <script> definirArmaduras((" . $jsonArmaduras . ")) </script>
    ";

  }
  unset($query);
}

function conseguirObjetos($oBbdd){
  $objetos = [];

  $query = $oBbdd->prepare("select * from objetos");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while ($row = $query -> fetch()) {
      $objetos[$row['id']] = [
        'nombre' => $row['nombre'],
        'descripcion' => $row['descripcion'],
        'peso' => $row['peso']
      ];
    }
    $jsonObjetos = json_encode($objetos);
    echo "
      <script> definirObjetos((" . $jsonObjetos . ")) </script>
    ";

  }
  unset($query);
}

function conseguirEquipamientoClases($oBbdd){
  $equipamientoClase = [];

  $query = $oBbdd->prepare("select * from equipamientoclase");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while ($row = $query -> fetch()) {
      $equipamientoClase[$row['id_clase']] = [
        'id_arma' => $row['id_arma'],
        'id_objeto' => $row['id_objeto'],
        'id_armaduraOEscudo' => $row['id_armaduraOEscudo']
      ];
    }
    $jsonEquipamientoClase = json_encode($equipamientoClase);
    echo "
      <script> definirEquipamientoClase((" . $jsonEquipamientoClase . ")) </script>
    ";

  }
  unset($query);
}

function inicializarVariables($oBbdd){
  conseguirRazas($oBbdd);
  conseguirClases($oBbdd);
  conseguirTrasfondos($oBbdd);
  conseguirIdiomas($oBbdd);
  conseguirArmas($oBbdd);
  conseguirArmaduras($oBbdd);
  conseguirObjetos($oBbdd);
  conseguirEquipamientoClases($oBbdd);
}

function insertarPersonaje(
  $oBbdd, $nombre, $clase, $raza, $fuerza, $destreza, $constitucion, $inteligencia, $sabiduria, $carisma, $trasfondo, $idiomas){

  $query = $oBbdd->prepare("select id from usuarios where nombre='$_SESSION[usuario]'");
  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }
  $row = $query->fetch();
  $jugador = $row["id"];

  unset($query);


  $dado = 10;

  $query = $oBbdd->prepare("select dado_de_golpe from clases where id=$clase");
  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }
  $row = $query->fetch();
  $dado = $row["dado_de_golpe"];
  $string = explode("d", $dado);
  $dado = $string[1];

  unset($query);


  $query = $oBbdd->prepare("insert into personajes
  (id, nombre, jugador, raza, clase, trasfondo, vida_maxima, vida_currente, avatar)
  VALUES(null, '$nombre', $jugador, $raza, $clase, $trasfondo, $dado, $dado, null)");

  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }

  unset($query);


  $query = $oBbdd->prepare("select id from personajes where nombre='$nombre' and jugador=$jugador");
  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }
  $row = $query->fetch();
  $id_personaje = $row["id"];

  unset($query);


  $query = $oBbdd->prepare("insert into habilidadespersonaje
  (id_personaje, fuerza, destreza, constitucion, inteligencia, sabiduria, carisma)
  VALUES($id_personaje, $fuerza, $destreza, $constitucion, $inteligencia, $sabiduria, $carisma)");

  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }

  unset($query);

  foreach ($idiomas as $idioma) {
    $query = $oBbdd->prepare("insert into idiomaspersonaje
    (id_idioma, id_personaje)
    VALUES($idioma, $id_personaje)");

    $query->execute();
    $e= $query->errorInfo();
    if ($e[0]!='00000') {
      echo "\nPDO::errorInfo():\n";
      die("Error accedint a dades: " . $e[2]);

    }
    unset($query);
  }

  return $id_personaje;
}

function conseguirAtributos($id_personaje, $oBbdd){

  $query = $oBbdd->prepare("select * from personajes where id=$id_personaje");

  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }
  $row = $query->fetch();
  $nombre = $row["nombre"];
  $jugador = $row["jugador"];
  $raza = $row["raza"];
  $clase = $row["clase"];
  $trasfondo = $row["trasfondo"];
  $vida_maxima = $row["vida_maxima"];
  $vida_currente = $row["vida_currente"];
  $avatar = $row["avatar"];

  unset($query);


  $query = $oBbdd->prepare("select * from habilidadespersonaje where id_personaje=$id_personaje");

  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }
  $row = $query->fetch();
  $fuerza = $row["fuerza"];
  $destreza = $row["destreza"];
  $constitucion = $row["constitucion"];
  $inteligencia = $row["inteligencia"];
  $sabiduria = $row["sabiduria"];
  $carisma = $row["carisma"];

  unset($query);

  $query = $oBbdd->prepare("select * from idiomaspersonaje where id_personaje=$id_personaje");
  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }
  $idiomas = [];
  while ($row = $query -> fetch()) {
    array_push($idiomas, $row["id_idioma"]);
  }

  unset($query);

  $query = $oBbdd->prepare("select * from usuarios where id=$jugador");
  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  }
  $row = $query -> fetch();
  $jugador_nombre = $row["nombre"];

  unset($query);

  return [$nombre,$jugador,$jugador_nombre,$raza,$clase,$trasfondo,$vida_maxima,$vida_currente,$avatar,$fuerza,$destreza,$constitucion,$inteligencia,$sabiduria,$carisma,$idiomas];
}

function conseguirRaza($oBbdd, $id_raza){
  $query = $oBbdd->prepare("select * from razas where id = $id_raza");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    $row = $query -> fetch();
    $raza = [
      'id' => $row['id'],
      'nombre' => $row['nombre'],
      'descripcion' => $row['descripcion'],
      'edad' => $row['edad'],
      'alineamiento' => $row['alineamiento'],
      'tamaño' => $row['tamaño'],
      'velocidad' => $row['velocidad'],
      'idiomas_elegir' => $row['idiomas_elegir']
      ];

      if ($row['id_padre']) {
        $raza[$row['id']]['id_padre'] = $row['id_padre'];
      }
    }
    return $raza;

  unset($query);
}

function conseguirClase($oBbdd, $id_clase){
  $query = $oBbdd->prepare("select * from clases where id = $id_clase");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    $row = $query -> fetch();
    $clase = [
      'id' => $row['id'],
      'nombre' => $row['nombre'],
      'dado_de_golpe' => $row['dado_de_golpe'],
      'idiomas_elegir' => $row['idiomas_elegir'],
      'riqueza_inicial' => $row['riqueza_inicial'],
      'descripcion' => $row['descripcion']
    ];

    return $clase;
  }
  unset($query);
}

function conseguirTrasfondo($oBbdd, $id_trasfondo){

  $query = $oBbdd->prepare("select * from trasfondos where id = $id_trasfondo");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    $row = $query -> fetch();
    $trasfondo = [
      'id' => $row['id'],
      'nombre' => $row['nombre'],
      'descripcion' => $row['descripcion'],
      'idiomas_elegir' => $row['idiomas_elegir']
    ];

    return $trasfondo;

  }
  unset($query);
}

function conseguirIdiomasF($oBbdd){
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
    return $idiomas;
  }
  unset($query);
}

function conseguirArmasF($oBbdd){
  $armas = [];

  $query = $oBbdd->prepare("select * from armas");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while ($row = $query -> fetch()) {
      $armas[$row['id']] = [
        'nombre' => $row['nombre'],
        'daño' => $row['daño'],
        'daño_tipo' => $row['daño_tipo'],
        'peso' => $row['peso']
      ];
    }
    return $armas;
  }
  unset($query);
}

function conseguirArmadurasF($oBbdd){
  $armaduras = [];

  $query = $oBbdd->prepare("select * from armadurasyescudos");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while ($row = $query -> fetch()) {
      $armaduras[$row['id']] = [
        'nombre' => $row['nombre'],
        'tipo' => $row['tipo'],
        'clase_de_armadura' => $row['clase_de_armadura'],
        'clase_de_armadura_bonus' => $row['clase_de_armadura_bonus'],
        'clase_de_armadura_bonus_max' => $row['clase_de_armadura_bonus_max'],
        'peso' => $row['peso']
      ];
    }
    return $armaduras;

  }
  unset($query);
}

function conseguirObjetosF($oBbdd){
  $objetos = [];

  $query = $oBbdd->prepare("select * from objetos");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while ($row = $query -> fetch()) {
      $objetos[$row['id']] = [
        'nombre' => $row['nombre'],
        'descripcion' => $row['descripcion'],
        'peso' => $row['peso']
      ];
    }
    return $objetos;

  }
  unset($query);
}

function conseguirEquipamientoClase($oBbdd, $id_clase){
  $equipamientoClase = [];

  $query = $oBbdd->prepare("select * from equipamientoclase where id_clase=$id_clase");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    $row = $query -> fetch();
    $equipamientoClase = [
      'id_arma' => $row['id_arma'],
      'id_objeto' => $row['id_objeto'],
      'id_armaduraOEscudo' => $row['id_armaduraOEscudo']
    ];

    return $equipamientoClase;

  }
  unset($query);
}

function conseguirConjurosClase($oBbdd, $id_clase){
  $conjuros = [];

  $query = $oBbdd->prepare("select * from conjurosclase where id_clase=$id_clase");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while($row = $query -> fetch()){
      array_push($conjuros, $row["id_conjuro"]);
    }

    return $conjuros;

  }
  unset($query);
}

function conseguirConjuros($oBbdd){
  $conjuros = [];

  $query = $oBbdd->prepare("select * from conjuros");
  $query->execute();

  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
    die("Error accedint a dades: " . $e[2]);
  } else {
    while($row = $query -> fetch()){
      $conjuros[$row["id"]] = [
        'nombre' => $row['nombre'],
        'nivel' => $row['nivel'],
        'descripcion' => $row['descripcion']
      ];
    }

    return $conjuros;

  }
  unset($query);
}

function modificador($puntuacion){
  $mod = floor(($puntuacion-10)/2);
  if ($mod>0) return "+".$mod;
  else return $mod;
}
function modificadorInt($puntuacion){
  return floor(($puntuacion-10)/2);
}

function subirAvatar($id_personaje, $camino, $oBbdd){
  $query = $oBbdd->prepare("select avatar from personajes where id=$id_personaje");
  $query->execute();
  $e= $query->errorInfo();
  if ($e[0]!='00000') {
    echo "\nPDO::errorInfo():\n";
  }
  $row = $query -> fetch();
  if ($row["avatar"]){
    unlink($row["avatar"]);
  }

  $query = $oBbdd->prepare("UPDATE personajes SET avatar=:camino where id=$id_personaje");
  $query->bindParam(':camino', $camino);
  $query->execute();

  $e= $query->errorInfo();
  echo "<form action='ficha.php' method='post' id='resultadoAvatar'> ";
  if ($e[0]!='00000') {
    echo "<input type='hidden' name='msg' value='Ha habido un error en la subida, comprueba que has subido una imagen .jpg o .jpeg o .png o .gif y de menos de 10Mb'>";
    echo "<input type='hidden' name='tipo' value='mal'>";
  } else {
    echo "<input type='hidden' name='msg' value='Se ha subido el avatar correctamente'>";
    echo "<input type='hidden' name='tipo' value='bien'>";
  }
  echo "<input type='hidden' name='personaje' value=$id_personaje></form>";
  echo "<script>document.getElementById('resultadoAvatar').submit();</script>";


  unset($query);
}
?>
