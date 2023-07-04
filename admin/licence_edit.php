<?php
include 'includes/session.php';

if (isset($_POST['edit'])) {
    if (isset($_POST['edit_licence_id'])) {
        $licenceId = $_POST['edit_licence_id'];
        $reason = $_POST['reason'];
        $date = $_POST['date'];

        // Actualizar la licencia en la base de datos
        $sql = "UPDATE licence SET reason = '$reason', date_licence = '$date' WHERE id = $licenceId";

        if ($conn->query($sql)) {
            $_SESSION['success'] = 'Licencia actualizada satisfactoriamente';
        } else {
            $_SESSION['error'] = $conn->error;
        }
    } else {
        $_SESSION['error'] = 'No se recibió el ID de la licencia';
    }
}

header('Location: licence.php');
?>

