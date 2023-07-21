<?php
	include 'includes/session.php';

	if(isset($_POST['add'])){
		$name_area = $_POST['name_area'];

		$sql = "INSERT INTO area (name_area) VALUES ('$name_area')";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Position added successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	}	


	header('location: area.php');

?>