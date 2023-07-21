<?php
include 'includes/session.php';

if(isset($_POST['edit'])){
	$id = $_POST['id'];
	$name_area = $_POST['name_area'];

	$sql = "UPDATE area SET name_area = '$name_area' WHERE id = '$id'";
	if($conn->query($sql)){
		$_SESSION['success'] = 'Posición Actualizada Satisfactoriamente';
	}
	else{
		$_SESSION['error'] = $conn->error;
	}
}

header('location: area.php');
?>