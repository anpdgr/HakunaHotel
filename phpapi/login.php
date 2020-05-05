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

        if($action == 'read'){
            $sql = $con->query('SELECT User_ID,Password FROM Customer');
            $users = array();

            while($row = $sql->fetch_assoc()){
                array_push($users,$row);
            }
            $result['data'] = $users;
            
        }
        
        echo json_encode($result);
        
    }
?>