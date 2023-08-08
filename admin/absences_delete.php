<?php
include 'includes/session.php';

if(isset($_POST['delete'])){
    $id = $_POST['del_empid'];

    $sql = "DELETE FROM absences WHERE id = '$id'";

    if($conn->query($sql)){
        $_SESSION['success'] = 'Licencia eliminada satisfactoriamente';
    }
    else{
        $_SESSION['error'] = $conn->error;
    }
}
else{
    $_SESSION['error'] = 'Error al eliminar la licencia';
}

header('location: absences.php');
