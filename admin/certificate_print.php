<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
require_once('../tcpdf/tcpdf.php');

if (isset($_GET['empid'])) {

  $empid = $_GET['empid'];

  include 'includes/session.php';

  // Obtener los datos del empleado utilizando el empid
  $sql = "SELECT *, employees.id AS empid
  FROM employees
  LEFT JOIN position ON position.id = employees.position_id
  LEFT JOIN schedules ON schedules.id = employees.schedule_id
  LEFT JOIN modality ON modality.id = employees.modality_id
  LEFT JOIN area ON area.id = employees.area_id
  LEFT JOIN institution ON institution.id = employees.institution_id
  LEFT JOIN career ON career.id = employees.career_id
  LEFT JOIN (
      SELECT employee_id, 
      DATE_FORMAT(SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(attendance.time_out, attendance.time_in)))), '%H') AS totalHours
      FROM attendance
      GROUP BY employee_id
  ) AS attendance_hours ON employees.id = attendance_hours.employee_id
  WHERE employees.employee_id = '$empid'";

  $query = $conn->query($sql);
  $employee = $query->fetch_assoc();
  // Verificar si se obtuvieron datos del empleado antes de acceder a sus propiedades.
  if (!empty($employee) && isset($employee['firstname'], $employee['lastname'], $employee['identity_card'], $employee['type_modality'], $employee['description'], $employee['name_area'], $employee['totalHours'], $employee['created_on'])) {
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
     
// Obtener la fecha actual en español
    $meses = array(
    'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
    'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre');// Configurar la localización a español
    $fecha_actual = date('d') . ' de ' . $meses[date('n') - 1] . ' del ' . date('Y'); 
    $fecha_creacion = date('d', strtotime($employee['created_on'])) . ' de ' . $meses[date('n', strtotime($employee['created_on'])) - 1] . ' del ' . date('Y', strtotime($employee['created_on']));
      // Generar el contenido del certificado utilizando las claves del array $employee
      $content = '
      <style type="text/css">
      .centered-content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
      }
      .derecha {
        text-align: right;
      }
      .justificado {
        text-align: justify;
      }
      </style>
      <div class="centered-content">
      <br>
      <h1><u>CERTIFICADO DE PRÁCTICA PROFESIONAL</u></h1>
      <h4><u>AGBC/DAF/RRHH-CPP-N°0/' . date('Y') . '</u></h4>
      <br>
      <p class="justificado">El suscrito <b>Lic. Boris Mario Miranda Velasco</b>, Director Administrativo Financiero de la Agencia Boliviana de Correos - AGBC, en uso de las atribuciones conferidas por Ley.</p><br>
      <h2><b>CERTIFICA A QUIEN CORRESPONDA:</b></h2>
      <p class="justificado"> Que el <b>Sr./Sra.: ' . $employee['firstname'] . ' ' . $employee['lastname']. '</b>, con Cédula de Identidad <b>N° ' . $employee['identity_card'] . ' </b> expedido en la ciudad de La Paz, realizó su ' . $employee['type_modality'] . ' en la ' . $employee['description'] . ' - ' . $employee['name_area'] . ' de nuestra institución, cumpliendo una carga horaria acumulada de ' . $employee['totalHours'] . ' horas de trabajo, con fecha de inicio desde el ' . $fecha_creacion . ' hasta el ' . $fecha_actual . ' .</p>
      <br>
      <p class="justificado">Durante su permanencia en la Agencia, el Sr./Sra.: ' . $employee['firstname'] . ' ' . $employee['lastname']. ' ha demostrado excelente aptitud, responsabilidad, puntualidad y colaboración en el desempeño de las funciones asignadas, desarrollando un alto grado de compromiso con la Agencia Boliviana de Correos - AGBC.</p>
      <br>
      <p class="justificado">Exhortamos al estudiante a continuar con ese mismo espíritu, para bien personal y su respectiva proyección profesional, augurándole por nuestra parte permanente éxito.</p>
      <br>
      <p class="justificado">Es cuanto tengo a bien certificar en honor a la verdad, para fines consiguientes.</p>
      <br>
      <p class="derecha">La Paz, Fecha: ' . $fecha_actual . '</p>
      </div>';
      
      // Escribir el contenido en el PDF
      $pdf->writeHTML($content, true, false, true, false, '');

      // Generar el archivo PDF y enviarlo al navegador para su descarga
      $pdf->Output('carta_certificado.pdf', 'I');
  } else {
      // Si faltan datos o el array está vacío, redirigir a otra página o mostrar un mensaje de error
      header('Location: error_page.php');
      exit();
  }

} else {
  // Redirigir si no se proporciona el parámetro empid
  header('Location: index.php');
  exit();
}
