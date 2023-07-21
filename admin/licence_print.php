<?php
include 'includes/session.php';

function generateRow($conn)
{
  $contents = '';
 
 $sql = "SELECT l.*, e.employee_id AS empid, e.firstname, e.lastname
  FROM licence l
  LEFT JOIN employees e ON e.id = l.employee_id
  ORDER BY l.date_licence DESC";
  
  $query = $conn->query($sql);
  $total = 0;
  
  while ($row = $query->fetch_assoc()) {
    $contents .= "
			<tr>
        <td>" . $row['empid'] . "</td>
				<td>" . $row['lastname'] . ", " . $row['firstname'] . "</td>
        <td>" . $row['reason'] . "</td>
        <td>" . $row['date_licence'] . "</td>
      </tr>
			";
  }
  return $contents;

}

require_once('../tcpdf/tcpdf.php');
$pdf = new TCPDF('L', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetTitle('Agencia Boliviana de Correos - Licencia Pasantes');
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
      	<h3 align="center">Licencia de Pasantes</h3>
      	<table border="1" cellspacing="0" cellpadding="3">  
           <tr>  
              <th width="15%" align="center"><b>Codigo de Pasante</b></th>
           		<th width="25%" align="center"><b>Nombre Pasante</b></th>
				      <th width="50%" align="center"><b>Razon o Motivo</b></th> 
              <th width="15%" align="center"><b>Fecha Licencia</b></th>
           </tr>  
      ';
$content .= generateRow($conn);
$content .= '</table>';
$pdf->writeHTML($content);
$pdf->Output('schedule.pdf', 'I');
