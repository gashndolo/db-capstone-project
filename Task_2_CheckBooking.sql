DELIMITER //

CREATE PROCEDURE CheckBooking(IN p_Date DATE, IN p_TableNumber INT)
BEGIN
    IF EXISTS (
        SELECT 1 FROM bookings
        WHERE Date = p_Date AND TableNumber = p_TableNumber
    ) THEN
        SELECT CONCAT('Table ', p_TableNumber, ' is already booked') AS BookingStatus;
    ELSE
        SELECT CONCAT('Table ', p_TableNumber, ' is available') AS BookingStatus;
    END IF;
END //

DELIMITER ;

/** CALL CheckBooking('2022-11-12', 3); **/