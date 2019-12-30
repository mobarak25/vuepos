<?php
	require_once('connection.php');


	$stm = $conn->query("SELECT * FROM categories");
	$rows = $stm->fetchAll(PDO::FETCH_ASSOC);

	$stm2 = $conn->query("SELECT * FROM products ORDER BY ID DESC LIMIT 1");
	$rows2 = $stm2->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode(['cat'=>$rows,'last_product'=>$rows2]);



	$conn=null;
?>