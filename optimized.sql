-- TASK 1


DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity
    FROM Orders;
END //

DELIMITER ;


CALL GetMaxQuantity();


-- TASK 2

PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;
DEALLOCATE PREPARE GetOrderDetail;




-- TASk 3
DELIMITER //

CREATE PROCEDURE `CancelOrder` (IN order_id INT)
BEGIN
	Delete FROM Orders
    WHERE OrderID = order_id;
END //


DELIMITER;


call LittleLemon2DB.CancelOrder(2);

