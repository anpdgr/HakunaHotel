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
            $sql = $con->query('SELECT * FROM RoomType');                  # +
            # var buff for data in database
            $types = array();                                              # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($types,$row);                                   # -
            }
            $result['data'] = $types;                                      # -
        }

        # insert command
        if($action == 'add'){                                              # -
            # edit var here
            # create var for insert to database and key in axios
            #var               key
            $typename = $_POST['typename'];                                # +
            $price = $_POST['price'];                                      # +
            $limit = $_POST['limit'];                                      # +
            $description = $_POST['description'];                          # +

            #edit sql command here
            $sql = $con->query("INSERT INTO RoomType VALUES ('$typename', '$price', '$limit', '$description')") ; # +
            
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
            $typename = $_POST['typename'];                                # +
            $price = $_POST['price'];                                      # +
            $limit = $_POST['limit'];                                      # +
            $description = $_POST['description'];                          # +

            #edit sql command here
            $sql = $con->query(" UPDATE RoomType SET RoomType_Name = '$typename', Price = '$price',                 # +
                                 Limit_Guest = '$limit', Description = '$description'                               # +
                                 WHERE RoomType_Name = '$typename' ");                                              # +
            
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
            $typename = $_POST['typename'];                                # +

            #edit sql here
            $sql = $con->query(" DELETE FROM RoomType WHERE RoomType_Name = '$typename' ") ;                        # +
            
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