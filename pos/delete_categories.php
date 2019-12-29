<?php
	require_once('connection.php');

	$sql = "DELETE FROM categories WHERE id =  :catId";

	$stmt = $conn->prepare($sql);
	$stmt->bindParam(':catId',$_POST['id'], PDO::PARAM_INT);   
	$stmt->execute();	
	
	$conn=null;
?>