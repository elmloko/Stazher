<?php
include 'includes/session.php';

if(isset($_POST['id'])){
    $id = $_POST['id'];
    $sql = "SELECT l.*, e.id AS empid, e.firstname, e.lastname
            FROM licence l
            LEFT JOIN employees e ON e.id = l.employee_id
            WHERE l.id = '$id'";
    $query = $conn->query($sql);
    $row = $query->fetch_assoc();

    echo json_encode($row);
}
?>
