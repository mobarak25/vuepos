<?php
	require_once('connection.php');

	$sql = "DELETE FROM company WHERE id =  :comId";

	$stmt = $conn->prepare($sql);
	$stmt->bindParam(':comId',$_POST['id'], PDO::PARAM_INT);   
	$stmt->execute();	
	
	$conn=null;
?>