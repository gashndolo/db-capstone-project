DELIMITER //

CREATE PROCEDURE CancelBooking(IN p_BookingID INT)
BEGIN
    DELETE FROM bookings
    WHERE BookingID = p_BookingID;

    SELECT CONCAT('Booking ', p_BookingID, ' has been cancelled') AS Confirmation;
END //

DELIMITER ;


/**CALL CancelBooking(3);**/