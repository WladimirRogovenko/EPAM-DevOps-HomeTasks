-- SQL script create all tables in current DB. For example CarsSaloon

-- Table CarBrends
CREATE TABLE IF NOT EXISTS CarBrends (
  id INT NOT NULL AUTO_INCREMENT,
  BrendName VARCHAR(30) NOT NULL,
  Vehicle VARCHAR(30) NOT NULL,
  Coments VARCHAR(45) NULL,
  PRIMARY KEY (id));

-- Table Colors
CREATE TABLE IF NOT EXISTS Colors (
  id INT NOT NULL AUTO_INCREMENT,
  ColorName VARCHAR(25) NOT NULL,
  ColorCode VARCHAR(15) NOT NULL,
  PRIMARY KEY (id));

-- Table Store
CREATE TABLE IF NOT EXISTS Store (
  id INT NOT NULL AUTO_INCREMENT,
  YearOfIssue INT NULL,
  ModelYear INT NULL,
  AWD TINYINT(1) NULL,
  Interior VARCHAR(45) NULL,
  ElectroPacket VARCHAR(45) NULL,
  Other VARCHAR(50) NULL,
  CarBrends_id INT NOT NULL,
  Colors_id INT NOT NULL,
  BasePrice DECIMAL(10,2) NULL,
  PRIMARY KEY (id),
  INDEX fk_Store_CarBrends_idx (CarBrends_id ASC) VISIBLE,
  INDEX fk_Store_Colors1_idx (Colors_id ASC) VISIBLE,
  CONSTRAINT fk_Store_CarBrends
    FOREIGN KEY (CarBrends_id)
    REFERENCES CarBrends (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Store_Colors1
    FOREIGN KEY (Colors_id)
    REFERENCES Colors (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- Table Sales
CREATE TABLE IF NOT EXISTS Sales (
  id INT NOT NULL AUTO_INCREMENT,
  ByerName VARCHAR(45) NULL DEFAULT 'Unknown byer',
  OrderDate DATE NULL,
  FinalPrice DECIMAL(10,2) NULL,
  Store_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_Sales_Store1_idx (Store_id ASC) VISIBLE,
  CONSTRAINT fk_Sales_Store1
    FOREIGN KEY (Store_id)
    REFERENCES Store (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);





