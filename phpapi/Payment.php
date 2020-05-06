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
            $sql = $con->query('SELECT * FROM Payment');                   # +
            # var buff for data in database
            $payment = array();                                            # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($payment,$row);                                 # -
            }
            $result['data'] = $payment;                                    # -
        }

        # insert command
        if($action == 'add'){                                              # -
            # edit var here
            # create var for insert to database and key in axios
            #var               key
            $no = $_POST['no'];                                            # +
            $method = $_POST['method'];                                    # +
            $bookid = $_POST['bookid'];                                    # +
            $codeid = $_POST['codeid'];                                    # +
            $date = $_POST['date'];                                        # +

            #edit sql command here
            $sql = $con->query("INSERT INTO Payment VALUES ('$no', '$method', '$bookid', '$codeid', '$date')") ; # +
            
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
            $no = $_POST['no'];                                             # +
            $method = $_POST['method'];                                     # +
            $bookid = $_POST['bookid'];                                     # +
            $codeid = $_POST['codeid'];                                     # +
            $date = $_POST['date'];                                         # +

            #edit sql command here
            $sql = $con->query(" UPDATE Payment SET No = '$no', Method = '$method',                # +
                                 Booking_ID = '$bookid', Code_ID = '$codeid', Date = '$date'
                                 WHERE No = '$no' ");                                              # +
            
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
            $sql = $con->query(" DELETE FROM Payment WHERE No = '$no' ") ;                        # +
            
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