<?php
  require_once('connection.php');
  
  $getId = $_GET['id'];

  $catId     = $_POST['catId'];
	$name      = $_POST['name'];
	$descr     = $_POST['descr'];
	$cost      = $_POST['cost'];
	$sell      = $_POST['sell'];
  $qty       = $_POST['qty'];
  $company   = $_POST['company'];

  $sql = "UPDATE `products` SET
  `product_name`=:name,
  `cat_id`= :catId,
  `description`=:descr,
  `qty`=:qty,
  `cost_price`=:cost,
  `selling_price`=:sell,
  `company`=:company WHERE `id`= :id";

$data = [
  'name' => $name,
  'catId' => $catId,
  'descr' => $descr,
  'qty' => $qty,
  'cost' => $cost,
  'sell' => $sell,
  'company' => $company,
  'id' => $getId,
];
  
  $stmt = $conn->prepare($sql);
  $stmt->execute($data);

	$conn=null;

?>