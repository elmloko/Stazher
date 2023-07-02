<?php
	include 'includes/session.php';

	if(isset($_POST['add'])){
		$title = $_POST['title'];
		$type_modality = $_POST['type_modality'];

		$sql = "INSERT INTO modality (type_modality) VALUES ('$title')";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Position added successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	}	


	header('location: modality.php');

?>