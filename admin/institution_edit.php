<?php
	include 'includes/session.php';

	if(isset($_POST['edit'])){
		$id = $_POST['id'];
		$name_institution = $_POST['name_institution'];

		$sql = "UPDATE institution SET name_institution = '$name_institution' WHERE id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Institucion Actualizada Satisfactoriamente';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	}

	header('location:institution.php');

?>