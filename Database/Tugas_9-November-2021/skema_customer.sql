-- NOTE:
-- ganti nilai COLLATE dengan utf8mb4_unicode_ci
-- di hasil dump!

START TRANSACTION;

-- FOR CLEAN START
DROP TABLE IF EXISTS `tblCustomerPhoneNumbers`;
DROP TABLE IF EXISTS `tblCustomer`;

DROP TABLE IF EXISTS `tlkAddressType`;
DROP TABLE IF EXISTS `tlkSuffix`;
DROP TABLE IF EXISTS `tlkTitle`;
DROP TABLE IF EXISTS `tlkPhoneNumberType`;
DROP TABLE IF EXISTS `tlkPhoneNumberType_1`;
DROP TABLE IF EXISTS `tlkPhoneNumberType_2`;
DROP TABLE IF EXISTS `tlkPhoneNumberType_3`;
DROP TABLE IF EXISTS `Picture`;

-- TABEL REFERENCE DASAR ------------------------------------------
-- tabel 'tlkAddressType'
CREATE TABLE IF NOT EXISTS `tlkAddressType` (
    `AddressTypeID`		INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `AddressType`       VARCHAR(100) UNIQUE NOT NULL,

    CONSTRAINT `pk_AddressTypeID` PRIMARY KEY (`AddressTypeID`)
);

-- tabel tlkSuffix
CREATE TABLE IF NOT EXISTS `tlkSuffix` (
    `SuffixID`  INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `Suffix`    VARCHAR(100) UNIQUE NOT NULL,

    CONSTRAINT `pk_SuffixID` PRIMARY KEY (`SuffixID`)
);

-- tabel tlkTitle
CREATE TABLE IF NOT EXISTS `tlkTitle` (
    `TitleID`	INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `Title`     VARCHAR(100) UNIQUE NOT NULL,

    CONSTRAINT `pk_TitleID` PRIMARY KEY (`TitleID`)
);

-- tabel tlkPhoneNumberType
CREATE TABLE IF NOT EXISTS `tlkPhoneNumberType` (
    `PhoneNumberTypeID`		INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `PhoneNumberType`       VARCHAR(100) UNIQUE NOT NULL,

    CONSTRAINT `pk_PhoneNumberTypeID` PRIMARY KEY (`PhoneNumberTypeID`)
);

-- tabel tlkPhoneNumberType_1
CREATE TABLE IF NOT EXISTS `tlkPhoneNumberType_1` (
    `PhoneNumberTypeID`		INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `PhoneNumberType`       VARCHAR(100) UNIQUE NOT NULL,

    CONSTRAINT `pk_PhoneNumberTypeID_1` PRIMARY KEY (`PhoneNumberTypeID`)
);

-- tabel tlkPhoneNumberType_2
CREATE TABLE IF NOT EXISTS `tlkPhoneNumberType_2` (
    `PhoneNumberTypeID`		INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `PhoneNumberType`       VARCHAR(100) UNIQUE NOT NULL,

    CONSTRAINT `pk_PhoneNumberTypeID_2` PRIMARY KEY (`PhoneNumberTypeID`)
);

-- tabel tlkPhoneNumberType_3
CREATE TABLE IF NOT EXISTS `tlkPhoneNumberType_3` (
    `PhoneNumberTypeID`		INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `PhoneNumberType`       VARCHAR(100) UNIQUE NOT NULL,

    CONSTRAINT `pk_PhoneNumberTypeID_3` PRIMARY KEY (`PhoneNumberTypeID`)
);

-- tabel Pictures
CREATE TABLE IF NOT EXISTS `Picture` (
    `PictureID`				INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `PictureData`                  LONGBLOB NOT NULL,
    `FileName`              VARCHAR(100) UNIQUE NOT NULL,
    `FileType`              VARCHAR(10) NOT NULL,
    CONSTRAINT `pk_PictureID` PRIMARY KEY (`PictureID`)
);

-- tabel tblCustomer
CREATE TABLE IF NOT EXISTS `tblCustomer` (
    `CustomerID`            INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `TitleID`               INT(3) UNSIGNED NOT NULL,
    `FirstName`             VARCHAR(30) NOT NULL,
    `MiddleName`            VARCHAR(30) NOT NULL,
    `LastName`              VARCHAR(30) NOT NULL,
    `SuffixID`              INT(3) UNSIGNED NOT NULL,

    `CompanyID`             INT(3) UNSIGNED DEFAULT NULL,
    `JobTitle`              VARCHAR(30) DEFAULT NULL,

    `PictureID`             INT(3) UNSIGNED DEFAULT NULL,

    `EmailTypeID`           INT(3) UNSIGNED NOT NULL,
    `Email1`                VARCHAR(100) DEFAULT NULL,
    `Email2`                VARCHAR(100) DEFAULT NULL,
    `Email3`                VARCHAR(100) DEFAULT NULL,
    
    `WebPageAddress`        VARCHAR(100) DEFAULT NULL,
    `IMAddress`             VARCHAR(100) DEFAULT NULL,

    `PhoneNumberTypeID`     INT(3) UNSIGNED NOT NULL,
    `PhoneNumberTypeID1`    INT(3) UNSIGNED DEFAULT NULL,
    `PhoneNumberTypeID2`    INT(3) UNSIGNED DEFAULT NULL,
    `PhoneNumberTypeID3`    INT(3) UNSIGNED DEFAULT NULL,

    `AddressTypeID`         INT(3) UNSIGNED DEFAULT NULL,

    `Notes`                 VARCHAR(100) DEFAULT NULL,

    `TempID`                INT(3) UNSIGNED DEFAULT NULL,
    
    `RatingID`              INT(3) UNSIGNED NOT NULL,

    `SalesPersonID`         INT(3) UNSIGNED DEFAULT NULL,


    CONSTRAINT `pk_CustomerID` PRIMARY KEY (`CustomerID`),
    
    CONSTRAINT `fk_customer_TitleID` FOREIGN KEY (`TitleID`) REFERENCES tlkTitle(`TitleID`),
    CONSTRAINT `fk_customer_SuffixID` FOREIGN KEY (`SuffixID`) REFERENCES tlkSuffix(`SuffixID`),
    
    CONSTRAINT `fk_customer_PictureID` FOREIGN KEY (`PictureID`) REFERENCES Picture(`PictureID`),

    CONSTRAINT `fk_customer_PhoneNumberTypeID` FOREIGN KEY (`PhoneNumberTypeID`) REFERENCES tlkPhoneNumberType(`PhoneNumberTypeID`),
    CONSTRAINT `fk_customer_PhoneNumberTypeID1` FOREIGN KEY (`PhoneNumberTypeID1`) REFERENCES tlkPhoneNumberType_1(`PhoneNumberTypeID`),
    CONSTRAINT `fk_customer_PhoneNumberTypeID2` FOREIGN KEY (`PhoneNumberTypeID2`) REFERENCES tlkPhoneNumberType_2(`PhoneNumberTypeID`),
    CONSTRAINT `fk_customer_PhoneNumberTypeID3` FOREIGN KEY (`PhoneNumberTypeID3`) REFERENCES tlkPhoneNumberType_3(`PhoneNumberTypeID`),
    CONSTRAINT `fk_customer_AddressTypeID` FOREIGN KEY (`AddressTypeID`) REFERENCES tlkAddressType(`AddressTypeID`)
);

CREATE TABLE IF NOT EXISTS `tblCustomerPhoneNumbers` (
    `ContactPhoneNumberID`	INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    `CustomerID`            INT(3) UNSIGNED NOT NULL,
    `PhoneNumberTypeID`     INT(3) UNSIGNED NOT NULL,
    `PhoneNumber`           VARCHAR(12) DEFAULT NULL,
    `Extension`             VARCHAR(5)  DEFAULT NULL,

    CONSTRAINT `pk_ContactPhoneNumberID` PRIMARY KEY (`ContactPhoneNumberID`),

    CONSTRAINT `fk_cust_phone_customer_id` FOREIGN KEY (`CustomerID`) REFERENCES tblCustomer(`CustomerID`),
    CONSTRAINT `fk_cust_phone_type_id` FOREIGN KEY (`PhoneNumberTypeID`) REFERENCES tlkPhoneNumberType(`PhoneNumberTypeID`)
);

COMMIT;
