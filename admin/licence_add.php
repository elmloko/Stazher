<?php
include 'includes/session.php';

if(isset($_POST['add'])){
  $title = $_POST['title'];
  $reason = $_POST['reason'];
  $dateLicence = $_POST['date_licence'];

  // Insertar los datos en la base de datos
  $sql = "INSERT INTO licence (employee_id, reason, date_licence) VALUES ('$title')";
  
  if($conn->query($sql)){
    $_SESSION['success'] = 'Position added successfully';
  }
  else{
    $_SESSION['error'] = $conn->error;
  }
}	


header('location: licence.php');

?>
