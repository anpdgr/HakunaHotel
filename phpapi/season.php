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
            $sql = $con->query('SELECT * FROM Season');
            $users = array();

            while($row = $sql->fetch_assoc()){
                array_push($users,$row);
            }
            $result['Name'] = $users;
            
        }


        if($action == 'add'){
            $name = $_POST['name'];
            $sd = $_POST['sd'];
            $ed = $_POST['ed'];

            $sql = $con->query("INSERT INTO Season VALUES ('$name','$sd','$ed')") ;
            
            if($sql){
                $result['message'] = "added successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "added fail";
            }
        }

        if($action == 'update'){
            $name = $_POST['name'];
            $newname = $_POST['newname'];
            $sd = $_POST['sd'];
            $ed = $_POST['ed'];

            $sql = $con->query(" UPDATE Season SET Season_Name = '$newname' , Start_DATE = '$sd' , END_Date = '$ed' WHERE Season_Name = '$name' ") ;
            
            if($sql){
                $result['message'] = "updated successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "updated fail";
            }
        }

        if($action == 'delete'){
            $name = $_POST['name'];

            $sql = $con->query(" DELETE FROM Season WHERE Season_Name = '$name' ") ;
            
            if($sql){
                $result['message'] = "deleted successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "deleted fail";
            }
        }

        
        echo json_encode($result);
        
    }
?>