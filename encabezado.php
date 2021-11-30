  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type="text/javascript" src="scripts/encabezado.js">

  </script>
</head>
<body>
  <div id="encabezado">
    <div>
      <h1 class='titulo'>Generador de fichas de D&D 5e</h1>
    </div>
    <div class="botonesEncabezado">
      <?php
        if ($_SERVER['REQUEST_URI'] !== "/paginaInicio.php"){
      ?>
      <button type='button' class='boton botonUsuario' id='botonUsuario'>usuario &nbsp<i class='fa fa-user'></i></button>
      <div class="encabezadoDesplegable" id="encabezadoDesplegable">
        <a href="#">cierra sesión &nbsp<i class='fa fa-sign-out'></i></a>
      </div>

      <?php } ?>

      <button type="button" class="boton botonCasa" id="botonCasa"><i class="fa fa-home"></i></button>
    </div>
  </div>
