<?php
	require_once('connection.php');
	$getId = $_GET['id'];
	$stm = $conn->query("SELECT * FROM products WHERE id = $getId");
	$rows = $stm->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($rows);

	$conn=null;

?>