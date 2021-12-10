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
          echo "<p class=errorMsg>El nombre de usuario ya existe.</p>";
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
          header("Location: paginaInicio.php");
        }else{
          echo "<p class=errorMsg>Las contraseñas no coinciden.</p>";
        }
      }
      //eliminem els objectes per alliberar memòria 
      unset($pdo); 
      unset($query);
  }
?>
