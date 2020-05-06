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
            $sql = $con->query('SELECT * FROM Booking_Detail');            # +
            # var buff for data in database
            $Blist = array();                                              # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($Blist,$row);                                   # -
            }
            $result['data'] = $Blist;                                      # -
        }

        # insert command
        if($action == 'add'){                                              # -
            # edit var here
            # create var for insert to database and key in axios
            #var               key
            $no = $_POST['no'];                                             # +
            $guestid = $_POST['guestid'];                                   # +
            $roomid = $_POST['roomid'];                                     # +
            $bookid = $_POST['bookid'];                                     # +

            #edit sql command here
            $sql = $con->query("INSERT INTO Booking_Detail VALUES ('$no', '$guestid', '$roomid', '$bookid')") ; # +
            
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
            $no = $_POST['no'];                                            # +
            $guestid = $_POST['guestid'];                                  # +
            $roomid = $_POST['roomid'];                                    # +
            $bookid = $_POST['bookid'];                                    # +

            #edit sql command here
            $sql = $con->query(" UPDATE Booking_Detail SET No = '$no', Guest_ID = '$guestid',               # +
                                 Room_ID = '$roomid', Booking_ID = '$bookid'
                                 WHERE No = '$no' ");                                                       # +
            
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
            $no = $_POST['no'];                                             # +

            #edit sql here
            $sql = $con->query(" DELETE FROM Booking_Detail WHERE No = '$no' ") ;                        # +
            
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