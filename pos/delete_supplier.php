<?php
	require_once('connection.php');

	$sql = "DELETE FROM suppliers WHERE id =  :supplierId";

	$stmt = $conn->prepare($sql);
	$stmt->bindParam(':supplierId',$_POST['id'], PDO::PARAM_INT);   
	$stmt->execute();	
	
	$conn=null;
?>