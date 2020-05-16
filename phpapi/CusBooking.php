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

        # select command
        if($action == 'fbookid'){
            
            $userid = $_POST['userid'];

            $sql = $con->query(" SELECT *
                                 FROM Booking b JOIN Payment p ON b.Booking_ID = p.Booking_ID 
                                 WHERE User_ID = '$userid' ");
           
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

        # insert command
        if($action == 'add'){
            # edit var here
            # create var for insert to database and key in axios
            #var               key
            $bookid = $_POST['bookid'];                                    # +
            $userid = $_POST['userid'];                                    # +
            $checkIn = $_POST['checkIn'];                                  # +
            $checkOut = $_POST['checkOut'];                                # +
            $date = $_POST['date'];                                        # +
            $numguest = $_POST['numguest'];                                # +
            $status = $_POST['status'];                                    # +

            #edit sql command here
            $sql = $con->query("INSERT INTO Booking VALUES ('$bookid', '$userid', '$checkIn', '$checkOut', '$date', '$numguest', '$status')") ; # +
            
            # return status likes console log
            if($sql){                                                      # -
                $result['message'] = "added successfully";                 # -
            }
            else {
                $result['error'] = true;                                   # -
                $result['massage'] = "added fail";                         # -
            }
        }

        echo json_encode($result);                                         # -
        
    }
?>