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
        if($action == 'TopRoomType'){        
            # edit sql command here
            $sql = $con->query("SELECT RoomType_Name, COUNT(Number_of_Room)AS Number_of_Booking
                                FROM Booking_Detail bd LEFT JOIN Booking b ON bd.Booking_ID = b.Booking_ID
                                WHERE Book_Date LIKE '2020%'
                                GROUP BY RoomType_Name
                                ORDER BY Number_of_Booking DESC");            # +
            # var buff for data in database
            $data = array();                                             # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($data,$row);                                  # -
            }
            $result['data'] = $data;                                     # -
        }

        # update command
        if($action == 'update'){                                           # -
            # edit var here
            # create var for update to database and key in axios
            #var               key
            $staffid = $_POST['staffid'];                                  # +
            $title = $_POST['title'];                                      # +
            $STFname = $_POST['STFname'];                                  # +
            $STLname = $_POST['STLname'];                                  # +
            $tel = $_POST['tel'];                                          # +
            $email = $_POST['email'];                                      # +
            $address = $_POST['address'];                                  # +
            $DOB = $_POST['DOB'];                                          # +
            #edit sql command here
            $sql = $con->query(" UPDATE Staff SET Name_Title = '$title', Staff_FirstName = '$STFname', 
                                 Staff_LastName = '$STLname', Tel_No = '$tel',                     # +
                                 Email = '$email', Address = '$address', Date_Of_Birth = '$DOB'                    # +
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
        
        #return data in page Don't edit!!!
        echo json_encode($result);                                         # -
    }
?>