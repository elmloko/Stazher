<?php
	include 'includes/session.php';

	if(isset($_POST['edit'])){
		$id = $_POST['id'];
		$title = $_POST['title'];
		$type_modality = $_POST['type_modality'];
		// $sql = "UPDATE position SET description = '$title', rate = '$rate' WHERE id = '$id'";
		$sql = "UPDATE modality SET type_modality = '$title' WHERE id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Modalidad Actualizada Satisfactoriamente';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	}
	// else{
	// 	$_SESSION['error'] = 'Rellene el formulario de edición primero';
	// }

	header('location:modality.php');

?>