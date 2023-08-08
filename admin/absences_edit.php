<?php
include 'includes/session.php';

if(isset($_POST['edit'])){
    $id = $_POST['id'];
    $reason = $_POST['reason'];
    $date_absences = $_POST['date_absences'];

    $sql = "UPDATE absences SET reason = '$reason', date_absences = '$date_absences' WHERE employee_id = '$id'";

    if($conn->query($sql)){
        $_SESSION['success'] = 'Licencia actualizada satisfactoriamente';
    }
    else{
        $_SESSION['error'] = 'Error al actualizar la licencia: ' . $conn->error;
    }
}
else{
    $_SESSION['error'] = 'Rellene el formulario de edición primero';
}

header('location: absences.php');
?>
