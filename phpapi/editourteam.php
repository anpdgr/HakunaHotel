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
            $sql = $con->query('SELECT * FROM Staff');                     # +
            # var buff for data in database
            $staffs = array();                                             # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($staffs,$row);                                  # -
            }
            $result['data'] = $staffs;                                     # -
        }

        # insert command
        if($action == 'add'){                                              # -
            # edit var here
            # create var for insert to database and key in axios
            #var               key
            $staffid = $_POST['staffid'];                                  # +
            $pass = $_POST['pass'];                                        # +
            $title = $_POST['title'];                                      # +
            $STFname = $_POST['STFname'];                                  # +
            $STLname = $_POST['STLname'];                                  # +
            $position = $_POST['position'];                                # +
            $tel = $_POST['tel'];                                          # +
            $email = $_POST['email'];                                      # +
            $address = $_POST['address'];                                  # +
            $DOB = $_POST['DOB'];                                          # +
            $SDate = $_POST['startdate'];                                  # +
            $EndDate = $_POST['enddate'];                                  # +
            $salary = $_POST['salary'];                                    # +
            #edit sql command here
            $sql = $con->query("INSERT INTO Staff VALUES ('$staffid', '$pass', '$title', '$STFname', '$STLname', '$position', '$DOB', '$tel', '$email', '$SDate', '$EndDate', '$salary', '$address')") ; # +
            
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
            $staffid = $_POST['staffid'];                                  # +
            $Position = $_POST['Position'];                                # +
            $SDate = $_POST['SDate'];                                  # +
            $EDate = $_POST['EDate'];                                  # +
            $Salary = $_POST['Salary'];                                    # +
            
            #edit sql command here
            $sql = $con->query(" UPDATE Staff SET Start_Date = '$SDate', # +       # +
                                 Salary = '$Salary', Position = '$Position'                      # +
                                 WHERE Staff_ID = '$staffid' ");                                                        # +
          
            # return status likes console log
            if($sql){                                                      # -
                $result['message'] = "updated successfully";               # -
            }
            else {
                $result['error'] = true;                                   # -
                $result['massage'] = "updated fail";                       # -
            }
        }
        if($action == 'updateED'){                                           # -
            # edit var here
            # create var for update to database and key in axios
            #var               key
            $staffid = $_POST['staffid'];                                  # +
            $Position = $_POST['Position'];                                # +
            $SDate = $_POST['SDate'];                                  # +
            $EDate = $_POST['EDate'];                                  # +
            $Salary = $_POST['Salary'];                                    # +
            
            #edit sql command here
            $sql = $con->query(" UPDATE Staff SET Start_Date = '$SDate', # +       # +
                                 End_Date='$EDate',Salary = '$Salary', Position = '$Position'                      # +
                                 WHERE Staff_ID = '$staffid' ");                                                        # +
          
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
            $staffid = $_POST['staffid'];                                  # +

            #edit sql here
            $sql = $con->query(" DELETE FROM Staff WHERE Staff_ID = '$staffid' ") ;                        # +
            
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