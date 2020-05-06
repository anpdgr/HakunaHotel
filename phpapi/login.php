<?php
    header('Access-Control-Allow-Origin: *');
    require './contacts.php';
    if ($con->connect_error) {
        die("Connection failed: " . $con->connect_error);
    }
    else {
        #echo "Connected successfully<br>";
        $result = array();
        $action = '';

        if(isset($_GET['action'])){
            $action = $_GET['action'];
        }

        if($action == 'read'){                                             # -
            # edit sql command here
            $sql = $con->query('SELECT User_ID,Staff_ID,Password FROM History_Account WHERE Available = "Y"');           # +
            # var buff for data in database
            $users = array();                                              # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($users,$row);                                   # -
            }
            $result['data'] = $users;                                      # -
        }
        
        echo json_encode($result);
        
    }
?>