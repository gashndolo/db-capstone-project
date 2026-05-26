CREATE VIEW CustomerOrdersView AS
SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    o.OrderID,
    o.TotalCost,
    mn.Name AS MenuName,
    mi.CourseName
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
JOIN menuitems mi ON o.MenuItemID = mi.MenuItemID
JOIN menus mn ON mi.MenuID = mn.MenuID
WHERE o.TotalCost > 1000;

/** SELECT * FROM CustomerOrdersView; **/