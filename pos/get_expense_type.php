<?php
	require_once('connection.php');


	$stm = $conn->query("SELECT * FROM expense_type");
	$rows = $stm->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($rows);

	$conn=null;

?>