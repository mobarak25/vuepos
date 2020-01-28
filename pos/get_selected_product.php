<?php
	require_once('connection.php');
	$id = $_POST['id'];
	$stm = $conn->query("SELECT * FROM products WHERE id = $id");
	$rows = $stm->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($rows);

	$conn=null;

?>