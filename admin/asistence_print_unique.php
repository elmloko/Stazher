<?php
include 'includes/session.php';

function generateRow($conn, $employee_id)
{
    $contents = '';

    // Modificar la consulta SQL para filtrar por employee_id y calcular las horas acumuladas, incluyendo add_hr
    $sql = "SELECT *, 
                employees.employee_id AS empid, 
                attendance.id AS attid, 
                TIMESTAMPDIFF(SECOND, attendance.time_in, attendance.time_out) AS totalSeconds,
                IFNULL(employees.add_hr, 0) AS add_hr
            FROM attendance 
            LEFT JOIN employees ON employees.id=attendance.employee_id";

    if ($employee_id != '') {
        $sql .= " WHERE attendance.employee_id = $employee_id";
    }

    $sql .= " ORDER BY attendance.date DESC, attendance.time_in DESC";
    
    $query = $conn->query($sql);
    
    $totalSeconds = 0;
    $addHrIncluded = false; // Para asegurarnos de sumar add_hr solo una vez

    while ($row = $query->fetch_assoc()) {
        $timeIn = $row['time_in'] ? date('h:i A', strtotime($row['time_in'])) : '';
        $timeOut = $row['time_out'] ? date('h:i A', strtotime($row['time_out'])) : '';

        // Calcular las horas acumuladas
        if (is_numeric($row['totalSeconds'])) {
            $totalSeconds += $row['totalSeconds']; // Sumar los segundos totales
        }

        // Incluir add_hr solo si tiene un valor numérico válido, es mayor que cero, y solo una vez
        if (!$addHrIncluded && is_numeric($row['add_hr']) && $row['add_hr'] > 0) {
            $totalSeconds += $row['add_hr'] * 3600; // Convertir horas adicionales a segundos
            $addHrIncluded = true; // Asegurarse de que solo se sume una vez
        }

        $contents .= "
            <tr>
                <td>" . $row['employee_id'] . "</td>
                <td>" . $row['lastname'] . ", " . $row['firstname'] . "</td>
                <td>" . date('M d, Y', strtotime($row['date'])) . "</td>
                <td>" . $timeIn . "</td>
                <td>" . $timeOut . "</td>
            </tr>
        ";
    }

    // Convertir los segundos totales a horas y minutos
    $totalHours = floor($totalSeconds / 3600); // Obtener las horas completas
    $totalMinutes = floor(($totalSeconds % 3600) / 60); // Obtener los minutos restantes

    // Agregar fila para mostrar el total de horas acumuladas en horas y minutos
    $contents .= "
        <tr>
            <td colspan='4' align='right'><b>Total Horas Acumuladas:</b></td>
            <td align='center'><b>" . $totalHours . " horas y " . $totalMinutes . " minutos</b></td>
        </tr>
    ";

    return $contents;
}

require_once('../tcpdf/tcpdf.php');
$pdf = new TCPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetTitle('Agencia Boliviana de Correos - Horario Pasantes');
$pdf->SetHeaderData('', '', PDF_HEADER_TITLE, PDF_HEADER_STRING);
$pdf->setHeaderFont(array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
$pdf->SetDefaultMonospacedFont('helvetica');
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
$pdf->SetMargins(PDF_MARGIN_LEFT, '10', PDF_MARGIN_RIGHT);
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);
$pdf->SetAutoPageBreak(TRUE, 10);
$pdf->SetFont('helvetica', '', 11);
$pdf->AddPage();
$content = '';
$content .= '
      <h2 align="center">Agencia Boliviana de Correos</h2>
      <h3 align="center">Reporte de Asistencia de Pasantes</h3>
      <table border="1" cellspacing="0" cellpadding="3">  
          <tr>  
              <th width="15%" align="center"><b>Codigo de Pasante</b></th>
              <th width="25%" align="center"><b>Nombre Pasante</b></th>
              <th width="15%" align="center"><b>Fecha de Ingreso</b></th> 
              <th width="20%" align="center"><b>Hora de Entrada</b></th>
              <th width="20%" align="center"><b>Hora de Salida</b></th>
          </tr>  
     ';

// Obtener el employee_id desde el query string
$employee_id = isset($_GET['employee_id']) ? $_GET['employee_id'] : '';

$content .= generateRow($conn, $employee_id);
$content .= '</table>';
$pdf->writeHTML($content);
$pdf->Output('schedule_unique.pdf', 'I');
?>
