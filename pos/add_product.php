<?php

	require_once('connection.php');

	$catId = $_POST['catId'];
	$name  = $_POST['name'];
	$descr = $_POST['descr'];
	$cost  = $_POST['cost'];
	$sell  = $_POST['sell'];
	$qty   = $_POST['qty'];
	$company   = $_POST['company'];



	$conn->exec("INSERT INTO products(product_name,cat_id,description,qty,cost_price,selling_price,company) VALUES ('".$name."','".$catId."','".$descr."','".$qty."','".$cost."','".$sell."','".$company."')");	

	$conn=null;

?>