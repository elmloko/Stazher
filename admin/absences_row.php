<?php
include 'includes/session.php';

if(isset($_POST['id'])){
    $id = $_POST['id'];
    $sql = "SELECT a.*, e.id AS empid, e.firstname, e.lastname
            FROM absences a
            LEFT JOIN employees e ON e.id = a.employee_id
            WHERE a.id = '$id'";
    $query = $conn->query($sql);
    $row = $query->fetch_assoc();

    echo json_encode($row);
}
?>
