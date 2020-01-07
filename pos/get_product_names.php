<?php
  require_once('connection.php');

  if (isset($_POST["title"])) {
    $name = $_POST['title'];
    $conn->exec("INSERT INTO product_name (product_name) VALUES ('".$name."')");    
  }
  if (isset($_POST["id"])) {
    $nameId = $_POST['id'];
    $conn->exec("DELETE FROM product_name WHERE id = $nameId");    
  }

	$stm2 = $conn->query("SELECT * FROM product_name");
	$rows2 = $stm2->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode(['ProName'=>$rows2]);



	$conn=null;
?>