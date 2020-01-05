<?php
	require_once('connection.php');
	// get a single product with category and company;
	$getId = $_GET['id'];
	$stm = $conn->query("SELECT p.*,c.title FROM products p LEFT JOIN categories c ON p.cat_id = c.id WHERE p.id = $getId");
	$rows = $stm->fetchAll(PDO::FETCH_ASSOC);

	$stm2 = $conn->query("SELECT * FROM categories");
	$rows2 = $stm2->fetchAll(PDO::FETCH_ASSOC);

	$stm3 = $conn->query("SELECT * FROM company");
	$rows3 = $stm3->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode(['singleProduct'=>$rows,'cats'=>$rows2,'getCompany'=>$rows3]);

	$conn=null;

?>