<?php
	require_once('connection.php');

	$stm = $conn->query("SELECT products.*, title, company_name FROM products LEFT JOIN categories ON categories.id = products.cat_id LEFT JOIN company ON products.company = company.id WHERE products.qty = 0");

	$rows = $stm->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($rows);
	$conn=null;
?>