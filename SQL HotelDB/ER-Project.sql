DROP TABLE IF EXISTS Room;
CREATE TABLE `Room` (
  `Room_ID`  char(5) NOT NULL UNIQUE,
  `RoomType_Name`  varchar(40) NOT NULL ,
  `Available`  char(1) NOT NULL DEFAULT 'Y',
  `Telephone_No`  varchar(255) DEFAULT NULL,
   PRIMARY KEY (`Room_ID`)  
);

DROP TABLE IF EXISTS RoomType;

CREATE TABLE `RoomType` (
  `RoomType_Name`  varchar(40) NOT NULL UNIQUE,
  `Price`  float(24) NOT NULL,
  `Limit_Guest`  int NOT NULL,
  `Description`  longtext NOT NULL,
  `Service`	longtext NOT NULL, 
  `SpecialService`	longtext DEFAULT NULL,
   PRIMARY KEY (`RoomType_Name`)  
);

DROP TABLE IF EXISTS Booking;

CREATE TABLE `Booking` (
  `Booking_ID`  char(14) NOT NULL UNIQUE,
  `User_ID`  varchar(16) NOT NULL,
  `Checkin`  date NOT NULL,
  `Checkout`  date NOT NULL,
  `Book_Date`  date NOT NULL,
  `Number_Of_Guest`  int NOT NULL DEFAULT 1,
  `Status`  varchar(15) NOT NULL DEFAULT 'Booking',
   PRIMARY KEY (`Booking_ID`)
);

DROP TABLE IF EXISTS Booking_Detail;

CREATE TABLE `Booking_Detail` (
  `Booking_ID`  char(14) NOT NULL ,
  `RoomType_Name`  varchar(40) NOT NULL,
  `Number_of_Room`  int NOT NULL DEFAULT 1,
   PRIMARY KEY (`Booking_ID`, `RoomType_Name`)
);

DROP TABLE IF EXISTS Booked_History;

CREATE TABLE `Booked_History` (
  `No`  bigint(255) AUTO_INCREMENT,
  `Guest_ID`  bigint(255) NOT NULL,
  `Room_ID`  char(5) NOT NULL,
  `Booking_ID`  char(14) NOT NULL,
   PRIMARY KEY (`No`)
);

DROP TABLE IF EXISTS Customer;

CREATE TABLE `Customer` (
  `User_ID`  varchar(16) NOT NULL UNIQUE,
  `Password`  varchar(30) NOT NULL,
  `Name_Title`  varchar(8) NOT NULL,
  `Customer_FirstName`  varchar(50) NOT NULL,
  `Customer_LastName`  varchar(50) NOT NULL,
  `DoB`	date	NOT NULL,
  `Tel_No`  varchar(16) NOT NULL,
  `Email`  varchar(50) NOT NULL,
  `Customer_Country`  varchar(100) NOT NULL,
   PRIMARY KEY (`User_ID`)
);

DROP TABLE IF EXISTS Staff;

CREATE TABLE `Staff` (
  `Staff_ID`  varchar(7) NOT NULL UNIQUE,
  `Password`  varchar(30) NOT NULL,
  `Name_Title`  varchar(8) NOT NULL,
  `Staff_FirstName`  varchar(50) NOT NULL,
  `Staff_LastName`  varchar(50) NOT NULL,
  `Position`  varchar(50) NOT NULL,
  `Date_Of_Birth`  date NOT NULL,
  `Tel_No`  varchar(16) NOT NULL,
  `Email`  varchar(50) NOT NULL,
  `Start_Date`  date NOT NULL,
  `End_Date`  date DEFAULT NULL,
  `Salary`  int NOT NULL,
  `Address`  tinytext NOT NULL,
   PRIMARY KEY (`Staff_ID`)
);

DROP TABLE IF EXISTS History_Account;

CREATE TABLE `History_Account` (
  `No`  bigint(255) AUTO_INCREMENT NOT NULL,
  `User_ID`  varchar(16) DEFAULT NULL,
  `Staff_ID`  varchar(7) DEFAULT NULL,
  `Password`  varchar(30) DEFAULT NULL,
  `Update_time`  timestamp NOT NULL,
  `Available`  char(1) DEFAULT 'Y',
   PRIMARY KEY (`No`)
);

DROP TABLE IF EXISTS Payment;

CREATE TABLE `Payment` (
  `No`  bigint(255) AUTO_INCREMENT NOT NULL,
  `Method`  varchar(15) NOT NULL DEFAULT 'Online',
  `Booking_ID`  char(14) NOT NULL,
  `Code_ID`  varchar(15) DEFAULT NULL,
  `Total` double NOT NULL DEFAULT 0,
  `Date`  timestamp NOT NULL,
   PRIMARY KEY (`No`)
);

DROP TABLE IF EXISTS CodePromo;

CREATE TABLE `CodePromo` (
  `Code_ID`  varchar(15) NOT NULL UNIQUE,
  `Code_Name`  varchar(50) NOT NULL,
  `StartDate`  datetime NOT NULL,
  `ExpireDate`  datetime DEFAULT NULL,
  `Discount`  float(24) NOT NULL,
  `Limit`  int NOT NULL,
   PRIMARY KEY (`Code_ID`)
);

DROP TABLE IF EXISTS Guest;

CREATE TABLE `Guest` (
  `Guest_ID`  bigint(255) AUTO_INCREMENT NOT NULL,
  `Name_Title`  varchar(8) NOT NULL,
  `Guest_FirstName`  varchar(50) NOT NULL,
  `Guest_LastName`  varchar(50) NOT NULL,
  `Guest_Country`  varchar(100) NOT NULL,
  `Tel_No`  varchar(16) DEFAULT NULL,
   PRIMARY KEY (`Guest_ID`)
);

DROP TABLE IF EXISTS Season;

CREATE TABLE `Season` (
  `Season_Name`  varchar(50) NOT NULL,
  `Start_Date`  datetime NOT NULL,
  `End_Date`  datetime NOT NULL,
   PRIMARY KEY (`Season_Name`)
);

DROP TABLE IF EXISTS Today_Price;

CREATE TABLE `Today_Price` (
  `Season_Name`  varchar(50) NOT NULL,
  `RoomType_Name`  varchar(40) NOT NULL,
  `Discount`  float(24) NOT NULL,
  PRIMARY KEY (`Season_Name`, `RoomType_Name`)
);

DROP TABLE IF EXISTS Review;

CREATE TABLE `Review` (
  `No`  bigint(255) AUTO_INCREMENT,
  `Booking_ID`  char(14) NOT NULL,
  `RoomType_Name`  varchar(40) NOT NULL,
  `User_ID` varchar(16) NOT NULL,
  `Comment`  longtext DEFAULT NULL,
  `Rate` int DEFAULT NULL,
   PRIMARY KEY (`No`)
);

ALTER TABLE `Room` ADD FOREIGN KEY (`RoomType_Name`) REFERENCES `RoomType` (`RoomType_Name`);

ALTER TABLE `History_Account` ADD FOREIGN KEY (`User_ID`) REFERENCES `Customer` (`User_ID`);

ALTER TABLE `History_Account` ADD FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`);

ALTER TABLE `Booking` ADD FOREIGN KEY (`User_ID`) REFERENCES `Customer` (`User_ID`);

ALTER TABLE `Payment` ADD FOREIGN KEY (`Code_ID`) REFERENCES `CodePromo` (`Code_ID`);

ALTER TABLE `Today_Price` ADD FOREIGN KEY (`RoomType_Name`) REFERENCES `RoomType` (`RoomType_Name`);

ALTER TABLE `Today_Price` ADD FOREIGN KEY (`Season_Name`) REFERENCES `Season` (`Season_Name`);

ALTER TABLE `Review` ADD FOREIGN KEY (`Booking_ID`) REFERENCES `Booking` (`Booking_ID`); 

ALTER TABLE `Review` ADD FOREIGN KEY (`RoomType_Name`) REFERENCES `Booking_Detail` (`RoomType_Name`); 

ALTER TABLE `Booked_History` ADD FOREIGN KEY (`Booking_ID`) REFERENCES `Booking` (`Booking_ID`);

ALTER TABLE `Booked_History` ADD FOREIGN KEY (`Room_ID`) REFERENCES `Room` (`Room_ID`);

ALTER TABLE `Booked_History` ADD FOREIGN KEY (`Guest_ID`) REFERENCES `Guest` (`Guest_ID`);

ALTER TABLE `Payment` ADD FOREIGN KEY (`Booking_ID`) REFERENCES `Booking` (`Booking_ID`);

ALTER TABLE `Booking_Detail` ADD FOREIGN KEY (`Booking_ID`) REFERENCES `Booking` (`Booking_ID`);

ALTER TABLE `Booking_Detail` ADD FOREIGN KEY (`RoomType_Name`) REFERENCES `RoomType` (`RoomType_Name`);

ALTER TABLE `Review` ADD FOREIGN KEY (`User_ID`) REFERENCES `Customer` (`User_ID`);


