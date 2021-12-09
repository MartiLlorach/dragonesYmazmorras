<?php session_start() ?>
  <link rel="stylesheet" type="text/css" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script type="text/javascript" src="scripts/encabezado.js">
  </script>
  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-2Z0H7MVQSJ"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'G-2Z0H7MVQSJ');
  </script>
</head>
<body>
  <div id="encabezado">
    <div>
      <h1 class='titulo'>Generador de fichas de D&D 5e</h1>
    </div>
    <div class="botonesEncabezado">
      <?php
        if (isset($_SESSION['usuario'])){
      ?>
      <button type='button' class='boton botonUsuario' id='botonUsuario'>
        <?php echo $_SESSION['usuario']; ?> &nbsp<i class='fa fa-user'></i>
      </button>
      <div class="encabezadoDesplegable" id="encabezadoDesplegable">
        <a href="#" id="cierraSesion">cierra sesión &nbsp<i class='fa fa-sign-out'></i></a>
      </div>
      <button type="button" class="boton botonCasa" id="botonCasa"><i class="fa fa-home"></i></button>
      <?php } ?>
    </div>
  </div>
