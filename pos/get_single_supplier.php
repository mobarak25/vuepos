<?php
	require_once('connection.php');

	$sql = "SELECT FROM suppliers WHERE id =  :supplierID";

	$stmt = $conn->prepare($sql);
	$stmt->bindParam(':supplierID',$_POST['id'], PDO::PARAM_INT);   
	$stmt->execute();	
	
	$conn=null;
?>