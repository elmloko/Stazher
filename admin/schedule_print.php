<?php
	include 'includes/session.php';

	function generateRow($conn){
		$contents = '';
		
$sql = "SELECT 
employees.*, 
position.*,
schedules.*,
modality.*,
institution.*,
career.*,
IFNULL(totalHours.totalHours, 0) AS totalHours
FROM 
employees 
LEFT JOIN position ON position.id = employees.position_id 
LEFT JOIN schedules ON schedules.id = employees.schedule_id
LEFT JOIN modality ON modality.id = employees.modality_id
LEFT JOIN institution ON institution.id = employees.institution_id
LEFT JOIN career ON career.id = employees.career_id
LEFT JOIN (
  SELECT 
    employee_id, 
    SUM(TIME_TO_SEC(TIMEDIFF(time_out, time_in))) AS totalHours 
  FROM 
    attendance 
  GROUP BY 
    employee_id
) AS totalHours ON totalHours.employee_id = employees.id;
";
		$query = $conn->query($sql);
		$total = 0;
		while($row = $query->fetch_assoc()){
			$contents .= "
			<tr>
            <td>".$row['employee_id']."</td>
				<td>".$row['lastname'].", ".$row['firstname']."</td>
                <td>".$row['identity_card']."</td>
                <td>".$row['email']."</td>
                <td>".$row['description']."</td>
                <td>".$row['name_institution']."</td>
                <td>".$row['type_modality']."</td>
                <td>".$row['name_career']."</td>
				<td>".date('h:i A', strtotime($row['time_in'])).' - '. date('h:i A', strtotime($row['time_out']))."</td>
                <td>".$row['totalHours']."</td>
                </tr>
			";
		}
    // Cálculo de la suma de horas
// Cálculo de la suma de horas
$sqlAttendance = "SELECT attendance.employee_id AS empid, 
                         SUM(TIME_TO_SEC(TIMEDIFF(attendance.time_out, attendance.time_in))) AS totalHours 
                  FROM attendance 
                  GROUP BY attendance.employee_id";
$queryAttendance = $conn->query($sqlAttendance);
$attendanceData = array();

while ($rowAttendance = $queryAttendance->fetch_assoc()) {
    $empid = $rowAttendance['empid'];
    $totalHours = $rowAttendance['totalHours'];

    // Almacena los datos en un array asociativo para usarlos después
    $attendanceData[$empid] = gmdate('H:i', $totalHours);
}
        
		return $contents;
        
	}

	require_once('../tcpdf/tcpdf.php');  
    $pdf = new TCPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);  
    $pdf->SetCreator(PDF_CREATOR);  
    $pdf->SetTitle('Agencia Boliviana de Correos - Horario Pasantes');  
    $pdf->SetHeaderData('', '', PDF_HEADER_TITLE, PDF_HEADER_STRING);  
    $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));  
    $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));  
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
      	<h3 align="center">Horario de Pasantes</h3>
      	<table border="1" cellspacing="0" cellpadding="3">  
           <tr>  
           		<th width="10%" align="center"><b>Nombre Pasante</b></th>
                <th width="10%" align="center"><b>Codigo de Pasante</b></th>
				<th width="10%" align="center"><b>Horario</b></th> 
                <th width="10%" align="center"><b>Nombre Pasante</b></th>
                <th width="10%" align="center"><b>Codigo de Pasante</b></th>
				<th width="10%" align="center"><b>Horario</b></th>
                <th width="10%" align="center"><b>Nombre Pasante</b></th>
                <th width="10%" align="center"><b>Codigo de Pasante</b></th>
				<th width="10%" align="center"><b>Horario</b></th>
                <th width="10%" align="center"><b>Horario</b></th>

           </tr>  
      ';  
    $content .= generateRow($conn); 
    $content .= '</table>';  
    $pdf->writeHTML($content);  
    $pdf->Output('schedule.pdf', 'I');
?>
