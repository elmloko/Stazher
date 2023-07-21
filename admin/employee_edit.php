<?php
	include 'includes/session.php';

	if(isset($_POST['edit'])){
		$empid = $_POST['id'];
		$firstname = $_POST['firstname'];
		$lastname = $_POST['lastname'];
		$identity_card = $_POST['identity_card'];
		$email = $_POST['email'];
		$address = $_POST['address'];
		$birthdate = $_POST['birthdate'];
		$contact = $_POST['contact'];
		$gender = $_POST['gender'];
		$position = $_POST['position'];
		$schedule = $_POST['schedule'];
		$career = $_POST['career'];
		$area = $_POST['area'];
		$institution = $_POST['institution'];
		$modality = $_POST['modality'];
		
		$sql = "UPDATE employees SET firstname = '$firstname', lastname = '$lastname', identity_card = '$identity_card', email = '$email', address = '$address', birthdate = '$birthdate', contact_info = '$contact', gender = '$gender', position_id = '$position', schedule_id = '$schedule', career_id = '$career', area_id = '$area', institution_id = '$institution', modality_id = '$modality' WHERE id = '$empid'";
		
		if($conn->query($sql)){
			$_SESSION['success'] = 'Pasante actualizado con éxito';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}

	}
	else{
		$_SESSION['error'] = 'Seleccionar pasante para editar primero';
	}

	header('location: employee.php');
?>
