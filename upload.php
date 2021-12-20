<html><body>
<?php
session_start();
include "bbdd/bbddConexion.php";
include "bbdd/bbddFunciones.php";

$id_personaje = $_POST["personaje_id"];
$target_dir = "imagenes/avatares/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

echo "<form action='ficha.php' method='post' id='resultadoAvatar'> ";

// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
  $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
  if($check !== false) {
    $uploadOk = 1;
  } else {
    echo "<input type='hidden' name='msg' value='El archivo que has subido no es una imagen'>";
    $uploadOk = 0;
  }
}

// Check if file already exists
if (file_exists($target_file)) {
    echo "<input type='hidden' name='msg' value='La imagen ya existe'>";
    $uploadOk = 0;
  }

// Check file size (10mb)
if ($_FILES["fileToUpload"]["size"] > 10000000) {
    echo "<input type='hidden' name='msg' value='La imagen ha de menos de 10Mb'>";
    $uploadOk = 0;
  }

// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
    echo "<input type='hidden' name='msg' value='La imagen ha de ser .jpg o .jpeg o .png o .gif'>";
  $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
  // if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        subirAvatar($id_personaje, $target_file, $pdo);
    }
}
echo "<input type='hidden' name='tipo' value='mal'>";
echo "<input type='hidden' name='personaje' value=$id_personaje></form>";
echo "<script>document.getElementById('resultadoAvatar').submit();</script>";


?>
</body></html>