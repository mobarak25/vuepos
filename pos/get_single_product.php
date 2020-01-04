<?php
	require_once('connection.php');

	$getId = $_POST['id'];
	
	$stm = $conn->query("SELECT p.*,c.title FROM products p LEFT JOIN categories c ON p.cat_id = c.id WHERE p.id = $getId;");
	$rows = $stm->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($rows);

	$conn=null;




	$sql = "SELECT p.*,c.title FROM products p LEFT JOIN categories c ON p.cat_id = c.id WHERE p.id =  :productId";
	
	$stmt = $conn->prepare($sql);
	$stmt->bindParam(':productId',$_POST['product_id'], PDO::PARAM_INT);   
	$stmt->execute();	
	
	$conn=null;





?>