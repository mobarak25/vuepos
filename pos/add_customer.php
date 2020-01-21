<?php
	require_once('connection.php');
	$name    = $_POST['name'];
	$address    = $_POST['address'];
	$phone    = $_POST['phone'];
  $email = $_POST['email'];
  
  if($name && $address && $phone && $email){
    $conn->exec("INSERT INTO customer (name,address,phone,email) VALUES ('".$name."','".$address."','".$phone."','".$email."')");
    $conn=null;	
  }
	
	
?>