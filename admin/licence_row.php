<?php 
	include 'includes/session.php';

	if(isset($_POST['id'])){
		$id = $_POST['id'];
		$sql = "SELECT e.employee_id, e.firstname, e.lastname, l.reason, l.date_licence
		FROM employees AS e
		JOIN licence AS l ON e.licence_id = l.id;";
		$query = $conn->query($sql);
		$row = $query->fetch_assoc();

		echo json_encode($row);
	}
?>