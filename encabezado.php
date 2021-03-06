<?php session_start() ?>
  <link rel="icon" type="image/png" href="imagenes/favicon.png">
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
    <?php
        if (!isset($_SESSION['usuario'])) {
          echo "<div id='dragonInicio'><img id='gifDragon' src='imagenes/dragonAnimado.gif'/></div>";
        }
    ?>
    <div class="botonesEncabezado">
      <?php                
        if (isset($_SESSION['usuario'])){
      ?>
      <button type='button' class='boton botonUsuario' id='botonUsuario' accesskey="u">
        <?php echo $_SESSION['usuario']; ?> &nbsp<i class='fa fa-user'></i>
      </button>
      <div class="encabezadoDesplegable" id="encabezadoDesplegable">
        <a href="#" id="cierraSesion" accesskey="s">cierra sesión &nbsp<i class='fa fa-sign-out'></i></a>
      </div>
      <button type="button" class="boton botonCasa" id="botonCasa" accesskey="h"><i class="fa fa-home"></i></button>
    <?php } else if (!$banderaInicio & !$banderaCrearCuenta){
      header('Location: '.'paginaInicio.php');
    }?>
    </div>
  </div>
    <?php
        $urlActual = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        $paginaActual=end(explode("/",$urlActual));
        if ($paginaActual!="crearCuenta.php") {
          echo "<div id='hilo'>";
          if ($paginaActual!="paginaInicio.php") {
            echo "<div id='linksAriadna'>";
            if ($paginaActual=="tablero.php") {
              echo "Tablero";
            } else if ($paginaActual=="crearFicha.php") {
              echo "<a href='tablero.php' class='link'>Tablero</a> > Crear Ficha";
            } else if ($paginaActual=="listaFichas.php") {
              echo "<a href='tablero.php' class='link'>Tablero</a> > Listado de Fichas";
            } else if ($paginaActual=="ficha.php") {
              echo "<a href='tablero.php' class='link'>Tablero</a> > <a href='listaFichas.php' class='link'>Listado de Fichas</a> > Ficha";
            } else if ($paginaActual=="testearFicha.php") {
              echo "<a href='tablero.php' class='link'>Tablero</a> > Lucha";
            }
            echo "</div>";
          }
        }
      ?>
  </div>
