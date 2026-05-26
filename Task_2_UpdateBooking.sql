DELIMITER //

CREATE PROCEDURE UpdateBooking(IN p_BookingID INT, IN p_BookingDate DATE)
BEGIN
    UPDATE bookings
    SET Date = p_BookingDate
    WHERE BookingID = p_BookingID;

    SELECT CONCAT('Booking ', p_BookingID, ' has been updated to ', p_BookingDate) AS Confirmation;
END //

DELIMITER ;

/**CALL UpdateBooking(3, '2025-06-20');**/