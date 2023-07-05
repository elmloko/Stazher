<?php
include 'includes/session.php';

if(isset($_POST['edit'])){
    $id = $_POST['id'];
    $title = $_POST['title'];
    $reason = $_POST['reason'];
    $date = $_POST['date'];
    
    // Actualizar la licencia en la base de datos
    $sql = "UPDATE licence SET reason = '$reason', date_licence = '$date' WHERE id = '$id'";

    if($conn->query($sql)){
        $_SESSION['success'] = 'Modalidad Actualizada Satisfactoriamente';
    }
    else{
        $_SESSION['error'] = $conn->error;
    }
}

header('Location: licence.php');
?>

