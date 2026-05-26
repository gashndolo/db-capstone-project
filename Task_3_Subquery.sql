SELECT Name
FROM menus
WHERE MenuID IN (
    SELECT mi.MenuID
    FROM menuitems mi
    JOIN orders o ON mi.MenuItemID = o.MenuItemID
    GROUP BY mi.MenuID
    HAVING COUNT(o.OrderID) > 2
);