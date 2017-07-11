-- Setting Up Schema
DROP SCHEMA IF EXISTS `decodemtl_addressbook_workshop3` ;

CREATE SCHEMA IF NOT EXISTS `decodemtl_addressbook_workshop3` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

-- Use the newly created database
USE `decodemtl_addressbook_workshop3` ;

-- Drop Existing Tables
DROP TABLE IF EXISTS `decodemtl_addressbook_workshop3`.`Account` ;
DROP TABLE IF EXISTS `decodemtl_addressbook_workshop3`.`AddressBook` ;
DROP TABLE IF EXISTS `decodemtl_addressbook_workshop3`.`Entry`;
DROP TABLE IF EXISTS `decodemtl_addressbook_workshop3`.`Phone`;
DROP TABLE IF EXISTS `decodemtl_addressbook_workshop3`.`Address`;
DROP TABLE IF EXISTS `decodemtl_addressbook_workshop3`.`ElectronicMail`;

-- Creating Tables
CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_workshop3`.`Account` (
    `id` INT AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(40) NOT NULL,
    `createdOn` DATETIME NOT NULL,
    `modifiedOn` DATETIME,
    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_workshop3`.`AddressBook`
(
    `id` INT AUTO_INCREMENT,
    `accountId`INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `createdOn` DATETIME NOT NULL,
    `modifiedOn` DATETIME,
    
    PRIMARY KEY (id),
    FOREIGN KEY (accountId) REFERENCES `decodemtl_addressbook_workshop3`.`Account`(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_workshop3`.`Entry`
(
    `id` INT AUTO_INCREMENT,
    `addressBookId` INT NOT NULL,
    `firstName` VARCHAR(255) NOT NULL,
    `lastName` VARCHAR(255),
    `birthday` DATETIME,
    `type` ENUM ('phone', 'address', 'electronic-mail') NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (addressBookId) REFERENCES `decodemtl_addressbook_workshop3`.`AddressBook` (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_workshop3`.`Phone`
(
    `id` INT AUTO_INCREMENT,
    `entryId` INT NOT NULL,
    `type` ENUM ('home', 'work', 'other') NOT NULL,
    `subtype`ENUM ('landline', 'cellular', 'fax') NOT NULL,
    `content` VARCHAR(255) NULL NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (entryId) REFERENCES `decodemtl_addressbook_workshop3`.`Entry` (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_workshop3`.`Address`
(
    `id` INT AUTO_INCREMENT,
    `entryId` INT NOT NULL,
    `type` ENUM ('home', 'work', 'other') NOT NULL,
    `addressLine1` VARCHAR(255) NOT NULL,
    `addressLine2` VARCHAR(255),
    `city` VARCHAR(255) NOT NULL,
    `province` VARCHAR(128) NOT NULL,
    `country` VARCHAR(128) NOT NULL,
    `postalCode` VARCHAR(10) NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (entryId) REFERENCES `decodemtl_addressbook_workshop3`.`Entry` (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_workshop3`.`ElectronicMail`
(
    `id` INT AUTO_INCREMENT,
    `entryId` INT NOT NULL,
    `type` ENUM ('home', 'work', 'other') NOT NULL,
    `content` VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (entryId) REFERENCES `decodemtl_addressbook_workshop3`.`Entry` (id) ON DELETE CASCADE
);