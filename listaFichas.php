<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="scripts/ficha.js"></script>
	<title>Tus Fichas</title>
<?php include 'encabezado.php'; ?>
  <div id="listaFichas">
		<h1 class=titulo>Listado de fichas</h1>

    <?php
    $message = $_SESSION["message"];
    echo "$message";
    include 'bbdd/bbddConexion.php';
    include 'bbdd/bbddFunciones.php';
	    

          /* $check = getimagesize($_FILES["imagenACargar"]["tmp_name"]);
          if($check !== false){
              $image = $_FILES['image']['tmp_name'];
              $imgContent = addslashes(file_get_contents($image));

            /*
             * Insert image data into database
             */

            /*DB details
            $dbHost     = "20.73.245.143:3306";
            $dbUsername = "dnd";
            $dbPassword = "dnd_1";
            $dbName     = "dragonesymazmorras";

            //Create connection and select DB
            $db = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);

            // Check connection
            if($db->connect_error){
                die("Connection failed: " . $db->connect_error);
            }

            //Insert image content into database
            $insert = $db->query("UPDATE personajes set avatar=$imgContent");
            if($insert){
                echo "File uploaded successfully.";
            }else{
                echo "File upload failed, please try again.";
            } 
        }else{
            echo "Please select an image file to upload.";
        }
    }*/



      
    	if (isset($_SESSION["urlAvatar"])) {
    		$urlAvatar = $_SESSION['urlAvatar'];
    		$checkAvatar = $_SESSION['checkUrlAvatar'];
    		subirAvatar($urlAvatar,$checkAvatar,$pdo);
    	}
      conseguirFichas($_SESSION["usuario"],$pdo); //la funcion esta hay q arreglarla
    ?>
		<?php include 'pie.php' ?>
  </div>
</html>
