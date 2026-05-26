DELIMITER //

CREATE PROCEDURE CancelOrder(IN p_OrderID INT)
BEGIN
    DELETE FROM orders
    WHERE OrderID = p_OrderID;
    
    SELECT CONCAT('Order ', p_OrderID, ' is cancelled') AS Confirmation;
END //

DELIMITER ;

/*CALL CancelOrder(3);*/