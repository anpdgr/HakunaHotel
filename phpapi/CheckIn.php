<?php
    #                     read me
    #               + can edit
    #               - can't edit
    #               use $ to assign var don't define datatype

    header('Access-Control-Allow-Origin: *');                              # -
    # import data from contacts.php file    
    require './contacts.php';                                              # -
    # check connecting database
    if ($con->connect_error) {                                             # -
        die("Connection failed: " . $con->connect_error);                  # -
    }
    # when connected to database
    else {
        # echo "Connected successfully<br>";
        # var for result from database in select command
        $result = array();                                                 # -
        # var for knowed this action do which sql command
        $action = '';                                                      # -

        # check superposition var in _GET
        if(isset($_GET['action'])){                                        # -
            $action = $_GET['action'];                                     # -
        }

        if($action == 'read'){
            
            $bookid = $_POST['bookid'];

            $sql = $con->query("SELECT b.*,p.*,c.Name_Title,c.Customer_FirstName,c.Customer_Lastname,c.Tel_No 
                                FROM (Hotel_Management.Booking b JOIN Hotel_Management.Payment p 
                                ON b.Booking_ID = p.Booking_ID) JOIN  Hotel_Management.Customer c 
                                ON c.User_ID = b.User_ID
                                WHERE b.Booking_ID = '$bookid' ");
           
            $books = array();

            while($row = $sql->fetch_assoc()){
                array_push($books,$row);
            }
            $result['data'] = $books;

            if($sql){
                $result['message'] = "read successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "read fail";
            }
        }

        if($action == 'fbookdetail'){
            
            $bookid = $_POST['Booking_ID'];

            $sql = $con->query("SELECT RoomType_Name, Number_of_Room FROM Booking_Detail WHERE Booking_ID = '$bookid' ");
           
            $books = array();

            while($row = $sql->fetch_assoc()){
                array_push($books,$row);
            }
            $result['data'] = $books;

            if($sql){
                $result['message'] = "read successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "read fail";
            }
        }

        if($action == 'room'){
            
            $type = $_POST['rtype'];

            $sql = $con->query("SELECT Room_ID FROM Room WHERE RoomType_Name = '$type' AND Available = 'Y' ");
           
            $books = array();

            while($row = $sql->fetch_assoc()){
                array_push($books,$row);
            }
            $result['data'] = $books;

            if($sql){
                $result['message'] = "read successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "read fail";
            }
        }

        if($action == 'ckguest'){
            $gtitle = $_POST['gtitle'];
            $gfname = $_POST['gfname'];
            $glname = $_POST['glname'];
            $gtel = $_POST['gtel'];
            $gcountry = $_POST['gcountry'];
            $sql = $con->query("SELECT COUNT(*) AS CK FROM Guest 
                                 WHERE Guest_Name = '$gfname' AND Guest_LastName = '$glname' AND Name_Title = '$gtitle' ");
           
            $books = array();

            while($row = $sql->fetch_assoc()){
                array_push($books,$row);
            }
            if($books[0]['CK'] == 0){
                $sql = $con->query("INSERT INTO Guest(`Name_Title`, `Guest_Name`, `Guest_LastName`, `Guest_Country`, `Tel_No`) 
                                    VALUES ('$gtitle', '$gfname', '$glname', '$gcountry', '$gtel')") ;
            }

            $sql = $con->query("SELECT Guest_ID FROM Guest 
                                 WHERE Guest_Name = '$gfname' AND Guest_LastName = '$glname' AND Name_Title = '$gtitle' ");

            $gid = array();
            while($row = $sql->fetch_assoc()){
                array_push($gid,$row);
            }
            $result['data'] = $gid;

            if($sql){
                $result['message'] = "read successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "read fail";
            }
        }

        if($action == 'bookhis'){
            
            $bookid = $_POST['bookid'];
            $guestid = $_POST['guestid'];
            $roomid = $_POST['roomid'];

            $sql = $con->query("INSERT INTO Booked_History(`Guest_ID`, `Room_ID`, `Booking_ID`) 
                                VALUES ('$guestid', '$roomid', '$bookid')");

            $sql = $con->query("UPDATE Booking SET Status = 'CheckIn' WHERE Booking_ID = '$bookid' ");
           

            if($sql){
                $result['message'] = "added successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "added fail";
            }
        }
       
        echo json_encode($result);                                         # -
        
    }
?>