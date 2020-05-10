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
            $sql = $con->query('SELECT * FROM Customer');                  # +
            # var buff for data in database
            $users = array();                                              # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($users,$row);                                   # -
            }
            $result['data'] = $users;                                      # -
        }

        # insert command
        if($action == 'add'){                                              # -
            # edit var here
            # create var for insert to database and key in axios
            #var               key
            $userid = $_POST['userid'];                                    # +
            $pass = $_POST['pass'];                                        # +
            $title = $_POST['title'];                                      # +
            $cusfname = $_POST['cusfname'];                                # +
            $cuslname = $_POST['cuslname'];                                # +
            $DOB = $_POST['DOB'];                                          # +
            $tel = $_POST['tel'];                                          # +
            $email = $_POST['email'];                                      # +
            $country = $_POST['country'];                                  # +

            #edit sql command here
            $sql = $con->query("INSERT INTO Customer VALUES ('$userid', '$pass', '$title', '$cusfname', '$cuslname', '$DOB', '$tel', '$email', '$country')") ; # +
            
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
            $userid = $_POST['userid'];                                    # +
            $title = $_POST['title'];                                      # +
            $cusfname = $_POST['cusfname'];                                # +
            $cuslname = $_POST['cuslname'];                                # +
            $tel = $_POST['tel'];                                          # +
            $email = $_POST['email'];                                      # +
            $country = $_POST['country'];                                  # +
            $DOB = $_POST['DOB'];                                          # +

            #edit sql command here
            $sql = $con->query(" UPDATE Customer SET Name_Title = '$title', Customer_FirstName = '$cusfname',
                                 Customer_LastName = '$cuslname', DoB = '$DOB', Email = '$email',
                                 Customer_Country = '$country', Tel_No = '$tel'                           # +
                                 WHERE User_ID = '$userid' ");                                                              # +
            
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
            $userid = $_POST['userid'];                                    # +

            #edit sql here
            $sql = $con->query(" DELETE FROM Customer WHERE User_ID = '$userid' ") ;                        # +
            
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