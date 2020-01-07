<?php
	require_once('connection.php');

	$stm = $conn->query("SELECT products.*, title, company_name, product_name.product_name FROM products LEFT JOIN categories ON categories.id = products.cat_id LEFT JOIN company ON company.id = products.company LEFT JOIN product_name ON products.product_name = product_name.id");

	$rows = $stm->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($rows);
	$conn=null;
?>