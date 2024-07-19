<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
require '../vendor/autoload.php';

use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\IOFactory;
use PhpOffice\PhpWord\SimpleType\Jc;
use PhpOffice\PhpWord\Style\Paragraph;

if (isset($_GET['empid'])) {

  $empid = $_GET['empid'];

  include 'includes/session.php';

  // Obtener los datos del empleado utilizando el empid
  $sql = "SELECT employees.*, 
  position.*, 
  schedules.*, 
  modality.*, 
  area.*, 
  institution.*, 
  career.*, 
  attendance_hours.totalHours, 
  employees.id AS empid
FROM employees
LEFT JOIN position ON position.id = employees.position_id
LEFT JOIN schedules ON schedules.id = employees.schedule_id
LEFT JOIN modality ON modality.id = employees.modality_id
LEFT JOIN area ON area.id = employees.area_id
LEFT JOIN institution ON institution.id = employees.institution_id
LEFT JOIN career ON career.id = employees.career_id
LEFT JOIN (
SELECT 
   attendance.employee_id, 
   SUM(TIME_TO_SEC(TIMEDIFF(attendance.time_out, attendance.time_in))) / 3600 + SUM(TIME_TO_SEC(employees.add_hr)) / 3600 AS totalHours
FROM 
   attendance 
INNER JOIN 
   employees ON employees.id = attendance.employee_id
GROUP BY 
   attendance.employee_id
) AS attendance_hours ON employees.id = attendance_hours.employee_id
WHERE employees.employee_id = '$empid'";

  $query = $conn->query($sql);
  $employee = $query->fetch_assoc();

  // Verificar si se obtuvieron datos del empleado antes de acceder a sus propiedades.
  if (!empty($employee) && isset($employee['firstname'], $employee['lastname'], $employee['identity_card'], $employee['type_modality'], $employee['description'], $employee['name_area'], $employee['totalHours'], $employee['created_on'])) {
    
    // Convertir totalHours a solo horas, eliminando los minutos
    $totalHours = round($employee['totalHours']);

    // Crear una instancia de PHPWord
    $phpWord = new PhpWord();

    // Configuración de la página en formato carta
    $section = $phpWord->addSection(array(
      'pageSizeW' => \PhpOffice\PhpWord\Shared\Converter::inchToTwip(8.5),
      'pageSizeH' => \PhpOffice\PhpWord\Shared\Converter::inchToTwip(11),
      'marginTop' => \PhpOffice\PhpWord\Shared\Converter::inchToTwip(1),
      'marginLeft' => \PhpOffice\PhpWord\Shared\Converter::inchToTwip(1),
      'marginRight' => \PhpOffice\PhpWord\Shared\Converter::inchToTwip(1),
      'marginBottom' => \PhpOffice\PhpWord\Shared\Converter::inchToTwip(1)
    ));

    // Obtener la fecha actual en español
    $meses = array(
      'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
      'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'
    );
    $fecha_actual = date('d') . ' de ' . $meses[date('n') - 1] . ' del ' . date('Y');
    $fecha_creacion = date('d', strtotime($employee['created_on'])) . ' de ' . $meses[date('n', strtotime($employee['created_on'])) - 1] . ' del ' . date('Y', strtotime($employee['created_on']));

    // Crear un TextRun centrado para los títulos
    $titleStyle = array('bold' => true, 'size' => 15, 'underline' => 'single');
    $subtitleStyle = array('bold' => true, 'size' => 13, 'underline' => 'single');
    $section->addTextBreak(2);
    $title = $section->addTextRun(array('alignment' => Jc::CENTER));
    $title->addText('CERTIFICADO DE PRÁCTICA PROFESIONAL', $titleStyle);
    $section->addTextBreak(1);

    $subtitle = $section->addTextRun(array('alignment' => Jc::CENTER));
    $subtitle->addText('AGBC/DAF/RRHH-CPP-N°0/' . date('Y'), $subtitleStyle);
    $section->addTextBreak(2);

    // Configuración de alineación justificada
    $paragraphStyle = array('alignment' => Jc::BOTH, 'spaceAfter' => 240);

    $section->addText('El suscrito Lic. Boris Mario Miranda Velasco, Director Administrativo Financiero de la Agencia Boliviana de Correos - AGBC, en uso de las atribuciones conferidas por Ley.', ['name' => 'Arial', 'size' => 12], $paragraphStyle);
    $section->addTextBreak(1);
    $section->addText('CERTIFICA A QUIEN CORRESPONDA:', ['name' => 'Arial', 'size' => 13, 'bold' => true], $paragraphStyle);
    $section->addTextBreak(1);
    $section->addText('Que el Sr./Sra.: ' . $employee['firstname'] . ' ' . $employee['lastname'] . ', con Cédula de Identidad N° ' . $employee['identity_card'] . ' expedido en la ciudad de La Paz, realizó su ' . $employee['type_modality'] . ' en la ' . $employee['description'] . ' de nuestra institución, cumpliendo una carga horaria acumulada de ' . $totalHours . ' horas de trabajo, con fecha de inicio desde el ' . $fecha_creacion . ' hasta el ' . $fecha_actual . ' .', ['name' => 'Arial', 'size' => 12], $paragraphStyle);
    $section->addTextBreak(1);
    $section->addText('Durante su permanencia en la Agencia, el Sr./Sra.: ' . $employee['firstname'] . ' ' . $employee['lastname'] . ' ha demostrado excelente aptitud, responsabilidad, puntualidad y colaboración en el desempeño de las funciones asignadas, desarrollando un alto grado de compromiso con la Agencia Boliviana de Correos - AGBC.', ['name' => 'Arial', 'size' => 12], $paragraphStyle);
    $section->addTextBreak(1);
    $section->addText('Exhortamos al estudiante a continuar con ese mismo espíritu, para bien personal y su respectiva proyección profesional, augurándole por nuestra parte permanente éxito.', ['name' => 'Arial', 'size' => 12], $paragraphStyle);
    $section->addTextBreak(1);
    $section->addText('Es cuanto tengo a bien certificar en honor a la verdad, para fines consiguientes.', ['name' => 'Arial', 'size' => 12], $paragraphStyle);
    $section->addTextBreak(1);
    // Texto alineado a la derecha
    $section->addText('La Paz, Fecha: ' . $fecha_actual, ['name' => 'Arial', 'size' => 12, 'alignment' => Jc::RIGHT]);

    // Guardar el documento en un archivo temporal
    $tempFile = tempnam(sys_get_temp_dir(), 'PHPWord');
    $writer = IOFactory::createWriter($phpWord, 'Word2007');
    $writer->save($tempFile);

    // Forzar la descarga del archivo DOCX
    header('Content-Description: File Transfer');
    header('Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document');
    header('Content-Disposition: attachment; filename="certificado_practica.docx"');
    header('Content-Transfer-Encoding: binary');
    header('Expires: 0');
    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
    header('Pragma: public');
    header('Content-Length: ' . filesize($tempFile));
    ob_clean();
    flush();
    readfile($tempFile);
    unlink($tempFile);
    exit();
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
?>
