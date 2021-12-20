<?php 
	// Guardamos el contenido de contenido.php en la variable html
ob_start();
require "fichaMaquetadaPdf.php";
$html = ob_get_clean();


// Jalamos las librerias de dompdf
require_once 'dompdf/autoload.inc.php';

use Dompdf\Dompdf;
/*use Dompdf\Options;*/

// Inicializamos dompdf
/*$options = new Options();
$options->set('isRemoteEnabled',true);*/

$dompdf = new Dompdf();
//$dompdf ->set_base_path(dirname(__FILE__));
//$dompdf->set_base_path('localhost/exampls/style.css');
// Le pasamos el html a dompdf
//$html .= '<link type="text/css" href="style.css" rel="stylesheet" />';
$dompdf->loadHtml($html);
// Colocamos als propiedades de la hoja
$dompdf->setPaper("A4", "landscape");

// Escribimos el html en el PDF
$dompdf->render();

// Ponemos el PDF en el browser
$dompdf->stream();

?>