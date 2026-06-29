-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemon3DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemon3DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemon3DB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemon3DB` ;

-- -----------------------------------------------------
-- Table `LittleLemon3DB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon3DB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `Fullname` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `ContractNumber` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon3DB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon3DB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `TableNumber` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customerid_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `customerid_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemon3DB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- TASK 1

USE LittleLemon3DB;

INSERT INTO Customers (CustomerID, Fullname, Email, ContractNumber)
VALUES
(1, 'Emma Johnson', 'emma.johnson@example.com', '5551234567'),
(2, 'Liam Martinez', 'liam.martinez@example.com', '5559876543'),
(3, 'Sophia Brown', 'sophia.brown@example.com', '5552468101'),
(5, 'Noah Williams', 'noah.williams@example.com', '5551357913');

INSERT INTO Bookings (BookingID, TableNumber, BookingDate, CustomerID)
VALUES
(1, 1, '2022-10-10', 5),
(2, 2, '2022-11-12', 3),
(3, 3, '2022-10-11', 2),
(4, 2, '2022-10-13', 1);




-- TASK 2

DROP procedure IF EXISTS `CheckBooking`;

DELIMITER $$
USE `LittleLemon3DB`$$
CREATE PROCEDURE `CheckBooking` (IN bookingdate DATE, IN tablenumber INT)
BEGIN
	IF EXISTS (
    SELECT 1
    FROM Bookings
    WHERE Bookingdate = bookingdate
		and TableNumber = tablenumber
        ) THEN 
			SELECT CONCAT("TABLE ", tablenumber, " is already booked") AS ;
	ELSE
		SELECT CONCAT("TABLE ", tablenumber, " is not booked") AS Result;
	END IF;
END$$

DELIMITER ;

call LittleLemon3DB.CheckBooking('2022-10-10', 1);




-- TASK 3

DROP procedure IF EXISTS `AddValidBooking`;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddValidBooking`(
    IN in_bookingdate DATE, 
    IN in_tablenumber INT,
    IN in_customerID INT
)
BEGIN
    START TRANSACTION;

    IF EXISTS (
        SELECT 1
        FROM Bookings
        WHERE BookingDate = in_bookingdate 
          AND TableNumber = in_tablenumber 
    ) THEN

        ROLLBACK;
SELECT 
    CONCAT('Table ',
            in_tablenumber,
            ' is already booked - booking cancelled') AS 'Booking status';

    ELSE

        INSERT INTO Bookings (TableNumber, BookingDate, CustomerID)
        VALUES (in_tablenumber, in_bookingdate, in_customerID);

        COMMIT;
SELECT 
    CONCAT('Table ',
            in_tablenumber,
            ' successfully booked - booking created') AS 'Booking status';

    END IF;

END//

CALL AddValidBooking('2023-01-02', 10, 2);







DROP procedure IF EXISTS `AddBooking`;

USE `LittleLemon3DB`;
DROP procedure IF EXISTS `LittleLemon3DB`.`AddBooking`;
;

DELIMITER $$
USE `LittleLemon3DB`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(IN in_bookingid INT, IN in_customerid INT, IN in_tablenumber INT, IN in_bookingdate DATE)
BEGIN
	INSERT INTO Bookings  (BookingID, TableNumber, BookingDate, CustomerID)
    VALUES (in_bookingid, in_tablenumber, in_bookingdate, in_customerid);
    
    SELECT "Confirmation" 
           AS 'New booking added';
	
END$$

DELIMITER ;
;

call LittleLemon3DB.AddBooking(9, 3, 4, "2022-12-30");



DELIMITER $$
USE `LittleLemon3DB`$$
CREATE PROCEDURE `UpdateBooking` (IN in_bookingid INT, IN in_bookingdate DATE)
BEGIN
	UPDATE Bookings
    SET BookingDate = in_bookingdate
    WHERE BookingID = in_bookingid;
    
SELECT CONCAT('Booking ', in_bookingid, ' updated') AS 'Confirmation';
END$$

DELIMITER ;


call LittleLemon3DB.UpdateBooking(9, "2022-12-17");




DROP procedure IF EXISTS `CancelBooking`;

DELIMITER $$
USE `LittleLemon3DB`$$
CREATE  PROCEDURE `CancelBooking`(IN in_bookingid INT)
BEGIN
	DELETE FROM Bookings
    WHERE BookingID = in_bookingid;
    
    
    SELECT CONCAT('Booking ', in_bookingid, ' cancelled') AS 'Confirmation';
END$$

DELIMITER;


call LittleLemon3DB.CancelBooking(1);

