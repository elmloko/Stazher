<?php
	include 'includes/session.php';

	if(isset($_POST['edit'])){
		$id = $_POST['id'];
		$title = $_POST['title'];
		$name_career = $_POST['name_career'];

		$sql = "UPDATE career SET name_career = '$title' WHERE id = '$id'";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Carrera Universitaria Actualizada Satisfactoriamente';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}
	}
	// else{
	// 	$_SESSION['error'] = 'Rellene el formulario de edición primero';
	// }

	header('location:career.php');

?>