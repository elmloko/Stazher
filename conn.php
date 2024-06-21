<?php
	$conn = new mysqli('172.65.10.170', 'agbc', 'agbc', 'stazher');

	if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	}
	
?>