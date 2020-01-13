<?php
	require_once('connection.php');
	$name      = $_POST['name'];
	$address   = $_POST['address'];
	$contactNo = $_POST['contactNo'];
	$remarks   = $_POST['remarks'];

	echo $title;
	$conn->exec("INSERT INTO suppliers (name,address,contact_no,remarks) VALUES ('".$name."','".$address."','".$contactNo."','".$remarks."')");	
	$conn=null;
?>