<?php
include 'includes/session.php';

if (isset($_POST['timeIn']) && isset($_POST['empid'])) {
  $timeIn = $_POST['timeIn'];
  $empid = $_POST['empid'];

  // Sanitiza los datos recibidos para evitar SQL injection
  $timeIn = $conn->real_escape_string($timeIn);
  $empid = $conn->real_escape_string($empid);

  // Actualiza la hora en el campo add_hr del empleado correspondiente
  $sql = "UPDATE employees SET add_hr='$timeIn' WHERE employee_id='$empid'";

  if ($conn->query($sql)) {
    $_SESSION['success'] = 'Hora agregada exitosamente';
  } else {
    $_SESSION['error'] = $conn->error;
  }
} else {
  $_SESSION['error'] = 'Rellena todos los campos';
}

header('Location: hours.php'); // Cambia esto a la ruta de tu vista principal
?>
