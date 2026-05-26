DELIMITER //

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN p_Date DATE, IN p_TableNumber INT, IN p_CustomerID INT)
BEGIN
    DECLARE v_BookingCount INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO v_BookingCount
    FROM bookings
    WHERE Date = p_Date AND TableNumber = p_TableNumber;

    IF v_BookingCount > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Booking cancelled - Table ', p_TableNumber, ' is already booked on ', p_Date) AS BookingStatus;
    ELSE
        INSERT INTO bookings (Date, TableNumber, CustomerID)
        VALUES (p_Date, p_TableNumber, p_CustomerID);
        COMMIT;
        SELECT CONCAT('Booking confirmed - Table ', p_TableNumber, ' is available on ', p_Date) AS BookingStatus;
    END IF;
END //

DELIMITER ;

/*CALL AddValidBooking('2022-12-17", 6)*/