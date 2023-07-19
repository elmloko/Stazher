<?php
include 'includes/session.php';

if(isset($_POST['edit'])){
    $empid = $_POST['id'];
    $reason = $_POST['reason'];
    $date_licence = $_POST['date_licence'];

    $sql = "UPDATE licence
            SET reason = '$reason', date_licence = '$date_licence'
            WHERE id = '$empid'";

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

header('location: licence.php');
?>
