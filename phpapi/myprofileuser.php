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

        $result = array();                                                 
        $action = '';                                                      

        if(isset($_GET['action'])){                                        
            $action = $_GET['action'];                                     
        }

        if($action == 'read'){
            $userid = $_POST['userid'];

            $sql = $con->query("SELECT * FROM Customer 
                                WHERE User_ID = '$userid' ");   

            $users = array();                                              
            while($row = $sql->fetch_assoc()){                             
                array_push($users,$row);                                   
            }
            $result['data'] = $users;   
            
            if($sql){                                                      
                $result['message'] = "read successfully";                 
            }
            else {
                $result['error'] = true;                                   
                $result['massage'] = "read fail";                         
            }                                   
        }
        echo json_encode($result);                                         
        
    }
?>