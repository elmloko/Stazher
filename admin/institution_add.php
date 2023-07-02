<?php
	include 'includes/session.php';

	if(isset($_POST['add'])){
		$title = $_POST['title'];
		$name_institution = $_POST['name_institution'];		

		$sql = "INSERT INTO institution (name_institution) VALUES ('$title')";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Institution added successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	}	

	header('location: institution.php');

?>