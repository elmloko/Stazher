<?php
include 'includes/session.php';

if(isset($_POST['add'])){
    $reason = $_POST['reason'];
    $date_absences = $_POST['date_absences'];
    $id = $_POST['employee_id'];

    $sql = "INSERT INTO absences (reason, date_absences, employee_id)
            VALUES ('$reason', '$date_absences', (SELECT id FROM employees WHERE employee_id = '$id'))";

    if ($conn->query($sql)) {
        $_SESSION['success'] = 'Licencia creada exitosamente';
    } else {
        $_SESSION['error'] = 'Rellene el formulario de edición primero';
    }
}

header('location: absences.php');
?>




