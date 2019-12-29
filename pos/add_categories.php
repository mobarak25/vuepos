<?php
	require_once('connection.php');
	$title=$_POST['title'];

	echo $title;
	$conn->exec("INSERT INTO categories(title) VALUES ('".$title."')");	
	$conn=null;
?>