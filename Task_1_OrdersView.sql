CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM orders
WHERE Quantity > 2;

/* SELECT * FROM OrdersView; */