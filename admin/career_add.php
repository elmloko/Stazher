<?php
	include 'includes/session.php';

	if(isset($_POST['add'])){
		$title = $_POST['title'];
		$name_career = $_POST['name_career'];

		$sql = "INSERT INTO career (name_career) VALUES ('$title')";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Position added successfully';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	}	


	header('location: career.php');

?>