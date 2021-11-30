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

?>
