<?php
	$conn = new mysqli('localhost', 'root', '', 'stazher');

	if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	}
	
?>