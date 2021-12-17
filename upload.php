<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>
 <?php 
	session_start();
	if(isset($_POST["imagenCargada"])){
		// get details of the uploaded file
		$fileTmpPath = $_FILES['imagenACargar']['tmp_name'];
		$fileName = $_FILES['imagenACargar']['name'];
		$fileSize = $_FILES['imagenACargar']['size'];
		$fileType = $_FILES['imagenACargar']['type'];
		$fileNameCmps = explode(".", $fileName);
		$fileExtension = strtolower(end($fileNameCmps));
		$newFileName = md5(time() . $fileName) . '.' . $fileExtension;
		$allowedfileExtensions = array('jpg', 'png', 'jpeg');
		if (in_array($fileExtension, $allowedfileExtensions)) {
			$uploadFileDir = './imagenes/personajes/';
			$dest_path = $uploadFileDir . $newFileName;
			if(move_uploaded_file($fileTmpPath, $dest_path)) {
			  $_SESSION["message"] ='File is successfully uploaded.';
			  $_SESSION["urlAvatar"]=$dest_path;
			} else{
			  $_SESSION["message"] = 'There was some error moving the file to upload directory. Please make sure the upload directory is writable by web server.';
			}
			header('Location: /listaFichas.php');
		}
		// directory in which the uploaded file will be moved
		
		 
		
	}
?>
</body>
</html>