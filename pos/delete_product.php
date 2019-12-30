<?php
	require_once('connection.php');

	$sql = "DELETE FROM products WHERE id =  :productId";

	$stmt = $conn->prepare($sql);
	$stmt->bindParam(':productId',$_POST['product_id'], PDO::PARAM_INT);   
	$stmt->execute();	
	
	$conn=null;
?>