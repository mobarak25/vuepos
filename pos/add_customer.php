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

  $id = $_POST['id'];
  if($id){
    $sql = "DELETE FROM customer WHERE id =  :customerId";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':customerId',$_POST['id'], PDO::PARAM_INT);   
    $stmt->execute();	
    
    $conn=null;
  }
	
	
?>