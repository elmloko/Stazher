<?php
	include 'includes/session.php';

	if(isset($_POST['add'])){
		$firstname = $_POST['firstname'];
		$lastname = $_POST['lastname'];
		$address = $_POST['address'];
		$email = $_POST['email'];
		$identity_card = $_POST['identity_card'];
		$birthdate = $_POST['birthdate'];
		$contact = $_POST['contact'];
		$gender = $_POST['gender'];
		$position = $_POST['position'];
		$career = $_POST['career'];
		$institution = $_POST['institution'];
		$modality = $_POST['modality'];
		$area = $_POST['area'];
		$schedule = $_POST['schedule'];
		$filename = $_FILES['photo']['name'];
		if(!empty($filename)){
			move_uploaded_file($_FILES['photo']['tmp_name'], '../images/'.$filename);	
		}
		//creating employeeid
		$employee_id = strtoupper(substr($firstname, 0, 1) . substr($lastname, 0, 1) . $identity_card);

		// $letters = '';
		// $numbers = '';
		// foreach (range('A', 'Z') as $char) {
		//     $letters .= $char;
		// }
		// for($i = 0; $i < 10; $i++){
		// 	$numbers .= $i;
		// }
		// $employee_id = substr(str_shuffle($letters), 0, 3).substr(str_shuffle($numbers), 0, 9);
		//
		$sql = "INSERT INTO employees (employee_id, firstname, lastname, address, birthdate, contact_info, gender, position_id, career_id, institution_id, modality_id, schedule_id, area_id, photo, identity_card, email, created_on) VALUES ('$employee_id', '$firstname', '$lastname', '$address', '$birthdate', '$contact', '$gender', '$position', '$career', '$institution', '$modality', '$area', '$schedule', '$filename', '$identity_card', '$email', NOW())";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Pasante añadido satisfactoriamente';
		}
		else{
			$_SESSION['error'] = $conn->error;
		}

	}
	else{
		$_SESSION['error'] = 'Fill up add form first';
	}

	header('location: employee.php');
