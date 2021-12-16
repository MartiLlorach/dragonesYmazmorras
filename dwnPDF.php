<?php 
// Configure Dompdf according to your needs
    $pdfOptions = new Options();
    $pdfOptions->set('defaultFont', 'Arial');
    // Instantiate Dompdf with our options
    $dompdf = new Dompdf($pdfOptions);
    // Retrieve the HTML generated in our twig file
    $html = require 'pruebaPDF.php';
    // Load HTML to Dompdf
    $dompdf->loadHtml($html);
    // (Optional) Setup the paper size and orientation 'portrait' or 'portrait'
    $dompdf->setPaper('A3', 'landscape');
    // Render the HTML as PDF
    $dompdf->render();
    // Output the generated PDF to Browser (force download)
    $dompdf->stream("exportUsers.pdf", [
        "Attachment" => true
    ]);
?>
