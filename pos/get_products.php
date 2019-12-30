<?php
	require_once('connection.php');


	
	$stm = $conn->query("SELECT p.*,c.title FROM products p LEFT JOIN categories c ON p.cat_id = c.id;");
	$rows = $stm->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($rows);

	$conn=null;
?>