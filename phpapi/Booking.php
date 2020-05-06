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
        if($action == 'read'){                                             # -
            # edit sql command here
            $sql = $con->query('SELECT * FROM Booking');                   # +
            # var buff for data in database
            $books = array();                                              # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($books,$row);                                   # -
            }
            $result['data'] = $books;                                      # -
        }

        # insert command
        if($action == 'add'){                                              # -
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


        # update command
        if($action == 'update'){                                           # -
            # edit var here
            # create var for update to database and key in axios
            #var               key
            $bookid = $_POST['bookid'];                                    # +
            $userid = $_POST['userid'];                                    # +
            $checkIn = $_POST['checkIn'];                                  # +
            $checkOut = $_POST['checkOut'];                                # +
            $date = $_POST['date'];                                        # +
            $numguest = $_POST['numguest'];                                # +
            $status = $_POST['status'];                                    # +

            #edit sql command here
            $sql = $con->query(" UPDATE Booking SET Booking_ID = '$bookid', User_ID = '$userid'                 # +
                                 Name_Title = '$checkIn', Customer_Name = '$checkOut', Tel_No = '$date',        # +
                                 Email = '$numguest', Customer_Country = '$status'                              # +
                                 WHERE Booking_ID = '$bookid' ");                                               # +
            
            # return status likes console log
            if($sql){                                                      # -
                $result['message'] = "updated successfully";               # -
            }
            else {
                $result['error'] = true;                                   # -
                $result['massage'] = "updated fail";                       # -
            }
        }

        # delete command
        if($action == 'delete'){                                           # -
            # edit var here
            # assign var refer to which line would to delete
            $bookid = $_POST['bookid'];                                    # +

            #edit sql here
            $sql = $con->query(" DELETE FROM Booking WHERE Booking_ID = '$bookid' ") ;                        # +
            
            # return status likes console log
            if($sql){                                                      # -
                $result['message'] = "deleted successfully";               # -
            }
            else {
                $result['error'] = true;                                   # -
                $result['massage'] = "deleted fail";                       # -
            }
        }

        #return data in page Don't edit!!!
        echo json_encode($result);                                         # -
        
    }
?>