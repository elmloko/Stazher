<?php
include 'includes/session.php';

if(isset($_POST['add'])){
    $reason = $_POST['reason'];
    $date_licence = $_POST['date_licence'];
    $employee_id = $_POST['employee_id'];

    $sql = "INSERT INTO licence (reason, date_licence, employee_id)
            VALUES ('$reason', '$date_licence', (SELECT licence_id FROM employees WHERE employee_id = '$employee_id'))";

    if ($conn->query($sql)) {
        $_SESSION['success'] = 'Licencia creada exitosamente';
    } else {
        $_SESSION['error'] = 'Rellene el formulario de edición primero';
    }
}

header('location: licence.php');
?>




