<?php

try {
  $hostname = "20.73.245.143:3306";
  $dbname = "dragonesymazmorras";
  $username = "dnd";
  $pw = "dnd_1";
  $pdo = new PDO ("mysql:host=$hostname;dbname=$dbname","$username","$pw");
} catch (PDOException $e) {
  echo "Failed to get DB handle: " . $e->getMessage() . "\n";
  exit;
}


?>
