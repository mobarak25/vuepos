<?php
	require_once('connection.php');
	$title=$_POST['title'];

	echo $title;
	$conn->exec("INSERT INTO company (company_name) VALUES ('".$title."')");	
	$conn=null;
?>