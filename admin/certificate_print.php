<?php
require_once('../tcpdf/tcpdf.php');

if (isset($_GET['empid'])) {
    $empid = $_GET['empid'];

    include 'includes/session.php';

    // Obtener los datos del empleado utilizando el empid
    $sql = "SELECT *, employees.id AS empid,
    DATE_FORMAT(SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(attendance.time_out, attendance.time_in)))), '%H') AS totalHours
  FROM employees
  LEFT JOIN position ON position.id = employees.position_id
  LEFT JOIN schedules ON schedules.id = employees.schedule_id
  LEFT JOIN modality ON modality.id = employees.modality_id
  LEFT JOIN institution ON institution.id = employees.institution_id
  LEFT JOIN career ON career.id = employees.career_id
  LEFT JOIN attendance ON attendance.employee_id = employees.id
  GROUP BY employees.id";

    $query = $conn->query($sql);
    $employee = $query->fetch_assoc();

    // Crear una instancia de TCPDF
    $pdf = new TCPDF('P', 'mm', 'A4', true, 'UTF-8');

    // Establecer información del documento
    $pdf->SetCreator(PDF_CREATOR);
    $pdf->SetAuthor('Nombre del Autor');
    $pdf->SetTitle('Carta de Certificado');
    $pdf->SetSubject('Carta de Certificado');
    $pdf->SetKeywords('TCPDF, Carta, Certificado');

    // Agregar una nueva página
    $pdf->AddPage();

    // Establecer el contenido de la carta
    $content = '
    <style type="text/css">
    .contenedor {
      text-align: center;
    }
    .centrado {
      display: inline-block;
    }
    </style>
    <div class="contenedor"> 
    <br>
    <h1 align="center"><u>CERTIFICADO DE PRACTICA PROFESIONAL</u></h1>
    <br>
    <p>El suscrito <b>Lic. Boris Mario Miranda Velasco</b>, Director Administrativo Financiero de la Agencia Boliviana de Correos - AGBC, en uso de las atribuciones conferidas por Ley.</p><br>
    <h2><b>CERTIFICA A QUIEN CORRESPONDA:</b></h2>
    <p>Que el <b>Sr./Sra.: ' . $employee['firstname'] . ' ' . $employee['lastname']. '</b>, con Cedula de Identidad <b>N° ' . $employee['identity_card'] . ' </b> expedido en la cuidad de La Paz, realizó su ' . $employee['type_modality'] . ' en la ' . $employee['description'] . ' - de nuestra institución, cumpliendo una carga horaria acumulada de ' . $employee['totalHours'] . ' horas de trabajo, con fecha de inicio desde el ' . $employee['created_on'] . ' hasta el  .</p>
    <br>
    <p>Durante su permanencia en la Agencia, el Sr./Sra.: ' . $employee['firstname'] . ' ' . $employee['lastname']. ' ha demostrado excelente aptitud, responsabilidad, puntualidad y colaboración en el desempeño de las funciones asignadas, desarrollando un alto grado de compromiso con la Agencia Boliviana de Correos - AGBC.</p>
    <br>
    <p>Exhortamos al estudiante a continuar con ese mismo espíritu, para bien personal y su respectiva proyección profesional, augurándole por nuestra parte permanente éxito.</p>
    <br>
    <p>Es cuanto tengo a bien certificar en honor a la verdad, para fines consiguientes.</p>
    <br>
    <p align="right">La Paz, Fecha: '.date('d').' de '.date('F').' del '.date('Y').'</p>
    </div>';

    

    // Escribir el contenido en el PDF
    $pdf->writeHTML($content, true, false, true, false, '');

    // Generar el archivo PDF y enviarlo al navegador para su descarga
    $pdf->Output('carta_certificado.pdf', 'I');
} else {
    // Redirigir si no se proporciona el parámetro empid
    header('Location: index.php');
    exit();
}
?>