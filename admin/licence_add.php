<?php
include 'includes/session.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // Obtener los datos del formulario
  $employeeId = $_POST['employee_id'];
  $reason = $_POST['reason'];
  $dateLicence = $_POST['date_licence'];

  // Insertar los datos en la base de datos
  $sql = "INSERT INTO licence (employee_id, reason, date_licence) VALUES (?, ?, ?)";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("sss", $employeeId, $reason, $dateLicence);

  if ($stmt->execute()) {
    $_SESSION['success'] = 'La licencia ha sido agregada exitosamente.';
  } else {
    $_SESSION['error'] = 'Error al agregar la licencia: ' . $stmt->error;
  }

  $stmt->close();
  $conn->close();

  // Redirigir a la página principal
  header("Location: licence.php");
  exit();
}
?>


