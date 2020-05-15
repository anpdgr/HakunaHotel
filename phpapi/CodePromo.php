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
            $sql = $con->query('SELECT * FROM CodePromo');                 # +
            # var buff for data in database
            $code = array();                                               # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($code,$row);                                    # -
            }
            $result['data'] = $code;                                       # -
        }

        # insert command
        if($action == 'add'){                                              # -
            # edit var here
            # create var for insert to database and key in axios
            #var               key
            $codeid = $_POST['codeid'];                                    # +
            $codename = $_POST['codename'];                                # +
            $SDate = $_POST['SDate'];                                      # +
            $ExDate = $_POST['ExDate'];                                    # +
            $discount = $_POST['discount'];                                # +
            $limit = $_POST['limit'];                                      # +

            #edit sql command here
            $sql = $con->query("INSERT INTO CodePromo VALUES ('$codeid', '$codename', '$SDate', '$ExDate', '$discount', '$limit')") ; # +
            
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
            $codeid = $_POST['codeid'];                                    # +
            $codename = $_POST['codename'];                                # +
            $SDate = $_POST['SDate'];                                      # +
            $ExDate = $_POST['ExDate'];                                    # +
            $discount = $_POST['discount'];                                # +
            $limit = $_POST['limit'];                                      # +

            #edit sql command here
            $sql = $con->query(" UPDATE CodePromo SET Code_ID = '$codeid', Code_Name='$codename',                       # +
                                 StartDate='$SDate',ExpireDate='$ExDate',Discount='$discount',Limit = '$limit'        # +
                                 WHERE Code_ID = '$codeid' ");                                                          # +
            
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
            $codeid = $_POST['codeid'];                                    # +

            #edit sql here
            $sql = $con->query(" DELETE FROM CodePromo WHERE Code_ID = '$codeid' ") ;                        # +
            
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