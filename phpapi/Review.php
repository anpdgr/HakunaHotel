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
            $sql = $con->query('SELECT * FROM Review');                    # +
            # var buff for data in database
            $reviews = array();                                            # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($reviews,$row);                                 # -
            }
            $result['data'] = $reviews;                                    # -
        }

        if($action == 'check'){                                             # -
            # edit sql command here
            $bookid = $_POST['bookid'];
            $rtype = $_POST['rtype'];
            $sql = $con->query("SELECT * FROM Review
                                WHERE Booking_ID ='$bookid' AND RoomType_Name = '$rtype'");                    # +
            # var buff for data in database
            $reviews = array();                                            # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($reviews,$row);                                 # -
            }
            $result['data'] = $reviews;                                    # -
        }

        if($action == 'show'){                                             # -
            # edit sql command here
            $rtype = $_POST['rtype'];
            $sql = $con->query("SELECT * FROM Review
                                WHERE RoomType_Name = '$rtype'");                    # +
            # var buff for data in database
            $reviews = array();                                            # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($reviews,$row);                                 # -
            }
            $result['data'] = $reviews;  

            if($sql){                                                      # -
                $result['message'] = "show successfully";                 # -
            }
            else {
                $result['error'] = true;                                   # -
                $result['massage'] = "show fail";                         # -
            }            # -
        }

        # insert command
        if($action == 'add'){                                              # -
            # edit var here
            # create var for insert to database and key in axios
            #var               key
            $bookid = $_POST['bookid'];
            $rtype = $_POST['rtype'];
            $userid = $_POST['userid'];                                    # +
            $comment = $_POST['comment'];                                  # +
            $rate = $_POST['rate'];                                        # +
           
            #edit sql command here
            $sql = $con->query("INSERT INTO Review (`Booking_ID`,`RoomType_Name`,`User_ID`,`Comment`,`Rate`)VALUES ('$bookid', '$rtype', '$userid', '$comment', '$rate')") ; # +
            
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
            $no = $_POST['no'];
            $bookid = $_POST['bookid'];
            $userid = $_POST['userid'];                                    # +
            $comment = $_POST['comment'];                                  # +
            $rate = $_POST['rate'];                                        # +

            #edit sql command here
            $sql = $con->query(" UPDATE Review SET No = '$no', Booking_ID = '$bookid',                  # +
                                 User_ID = '$userid', Comment = '$comment', Rate = '$rate'              # +
                                 WHERE No = '$no' ");                                                   # +
            
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
            $no = $_POST['no'];                                            # +

            #edit sql here
            $sql = $con->query(" DELETE FROM Review WHERE No = '$no' ") ;                        # +
            
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