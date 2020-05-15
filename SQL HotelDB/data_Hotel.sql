/********************************* ROOMTYPE DATA ****************************************************/

INSERT INTO `RoomType`(`RoomType_Name`, `Price`, `Limit_Guest`, `Description`, `Service`) VALUES ('DELUXE URBAN TWIN BED',4494,4,
'Complete with sweeping cityscape views, enjoy a quiet and comfortable escape high above the hustle and bustle of the city. Stocked with all the luxury accommodations needed for an unforgettable retreat such as lavish furniture, gentle down bedding, inventive decorations and state of the art bathroom fixtures, this room calls to guests who want to get away in style'
,'| Wifi | Tourist Information / Ticket sale | Laundry / Dry Cleaner | Air conditioning | Gym | Spa | Sauna | Baby cots | Free Parking/Outdoor parking |');

INSERT INTO `RoomType`(`RoomType_Name`, `Price`, `Limit_Guest`, `Description`, `Service`) VALUES ('DELUXE URBAN KING BED',4494,4,
'Complete with sweeping cityscape views enjoy a quiet and comfortable escape high above the hustle and bustle of the city. Stocked with all the luxury accommodations needed for an unforgettable retreat such as lavish furniture, gentle down bedding, inventive decorations and state of the art bathroom fixtures, this room calls to guests who want to get away in style'
,'| Wifi | Tourist Information / Ticket sale | Laundry / Dry Cleaner | Air conditioning | Gym | Spa | Sauna | Baby cots | Free Parking/Outdoor parking |');

INSERT INTO `RoomType`(`RoomType_Name`, `Price`, `Limit_Guest`, `Description`, `Service`) VALUES ('DELUXE EXECUTIVE TWIN BED',4957,4,
'All Deluxe Executive Twin Bed Rooms are equipped with gorgeous views of the bay and her golden coastline. Fitted with enough class and esteem, each room is a companion to comfortability and intimacy'
,'| Wifi | Tourist Information / Ticket sale | Laundry / Dry Cleaner | Air conditioning | Gym | Spa | Sauna | Baby cots | Free Parking/Outdoor parking |');

INSERT INTO `RoomType`(`RoomType_Name`, `Price`, `Limit_Guest`, `Description`, `Service`) VALUES ('DELUXE EXECUTIVE KING BED',4957,4,
'All Deluxe Executive King Bed Rooms are equipped with gorgeous views of the bay and her golden coastline. Fitted with enough class and esteem, each room is a companion to comfortability and intimacy. Upscale room design with a perfect amount of space is trivial features compared to the handsome furnishings and fixtures adorning this charming space'
,'| Wifi | Tourist Information / Ticket sale | Laundry / Dry Cleaner | Air conditioning | Gym | Spa | Sauna | Baby cots | Free Parking/Outdoor parking |');

INSERT INTO `RoomType`(`RoomType_Name`, `Price`, `Limit_Guest`, `Description`, `Service`, `SpecialService`) VALUES ('PREMIER LUX TWIN BED',7472,4,
'Boasting bathtubs of marble and balconies with remarkable views the Premier Lux Twin BedRoom are beaming with glitz and glamour. Overlooking tantalizing sea views hundreds of feet into the sky, each room is embellished with playful floorplans and artistic decor. Escape into a world of plush sophistication and modern design, readily equipped to provide irreplaceable and everlasting memories.'
,'| Wifi | Tourist Information / Ticket sale | Laundry / Dry Cleaner | Air conditioning | Gym | Spa | Sauna | Baby cots | Free Parking/Outdoor parking |'
,'> Concierge service <, >Breakfast<, >Afternoon tea<, >All day refreshments: coffee, tea, soft drinks, cookies and snacks<');

INSERT INTO `RoomType`(`RoomType_Name`, `Price`, `Limit_Guest`, `Description`, `Service`, `SpecialService`) VALUES ('PREMIER LUX KING BED',7472,4,
'Boasting bathtubs of marble and balconies with remarkable views the Premier Lux King Bed. Room are beaming with glitz and glamour. Overlooking tantalizing sea views hundreds of feet into the sky, each room is embellished with playful floorplans and artistic decor. Escape into a world of plush sophistication and modern design, readily equipped to provide irreplaceable and everlasting memories.'
,'| Wifi | Tourist Information / Ticket sale | Laundry / Dry Cleaner | Air conditioning | Gym | Spa | Sauna | Baby cots | Free Parking/Outdoor parking |'
,'> Concierge service <, >Breakfast<, >Afternoon tea<, >All day refreshments: coffee, tea, soft drinks, cookies and snacks<');

INSERT INTO `RoomType`(`RoomType_Name`, `Price`, `Limit_Guest`, `Description`, `Service`, `SpecialService`) VALUES ('OCEAN JUNIOR SUITE',8765,4,
'Generous spaces, and equally generous views of the sea adorn these opulently furnished suites. Picture perfect rooms, outfitted to inspire all those who enter, the Ocean Junior Suite will have guests wishing they never had to leave. Beautifully devised and impeccably designed, every inch is a testament to refinement in the art of hospitality.'
,'| Wifi | Tourist Information / Ticket sale | Laundry / Dry Cleaner | Air conditioning | Gym | Spa | Sauna | Baby cots | Free Parking/Outdoor parking |'
,'> Concierge service <, >Breakfast<, >Afternoon tea<, >All day refreshments: coffee, tea, soft drinks, cookies and snacks<');

INSERT INTO `RoomType`(`RoomType_Name`, `Price`, `Limit_Guest`, `Description`, `Service`, `SpecialService`) VALUES ('MARINA SUITE',15806,4,
'How can you describe a sight which takes your breath away...Masterfully conceived, this stately and palatial room is the pinnacle of luxury and class. Crowning the highest floor of Mytt Beach, this supreme suite in the sky offers commanding and unmatched views of the bay and all of Pattaya and beyond. Everything that defines 5 star accommodation. This suite is a reflection of the ambition in class and grace Mytt Beach stands for.'
,'| Wifi | Tourist Information / Ticket sale | Laundry / Dry Cleaner | Air conditioning | Gym | Spa | Sauna | Baby cots | Free Parking/Outdoor parking |'
,'> Concierge service <, >Breakfast<, >Afternoon tea<, >All day refreshments: coffee, tea, soft drinks, cookies and snacks<');

/********************************* ROOM ****************************************************/

INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0301','DELUXE URBAN TWIN BED','Y','*0301');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0302','DELUXE URBAN TWIN BED','Y','*0302');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0303','DELUXE URBAN TWIN BED','Y','*0303');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0304','DELUXE URBAN TWIN BED','Y','*0304');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0305','DELUXE URBAN TWIN BED','Y','*0305');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0306','DELUXE URBAN TWIN BED','Y','*0306');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0307','DELUXE URBAN KING BED','Y','*0307');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0308','DELUXE URBAN KING BED','Y','*0308');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0309','DELUXE URBAN KING BED','Y','*0309');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0310','DELUXE URBAN KING BED','Y','*0310');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0311','DELUXE URBAN KING BED','Y','*0311');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0312','DELUXE URBAN KING BED','Y','*0312');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0401','DELUXE URBAN TWIN BED','Y','*0401');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0402','DELUXE URBAN TWIN BED','Y','*0402');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0403','DELUXE URBAN TWIN BED','Y','*0403');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0404','DELUXE URBAN TWIN BED','Y','*0404');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0405','DELUXE URBAN TWIN BED','Y','*0405');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0406','DELUXE URBAN TWIN BED','Y','*0406');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0407','DELUXE URBAN KING BED','Y','*0407');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0408','DELUXE URBAN KING BED','Y','*0408');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0409','DELUXE URBAN KING BED','Y','*0409');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0410','DELUXE URBAN KING BED','Y','*0410');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0411','DELUXE URBAN KING BED','Y','*0411');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0412','DELUXE URBAN KING BED','Y','*0412');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0501','DELUXE EXECUTIVE TWIN BED','Y','*0501');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0502','DELUXE EXECUTIVE TWIN BED','Y','*0502');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0503','DELUXE EXECUTIVE TWIN BED','Y','*0503');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0504','DELUXE EXECUTIVE TWIN BED','Y','*0504');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0505','DELUXE EXECUTIVE TWIN BED','Y','*0505');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0506','DELUXE EXECUTIVE KING BED','Y','*0506');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0507','DELUXE EXECUTIVE KING BED','Y','*0507');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0508','DELUXE EXECUTIVE KING BED','Y','*0508');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0509','DELUXE EXECUTIVE KING BED','Y','*0509');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0510','DELUXE EXECUTIVE KING BED','Y','*0510');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0601','DELUXE EXECUTIVE TWIN BED','Y','*0601');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0602','DELUXE EXECUTIVE TWIN BED','Y','*0602');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0603','DELUXE EXECUTIVE TWIN BED','Y','*0603');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0604','DELUXE EXECUTIVE TWIN BED','Y','*0604');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0605','DELUXE EXECUTIVE TWIN BED','Y','*0605');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0606','DELUXE EXECUTIVE KING BED','Y','*0606');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0607','DELUXE EXECUTIVE KING BED','Y','*0607');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0608','DELUXE EXECUTIVE KING BED','Y','*0608');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0609','DELUXE EXECUTIVE KING BED','Y','*0609');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0610','DELUXE EXECUTIVE KING BED','Y','*0610');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0701','PREMIER LUX TWIN BED','Y','*0701');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0702','PREMIER LUX TWIN BED','Y','*0702');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0703','PREMIER LUX TWIN BED','Y','*0703');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0704','PREMIER LUX TWIN BED','Y','*0704');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0705','PREMIER LUX KING BED','Y','*0705');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0706','PREMIER LUX KING BED','Y','*0706');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0707','PREMIER LUX KING BED','Y','*0707');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0708','PREMIER LUX KING BED','Y','*0708');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0709','OCEAN JUNIOR SUITE','Y','*0709');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0710','OCEAN JUNIOR SUITE','Y','*0710');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0711','OCEAN JUNIOR SUITE','Y','*0711');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0712','MARINA SUITE','Y','*0712');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0713','MARINA SUITE','Y','*0713');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0714','MARINA SUITE','Y','*0714');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0801','PREMIER LUX TWIN BED','Y','*0801');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0802','PREMIER LUX TWIN BED','Y','*0802');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0803','PREMIER LUX TWIN BED','Y','*0803');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0804','PREMIER LUX TWIN BED','Y','*0804');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0805','PREMIER LUX KING BED','Y','*0805');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0806','PREMIER LUX KING BED','Y','*0806');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0807','PREMIER LUX KING BED','Y','*0807');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0808','PREMIER LUX KING BED','Y','*0808');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0809','OCEAN JUNIOR SUITE','Y','*0809');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0810','OCEAN JUNIOR SUITE','Y','*0810');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0811','OCEAN JUNIOR SUITE','Y','*0811');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0812','MARINA SUITE','Y','*0812');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0813','MARINA SUITE','Y','*0813');
INSERT INTO `Room`(`Room_ID`, `RoomType_Name`, `Available`, `Telephone_No`) VALUES ('R0814','MARINA SUITE','Y','*0814');

/********************************* CUSTOMER ****************************************************/
INSERT INTO `Customer`(`User_ID`, `Password`, `Name_Title`, `Customer_FirstName`, `Customer_LastName`, `DoB`, `Tel_No`, `Email`, `Customer_Country`) 
VALUES ('noey_1','12345','Miss','Piyaluk','Tunsirichaiya','1978-05-12','084-091-9905','noeyeenaza@gmail.com','Thailand');
INSERT INTO `Customer`(`User_ID`, `Password`, `Name_Title`, `Customer_FirstName`, `Customer_LastName`, `DoB`, `Tel_No`, `Email`, `Customer_Country`) 
VALUES ('proy_1','2444567','Miss','Suthada','Thummawong','1989-01-22','083-044-2234','proyee@gmail.com','Thailand');
INSERT INTO `Customer`(`User_ID`, `Password`, `Name_Title`, `Customer_FirstName`, `Customer_LastName`, `DoB`, `Tel_No`, `Email`, `Customer_Country`) 
VALUES ('ant_1','GG4345','Miss','Ananya','Pattanapunyapirom','1978-03-22','063-044-5434','antee@gmail.com','Thailand');
INSERT INTO `Customer`(`User_ID`, `Password`, `Name_Title`, `Customer_FirstName`, `Customer_LastName`, `DoB`, `Tel_No`, `Email`, `Customer_Country`) 
VALUES ('korn_1','FF45322','Mr','Warakorn','Inthong','1980-07-04','097-785-2822','kornnee@gmail.com','Thailand');
INSERT INTO `Customer`(`User_ID`, `Password`, `Name_Title`, `Customer_FirstName`, `Customer_LastName`, `DoB`, `Tel_No`, `Email`, `Customer_Country`) 
VALUES ('Harry_2002','BFS5664','Mr','Harry','Odeen','1990-03-03','139-332-7687','Harry_2002@hotmail.com','United States');
INSERT INTO `Customer`(`User_ID`, `Password`, `Name_Title`, `Customer_FirstName`, `Customer_LastName`, `DoB`, `Tel_No`, `Email`, `Customer_Country`) 
VALUES ('OreoK','Oreo2113','Mr','Oreo','Kim','1978-03-24','742-332-1123','Oreo@hotmail.com','Korea');
INSERT INTO `Customer`(`User_ID`, `Password`, `Name_Title`, `Customer_FirstName`, `Customer_LastName`, `DoB`, `Tel_No`, `Email`, `Customer_Country`) 
VALUES ('ThomasM_','ghost5433','Mr','Thomas','Muller','1981-02-15','332-141-3455','Thomas_Mu@hotmail.com','Germany');
INSERT INTO `Customer`(`User_ID`, `Password`, `Name_Title`, `Customer_FirstName`, `Customer_LastName`, `DoB`, `Tel_No`, `Email`, `Customer_Country`) 
VALUES ('Doraemon_34','Dorayaki','Mr','Doraemon','Nobi','1988-10-12','733-113-4533','Aung@hotmail.com','Japan');
INSERT INTO `Customer`(`User_ID`, `Password`, `Name_Title`, `Customer_FirstName`, `Customer_LastName`, `DoB`, `Tel_No`, `Email`, `Customer_Country`) 
VALUES ('daffy_57','dsdsdsdsdsd','Mr','Kasidit','Sang-uthai','1981-03-22','084-332-4211','daffy@gmail.com','Thailand');
INSERT INTO `Customer`(`User_ID`, `Password`, `Name_Title`, `Customer_FirstName`, `Customer_LastName`, `DoB`, `Tel_No`, `Email`, `Customer_Country`) 
VALUES ('Angel_37','123456','Miss','Noey','Smith','1986-09-16','043-455-6633','Snoey@hotmail.com','United States');
INSERT INTO `Customer`(`User_ID`, `Password`, `Name_Title`, `Customer_FirstName`, `Customer_LastName`, `DoB`, `Tel_No`, `Email`, `Customer_Country`) 
VALUES ('Lava455','jj98889','Miss','Koof','Lava','1985-05-30','234-333-4178','Lava455@hotmail.com','Italy');

/********************************* Guest ****************************************************/

INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('1','Miss','Piyaluk','Tunsirichaiya','Thailand','084-091-9905');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('2','Miss','Sasikarn','Angkanakorn','Thailand','084-091-9905');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('3','Mrs','Laliphat','Chaiponchaleum','Thailand','084-091-9905');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('4','Miss','Suthada','Thummawong','Thailand','083-044-2234');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('5','Miss','Ananya','Pattanapunyapirom','Thailand','063-044-5434');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('6','Mr','Warakorn','Inthong','Thailand','097-785-2822');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('7','Mr','Harry','Odeen','United States','139-332-7687');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('8','Mrs','Sara','Odeen','United States','134-332-7237');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('9','Mr','Oreo','Kim','Korea','332-141-3455');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('10','Mr','Thomas','Muller','Germany','332-141-3455');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('11','Mr','Doraemon','Nobi','Japan','733-113-4533');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('12','Mr','Kasidit','Sang-uthai','Thailand','084-332-4211');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('13','Miss','Noey','Smith','United States','043-455-6633');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('14','Mr','Waru','Smith','United States','043-455-6633');
INSERT INTO `Guest`(`Guest_ID`, `Name_Title`, `Guest_FirstName`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
VALUES ('15','Miss','Koof','Lava','Italy','234-333-4178');

/********************************* Staff ****************************************************/

INSERT INTO `Staff`(`Staff_ID`, `Password`, `Name_Title`, `Staff_FirstName`, `Staff_LastName`, `Position`, `Date_Of_Birth`, `Tel_No`, `Email`, `Start_Date`, `End_Date`, `Salary`, `Address`) 
VALUES ('ST_0001', 'Sun0001', 'Mr', 'Sunday', 'December', 'Manager', '1978-03-22', '098-321-0032', 'ST_0001@mail.hotel.com', '2020-01-01', NULL, '100000', '21/3-G Road-Chonburi-20000-Thailand');
INSERT INTO `Staff`(`Staff_ID`, `Password`, `Name_Title`, `Staff_FirstName`, `Staff_LastName`, `Position`, `Date_Of_Birth`, `Tel_No`, `Email`, `Start_Date`, `End_Date`, `Salary`, `Address`) 
VALUES ('ST_0345', 'Wed0345', 'Miss', 'Wednesday', 'April','Account Manager', '1980-04-01', '098-324-0573', 'ST_0345@mail.hotel.com', '2020-01-01', NULL, '47000', '12-F Road-Chonburi-20000-Thailand');
INSERT INTO `Staff`(`Staff_ID`, `Password`, `Name_Title`, `Staff_FirstName`, `Staff_LastName`, `Position`, `Date_Of_Birth`, `Tel_No`, `Email`, `Start_Date`, `End_Date`, `Salary`, `Address`) 
VALUES ('ST_0502', 'Sat0502', 'Miss', 'Saturday', 'June', 'Director of Revenue', '1980-07-12', '092-092-2167', 'ST_0502@mail.hotel.com', '2020-01-01', NULL, '21000', '91/22-H Road-Chonburi-20000-Thailand');
INSERT INTO `Staff`(`Staff_ID`, `Password`, `Name_Title`, `Staff_FirstName`, `Staff_LastName`, `Position`, `Date_Of_Birth`, `Tel_No`, `Email`, `Start_Date`, `End_Date`, `Salary`, `Address`) 
VALUES ('ST_0563', 'Thu0563', 'Mr', 'Thursday', 'July' , 'Adminstrator', '1990-06-12', '092-312-8229', 'ST_0563@mail.hotel.com', '2020-01-01', NULL, '37000', '23/21-K Road-Chonburi-20000-Thailand');
INSERT INTO `Staff`(`Staff_ID`, `Password`, `Name_Title`, `Staff_FirstName`, `Staff_LastName`, `Position`, `Date_Of_Birth`, `Tel_No`, `Email`, `Start_Date`, `End_Date`, `Salary`, `Address`) 
VALUES ('ST_1256', 'Fri1256', 'Mrs', 'Friday', 'August', 'Housekeeping Director', '1978-02-23', '062-334-5923', 'ST_1256@mail.hotel.com', '2020-01-01', NULL, '21000', '302-K Road-Chonburi-20000-Thailand');

/********************************* Season ****************************************************/

INSERT INTO `Season`(`Season_Name`, `Start_Date`, `End_Date`) VALUES ('Summer Doom', '2020-04-01 00:00:00', '2020-05-01 00:00:00');
INSERT INTO `Season`(`Season_Name`, `Start_Date`, `End_Date`) VALUES ('Valentine Lovely', '2020-02-01 00:00:00', '2020-02-21 00:00:00');
INSERT INTO `Season`(`Season_Name`, `Start_Date`, `End_Date`) VALUES ('Winter Special', '2020-12-01 00:00:00', '2021-02-28 00:00:00');
INSERT INTO `Season`(`Season_Name`, `Start_Date`, `End_Date`) VALUES ('HAPPY TIME', '2020-01-01 00:00:00', '2021-12-31 00:00:00');

/********************************* Booking ****************************************************/
INSERT INTO `Booking`(`Booking_ID`, `User_ID`, `Checkin`, `Checkout`, `Book_Date`, `Number_Of_Guest`, `Status`) VALUES ('BK800020030294', 'ant_1', '2020-03-23', '2020-03-25', '2020-03-23', '1', 'Cancel');
INSERT INTO `Booking`(`Booking_ID`, `User_ID`, `Checkin`, `Checkout`, `Book_Date`, `Number_Of_Guest`, `Status`) VALUES ('BK802398320928', 'korn_1', '2020-04-30', '2020-05-02', '2020-04-12', '1', 'Booking');
INSERT INTO `Booking`(`Booking_ID`, `User_ID`, `Checkin`, `Checkout`, `Book_Date`, `Number_Of_Guest`, `Status`) VALUES ('BK509324856172', 'ThomasM_', '2020-04-30', '2020-05-03', '2020-04-14', '2', 'Paid');
INSERT INTO `Booking`(`Booking_ID`, `User_ID`, `Checkin`, `Checkout`, `Book_Date`, `Number_Of_Guest`, `Status`) VALUES ('BK112000213234', 'noey_1', '2020-01-21', '2020-01-24', '2020-01-10', '3', 'CheckOut');
INSERT INTO `Booking`(`Booking_ID`, `User_ID`, `Checkin`, `Checkout`, `Book_Date`, `Number_Of_Guest`, `Status`) VALUES ('BK372349328402', 'Harry_2002', '2020-03-02', '2020-03-06', '2020-02-28', '3', 'CheckOut');
INSERT INTO `Booking`(`Booking_ID`, `User_ID`, `Checkin`, `Checkout`, `Book_Date`, `Number_Of_Guest`, `Status`) VALUES ('BK483729475212', 'OreoK', '2020-04-20', '2020-04-23', '2020-04-02', '2', 'CheckIn');
INSERT INTO `Booking`(`Booking_ID`, `User_ID`, `Checkin`, `Checkout`, `Book_Date`, `Number_Of_Guest`, `Status`) VALUES ('BK297283091842', 'proy_1', '2020-02-03', '2020-02-07', '2020-01-28', '1', 'CheckOut');

/********************************* CodePromo ****************************************************/
INSERT INTO `Codepromo`(`Code_ID`, `Code_Name`, `StartDate`, `ExpireDate`, `Discount`, `Limit`) VALUES ('C3425', 'Aniversary 1 month', '2020-02-01', '2020-03-01', '10', '300');
INSERT INTO `Codepromo`(`Code_ID`, `Code_Name`, `StartDate`, `ExpireDate`, `Discount`, `Limit`) VALUES ('FGS65D', 'Thank True', '2020-01-01', '2020-12-31', '15', '1');
INSERT INTO `CodePromo`(`Code_ID`, `Code_Name`, `StartDate`, `ExpireDate`, `Discount`, `Limit`) VALUES ('FGX66D', 'Thank True', '2020-01-01', '2020-12-31', '15', '1');
INSERT INTO `CodePromo`(`Code_ID`, `Code_Name`, `StartDate`, `ExpireDate`, `Discount`, `Limit`) VALUES ('FGJ67D', 'Thank True', '2020-01-01', '2020-12-31', '15', '1');
INSERT INTO `CodePromo`(`Code_ID`, `Code_Name`, `StartDate`, `ExpireDate`, `Discount`, `Limit`) VALUES ('FGK68D', 'Thank True', '2020-01-01', '2020-12-31', '15', '1');
INSERT INTO `CodePromo`(`Code_ID`, `Code_Name`, `StartDate`, `ExpireDate`, `Discount`, `Limit`) VALUES ('FGL69D', 'Thank True', '2020-01-01', '2020-12-31', '15', '1');
INSERT INTO `CodePromo`(`Code_ID`, `Code_Name`, `StartDate`, `ExpireDate`, `Discount`, `Limit`) VALUES ('FGS75D', 'Thank True', '2020-01-01', '2020-12-31', '15', '1');
INSERT INTO `CodePromo`(`Code_ID`, `Code_Name`, `StartDate`, `ExpireDate`, `Discount`, `Limit`) VALUES ('FGX76D', 'Thank True', '2020-01-01', '2020-12-31', '15', '1');
INSERT INTO `CodePromo`(`Code_ID`, `Code_Name`, `StartDate`, `ExpireDate`, `Discount`, `Limit`) VALUES ('FGK77D', 'Thank True', '2020-01-01', '2020-12-31', '15', '1');
INSERT INTO `CodePromo`(`Code_ID`, `Code_Name`, `StartDate`, `ExpireDate`, `Discount`, `Limit`) VALUES ('FGL78D', 'Thank True', '2020-01-01', '2020-12-31', '15', '1');

/********************************* Booking_Detail ****************************************************/
INSERT INTO `Booking_Detail`(`Booking_ID`, `RoomType_Name`, `Number_of_Room`) VALUES ('BK800020030294', 'DELUXE URBAN TWIN BED', '1');
INSERT INTO `Booking_Detail`(`Booking_ID`, `RoomType_Name`, `Number_of_Room`) VALUES ('BK802398320928', 'MARINA SUITE', '1');
INSERT INTO `Booking_Detail`(`Booking_ID`, `RoomType_Name`, `Number_of_Room`) VALUES ('BK509324856172', 'OCEAN JUNIOR SUITE', '1');
INSERT INTO `Booking_Detail`(`Booking_ID`, `RoomType_Name`, `Number_of_Room`) VALUES ('BK112000213234', 'DELUXE EXECUTIVE KING BED', '1');
INSERT INTO `Booking_Detail`(`Booking_ID`, `RoomType_Name`, `Number_of_Room`) VALUES ('BK112000213234', 'OCEAN JUNIOR SUITE', '1');
INSERT INTO `Booking_Detail`(`Booking_ID`, `RoomType_Name`, `Number_of_Room`) VALUES ('BK372349328402', 'DELUXE URBAN KING BED', '1');
INSERT INTO `Booking_Detail`(`Booking_ID`, `RoomType_Name`, `Number_of_Room`) VALUES ('BK483729475212', 'DELUXE EXECUTIVE KING BED', '1');
INSERT INTO `Booking_Detail`(`Booking_ID`, `RoomType_Name`, `Number_of_Room`) VALUES ('BK297283091842', 'PREMIER LUX KING BED', '1');

/********************************* Booking_History ****************************************************/
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('1', '1', 'R0301', 'BK800020030294');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('2', '6', 'R0812', 'BK802398320928');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('3', '10', 'R0709', 'BK509324856172');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('5', '1', 'R0610', 'BK112000213234');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('6', '2', 'R0610', 'BK112000213234');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('7', '3', 'R0710', 'BK112000213234');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('8', '7', 'R0606', 'BK372349328402');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('9', '8', 'R0606', 'BK372349328402');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('10', '9', 'R0506', 'BK483729475212');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('12', '4', 'R0807', 'BK297283091842');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('11', '11', 'R0506', 'BK483729475212');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('4', '15', 'R0709', 'BK509324856172');
INSERT INTO `Booked_History` (`No`, `Guest_ID`, `Room_ID`, `Booking_ID`) VALUES ('13', '12', 'R0606', 'BK372349328402');

/********************************* History_Account ****************************************************/
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('06', 'Angel_37', '123456', '2020-01-02', 'Y');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('07', 'ant_1', 'GG4345', '2020-01-02', 'Y');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('08', 'daffy_57', 'dfdfdfdfdf', '2020-01-03', 'N');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('09', 'Doraemon_34', 'Dorayaki', '2020-01-05', 'Y');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('10', 'Harry_2002', 'BFS5664', '2020-01-10', 'Y');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('11', 'korn_1', 'FF45322', '2020-01-13', 'Y');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('12', 'Lava455', 'jj98889', '2020-01-13', 'Y');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('13', 'noey_1', '12345', '2020-01-20', 'Y');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('18', 'OreoK', 'Oreo2113', '2020-04-20', 'Y');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('14', 'proy_1', '23444113', '2020-01-28', 'N');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('15', 'proy_1', '2444567', '2020-03-20', 'Y');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('17', 'ThomasM_', 'ghost5433', '2020-04-14', 'Y');
INSERT INTO `History_Account` (`No`, `User_ID`, `Password`, `Update_time`, `Available`) VALUES ('16', 'daffy_57', 'dsdsdsdsdsd', '2020-04-03', 'Y');
INSERT INTO `History_Account` (`No`, `Staff_ID`, `Password`, `Update_time`, `Available`) VALUES ('01', 'ST_0001', 'Sun0001', '2020-01-01', 'Y');
INSERT INTO `History_Account` (`No`, `Staff_ID`, `Password`, `Update_time`, `Available`) VALUES ('02', 'ST_0345', 'Wed0345', '2020-01-01', 'Y');
INSERT INTO `History_Account` (`No`, `Staff_ID`, `Password`, `Update_time`, `Available`) VALUES ('03', 'ST_0502', 'Sat0502', '2020-01-01', 'Y');
INSERT INTO `History_Account` (`No`, `Staff_ID`, `Password`, `Update_time`, `Available`) VALUES ('04', 'ST_0563', 'Thu0563', '2020-01-01', 'Y');
INSERT INTO `History_Account` (`No`, `Staff_ID`, `Password`, `Update_time`, `Available`) VALUES ('05', 'ST_1256', 'Fri1256', '2020-01-01', 'Y');

/********************************* Payment ****************************************************/
INSERT INTO `Payment` (`No`, `Method`, `Booking_ID`, `Code_ID`, `Total`, `Date`) VALUES ('1', 'Online', 'BK112000213234', 'FGJ67D', '4220', '2020-01-11');
INSERT INTO `Payment` (`No`, `Method`, `Booking_ID`, `Code_ID`, `Total`, `Date`) VALUES ('2', 'Online', 'BK297283091842', null, '7472', '2020-01-29');
INSERT INTO `Payment` (`No`, `Method`, `Booking_ID`, `Code_ID`, `Total`, `Date`) VALUES ('3', 'Online', 'BK372349328402', 'C3425', '4041', '2020-02-28');
INSERT INTO `Payment` (`No`, `Method`, `Booking_ID`, `Code_ID`, `Total`, `Date`) VALUES ('4', 'Walk-in', 'BK483729475212', null, '4957', '2020-04-02');
INSERT INTO `Payment` (`No`, `Method`, `Booking_ID`, `Code_ID`, `Total`, `Date`) VALUES ('5', 'Online', 'BK509324856172', 'FGK68D', '7450', '2020-04-14');

/********************************* Review ****************************************************/
INSERT INTO `Review` (`No`, `Booking_ID`, `User_ID`, `Comment`, `Rate`) VALUES ('01', 'BK483729475212', 'OreoK', 'Good!\nOur stay at Hahuna was a pleasant one. The staff at reception and breakfast was nice and super helpful. They took time to take care of us by being patient and answering any questions we asked. I would definitely recommend this hotel. Near the Tram and close to good restaurants.', '5');
INSERT INTO `Review` (`No`, `Booking_ID`, `User_ID`, `Comment`, `Rate`) VALUES ('02', 'BK297283091842', 'proy_1', 'ที่พักดี..สะอาดสะดวกสบาย\nที่พักดี บริการน้องพนักงานดี ฟิสเนส สระว่ายน้ำสวยสะอาด น้องๆเป็นกันเองสะดวกสบายจิงๆคร่า ..เดินทางไปไหนก็สะดวก ใกล้ร้านเสริมสวย ร้านนวด เตียงนอนใหญ่หลับสบาย ..ถ้าเลือกได้กลับมาพักที่นี่อีกแน่นอนคร่า', '5');
INSERT INTO `Review` (`No`, `Booking_ID`, `User_ID`, `Comment`, `Rate`) VALUES ('03', 'BK372349328402', 'Harry_2002', '\"Highly recommended hotel\"\nThe hotel is in a great location and it is quiet. It is very clean and has great staff. The breakfast buffet is also very good. Good clean pool.', '4');

/********************************* Today_Price ****************************************************/
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('HAPPY TIME', 'DELUXE EXECUTIVE KING BED', '5');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('HAPPY TIME', 'DELUXE EXECUTIVE TWIN BED', '5');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('HAPPY TIME', 'DELUXE URBAN KING BED', '5');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('HAPPY TIME', 'DELUXE URBAN TWIN BED', '5');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('HAPPY TIME', 'MARINA SUITE', '5');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('HAPPY TIME', 'OCEAN JUNIOR SUITE', '5');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('HAPPY TIME', 'PREMIER LUX KING BED', '5');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('HAPPY TIME', 'PREMIER LUX TWIN BED', '5');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('Summer Doom', 'MARINA SUITE', '10');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('Summer Doom', 'OCEAN JUNIOR SUITE', '10');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('Valentine Lovely', 'PREMIER LUX KING BED', '14');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('Valentine Lovely', 'DELUXE URBAN KING BED', '14');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('Valentine Lovely', 'DELUXE EXECUTIVE KING BED', '14');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('Winter Special', 'PREMIER LUX TWIN BED', '15');
INSERT INTO `Today_Price` (`Season_Name`, `RoomType_Name`, `Discount`) VALUES ('Winter Special', 'PREMIER LUX KING BED', '15');
