-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Category` (
  `idCategory` INT NOT NULL,
  `category` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Menu` (
  `idMenu` INT NOT NULL,
  `item_name` VARCHAR(255) NOT NULL,
  `idCategory` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idMenu`),
  INDEX `idCategory_fk_idx` (`idCategory` ASC) VISIBLE,
  CONSTRAINT `idCategory_fk`
    FOREIGN KEY (`idCategory`)
    REFERENCES `LittleLemonDM`.`Category` (`idCategory`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Staff` (
  `idStaff` INT NOT NULL,
  `role` VARCHAR(255) NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idStaff`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Customer` (
  `idCustomer` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `idBookings` INT NOT NULL,
  `date` DATE NOT NULL,
  `tableNumber` INT NOT NULL,
  `idStaff` INT NULL,
  `idCustomer` INT NULL,
  PRIMARY KEY (`idBookings`),
  INDEX `idStaff_fk_idx` (`idStaff` ASC) VISIBLE,
  INDEX `idCustomer_idx` (`idCustomer` ASC) VISIBLE,
  CONSTRAINT `idStaff_fk`
    FOREIGN KEY (`idStaff`)
    REFERENCES `LittleLemonDM`.`Staff` (`idStaff`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `idCustomer`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `LittleLemonDM`.`Customer` (`idCustomer`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `idOrders` INT NOT NULL,
  `orderDate` DATE NOT NULL,
  `totalCost` DECIMAL(10,2) NOT NULL,
  `idBookings` INT NULL,
  `idCustomer` INT NULL,
  `idStaff` INT NULL,
  PRIMARY KEY (`idOrders`),
  INDEX `idBookings_idx` (`idBookings` ASC) VISIBLE,
  INDEX `idCustomer_idx` (`idCustomer` ASC) VISIBLE,
  INDEX `idStaff_idx` (`idStaff` ASC) VISIBLE,
  CONSTRAINT `idBookings`
    FOREIGN KEY (`idBookings`)
    REFERENCES `LittleLemonDM`.`Bookings` (`idBookings`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `idCustomer`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `LittleLemonDM`.`Customer` (`idCustomer`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `idStaff`
    FOREIGN KEY (`idStaff`)
    REFERENCES `LittleLemonDM`.`Staff` (`idStaff`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`OrderItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`OrderItem` (
  `idOrderItem` INT NOT NULL,
  `idOrders` INT NULL,
  `idMenu` INT NULL,
  `quantity` INT NOT NULL,
  `discount` DECIMAL(10,2) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idOrderItem`),
  INDEX `idMenu_fk_idx` (`idMenu` ASC) VISIBLE,
  INDEX `idOrders_fk_idx` (`idOrders` ASC) VISIBLE,
  CONSTRAINT `idMenu_fk`
    FOREIGN KEY (`idMenu`)
    REFERENCES `LittleLemonDM`.`Menu` (`idMenu`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `idOrders_fk`
    FOREIGN KEY (`idOrders`)
    REFERENCES `LittleLemonDM`.`Orders` (`idOrders`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Delivery` (
  `idDelivery` INT NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  `deliveryDate` DATE NOT NULL,
  `idOrders` INT NOT NULL,
  PRIMARY KEY (`idDelivery`),
  INDEX `idOrders_fk_idx` (`idOrders` ASC) VISIBLE,
  CONSTRAINT `idOrders_fk`
    FOREIGN KEY (`idOrders`)
    REFERENCES `LittleLemonDM`.`Orders` (`idOrders`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
