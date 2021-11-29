<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript" src="paginaInicio.js"></script>
	<title>D&D Generador de fichas</title>
</head>
<body>
	<header>
		<div id="header">
			<h1>D&D Generador de fichas</h1>
		</div>
	</header>
	<div id="mainPage"> 
		<div id="mainLeft">
			<img width="400px" height="200px" src="imagenes/portadadnd.png">
			<p>Si eres diseñador o has trasteado con programas de diseño, probablemente te hayas encontrado con un texto conocido como Lorem Ipsum. ... Su título deriva del latín dolorem ipsum, que significa «el dolor en sí».</p>
		</div>
		<div id="mainRight">
			<form id="logInForm" autocomplete="off" method="POST">
				<h2>Iniciar sesión</h2>
				<input type="text" id="usuario" name="usuario" placeholder="Usuario" maxlength="10" required>
				<input type="password" id="contrasena" name="contrasena" placeholder="Contraseña" maxlength="10" required>
				<input type="submit" value="Entrar">
				<a class="link" onclick="passwordOlvidada()"><u>¿Has olvidado la contraseña?</u></a>
				<button>Crear una cuenta nueva</button>
			</form>
			<?php
			  if(!isset($_POST["usuario"])){
		        die();
		      }

		      try {
		        $hostname = "localhost";
		        $dbname = "dragonesYmazmorras";
		        $username = "manolo";
		        $pw = "manolo123";
		        $pdo = new PDO ("mysql:host=$hostname;dbname=$dbname","$username","$pw");
		      } catch (PDOException $e) {
		        echo "Failed to get DB handle: " . $e->getMessage() . "\n";
		        exit;
		      }


		      //preparem i executem la consulta
		      $query = $pdo->prepare("select * FROM usuarios where nombre= :user and contrasena= :password"); //SHA2(:password,256)

		      $query->bindParam(':user', $_POST["usuario"]);
		      $query->bindParam(':password',$_POST["contrasena"]);

		      $query->execute();      


		        //comprovo errors:
		      $e= $query->errorInfo();
		      if ($e[0]!='00000') {
		        echo "\nPDO::errorInfo():\n";
		        die("Error accedint a dades: " . $e[2]);
		      }  
		    

		      //anem agafant les fileres d'amb una amb una
		      $row = $query->fetch();
		      if($row && $_POST['usuario']){
		      	  $usuario=$_POST["usuario"];
		          echo "<script>logInCorrecto('$usuario');</script>";
		      }else{
		          echo "<script>logInIncorrecto();</script>";
		      }

		      //eliminem els objectes per alliberar memòria 
		      unset($pdo); 
		      unset($query);
		    ?>
		</div>
	</div>
</body>
</html>