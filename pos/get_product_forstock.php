<?php
  require_once('connection.php');
  
	// get a single product with category and company;

	$stm = $conn->query("SELECT * FROM product_name");
	$rows = $stm->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($rows);

	$conn=null;

?>