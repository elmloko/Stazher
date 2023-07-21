<?php 
	include 'includes/session.php';

	if(isset($_POST['id'])){
		$id = $_POST['id'];
		$sql = "SELECT *, employees.id AS empid 
        FROM employees 
        LEFT JOIN position ON position.id = employees.position_id 
        LEFT JOIN schedules ON schedules.id = employees.schedule_id 
        LEFT JOIN modality ON modality.id = employees.modality_id 
        LEFT JOIN institution ON institution.id = employees.institution_id 
        LEFT JOIN career ON career.id = employees.career_id 
		LEFT JOIN area ON area.id = employees.area_id 
        WHERE employees.id = '$id'";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		echo json_encode($row);
	}
?>