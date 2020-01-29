<?php
	require_once('connection.php');
	$id = $_POST['id'];

// 	SELECT Customers.CustomerName, Orders.OrderID
// FROM Customers
// LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
// ORDER BY Customers.CustomerName;

	$stm = $conn->query("SELECT products.*,product_name.product_name, company.company_name FROM products LEFT JOIN company ON company.id = products.company LEFT JOIN product_name ON products.product_name = product_name.id WHERE products.id = $id");
	$rows = $stm->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($rows);

	$conn=null;

?>