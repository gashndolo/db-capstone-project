PREPARE GetOrderDetail FROM
'SELECT OrderID, Quantity, TotalCost
FROM orders
WHERE CustomerID = ?';

SET @CustomerID = 1;
EXECUTE GetOrderDetail USING @CustomerID;