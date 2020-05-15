ALTER TABLE `Booking`  
DROP FOREIGN KEY `booking_ibfk_1`;
ALTER TABLE `Booking` 
ADD CONSTRAINT `booking_ibfk_1`
  FOREIGN KEY (`User_ID`)
  REFERENCES `Customer` (`User_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `Booked_History` 
DROP FOREIGN KEY `Booked_History_ibfk_1`,
DROP FOREIGN KEY `Booked_History_ibfk_2`,
DROP FOREIGN KEY `Booked_History_ibfk_3`;
ALTER TABLE `Booked_History` 
ADD CONSTRAINT `Booked_History_ibfk_1`
  FOREIGN KEY (`Booking_ID`)
  REFERENCES `Booking` (`Booking_ID`)
  ON DELETE NO ACTION  
  ON UPDATE CASCADE,
ADD CONSTRAINT `Booked_History_ibfk_2`
  FOREIGN KEY (`Room_ID`)
  REFERENCES `Room` (`Room_ID`)
  ON DELETE NO ACTION  
  ON UPDATE CASCADE,
ADD CONSTRAINT `Booked_History_ibfk_3`
  FOREIGN KEY (`Guest_ID`)
  REFERENCES `Guest` (`Guest_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `Booking_Detail` 
DROP FOREIGN KEY `booking_detail_ibfk_1`,
DROP FOREIGN KEY `booking_detail_ibfk_2`;
ALTER TABLE `Booking_Detail` 
ADD CONSTRAINT `booking_detail_ibfk_1`
  FOREIGN KEY (`Booking_ID`)
  REFERENCES `Booking` (`Booking_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `booking_detail_ibfk_2`
  FOREIGN KEY (`RoomType_Name`)
  REFERENCES `RoomType` (`RoomType_Name`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `History_Account` 
DROP FOREIGN KEY `history_account_ibfk_1`,
DROP FOREIGN KEY `history_account_ibfk_2`;
ALTER TABLE `History_Account` 
ADD CONSTRAINT `history_account_ibfk_1`
  FOREIGN KEY (`User_ID`)
  REFERENCES `Customer` (`User_ID`)
  ON DELETE SET NULL
  ON UPDATE CASCADE,
ADD CONSTRAINT `history_account_ibfk_2`
  FOREIGN KEY (`Staff_ID`)
  REFERENCES `Staff` (`Staff_ID`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;

ALTER TABLE `Payment` 
DROP FOREIGN KEY `payment_ibfk_1`;
ALTER TABLE `Payment` 
ADD CONSTRAINT `payment_ibfk_1`
  FOREIGN KEY (`Code_ID`)
  REFERENCES `CodePromo` (`Code_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `Review` 
DROP FOREIGN KEY `review_ibfk_1`,
DROP FOREIGN KEY `review_ibfk_2`;
ALTER TABLE `Review` 
ADD CONSTRAINT `review_ibfk_1`
  FOREIGN KEY (`Booking_ID`)
  REFERENCES `Booking` (`Booking_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `review_ibfk_2`
  FOREIGN KEY (`User_ID`)
  REFERENCES `Customer` (`User_ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `Room` 
DROP FOREIGN KEY `room_ibfk_1`;
ALTER TABLE `Room` 
ADD CONSTRAINT `room_ibfk_1`
  FOREIGN KEY (`RoomType_Name`)
  REFERENCES `RoomType` (`RoomType_Name`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `Today_Price` 
DROP FOREIGN KEY `today_price_ibfk_1`,
DROP FOREIGN KEY `today_price_ibfk_2`;
ALTER TABLE `Today_Price` 
ADD CONSTRAINT `today_price_ibfk_1`
  FOREIGN KEY (`RoomType_Name`)
  REFERENCES `RoomType` (`RoomType_Name`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `today_price_ibfk_2`
  FOREIGN KEY (`Season_Name`)
  REFERENCES `Season` (`Season_Name`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;