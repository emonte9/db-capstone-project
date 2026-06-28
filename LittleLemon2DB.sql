-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemon2DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemon2DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemon2DB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemon2DB` ;

-- -----------------------------------------------------
-- Table `LittleLemon2DB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon2DB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(14) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon2DB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon2DB`.`MenuItems` (
  `MenuItemsID` INT NOT NULL,
  `CourseName` VARCHAR(255) NOT NULL,
  `StarterName` VARCHAR(255) NOT NULL,
  `DessertName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon2DB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon2DB`.`Menus` (
  `MenuID` INT NOT NULL,
  `MenuItemsID` INT NOT NULL,
  `MenuName` VARCHAR(255) NOT NULL,
  `Cuisine` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menuitem_fk_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `menuitem_fk`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `LittleLemon2DB`.`MenuItems` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon2DB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon2DB`.`Orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `customerid_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `menuid_fk_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `customerid_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemon2DB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `menuid_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemon2DB`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
