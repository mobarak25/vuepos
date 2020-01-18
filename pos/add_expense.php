<?php
	require_once('connection.php');
	$name    = $_POST['name'];
	$cost    = $_POST['cost'];
	$type    = $_POST['type'];
  $expDate = $_POST['expDate'];
  
  if($name && $cost && $type && $expDate){
    $conn->exec("INSERT INTO expense (expense_type,cost,expDate,expDame) VALUES ('".$type."','".$cost."','".$expDate."','".$name."')");
    $conn=null;	
  }
	
	
?>