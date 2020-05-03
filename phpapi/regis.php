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
            $sql = $con->query('SELECT * FROM Customer');
            $users = array();

            while($row = $sql->fetch_assoc()){
                array_push($users,$row);
            }
            $result['data'] = $users;
            
        }


        if($action == 'add'){
            $userid = $_POST['userid'];
            $pass = $_POST['pass'];
            $title = $_POST['title'];
            $cusname = $_POST['cusname'];
            $tel = $_POST['tel'];
            $email = $_POST['email'];
            $country = $_POST['country'];
            $DOB = $_POST['DOB'];

            $sql = $con->query("INSERT INTO Customer VALUES ('$userid', '$pass', '$title', '$cusname', '$tel', '$email', '$country', '$DOB')") ;
            
            if($sql){
                $result['message'] = "added successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "added fail";
            }
        }

        if($action == 'update'){
            $userid = $_POST['userid'];
            $pass = $_POST['pass'];
            $title = $_POST['title'];
            $cusname = $_POST['cusname'];
            $tel = $_POST['tel'];
            $email = $_POST['email'];
            $country = $_POST['country'];
            $DOB = $_POST['DOB'];

            $sql = $con->query(" UPDATE Customer SET User_ID = '$userid', Password = '$pass',
                                 Name_Title = '$title', Customer_Name = '$cusname', Tel_No = '$tel',
                                 Email = '$email', Customer_Country = '$country', DoB = '$DOB'
                                 WHERE User_ID = '$userid' ");
            
            if($sql){
                $result['message'] = "updated successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "updated fail";
            }
        }

        if($action == 'delete'){
            $userid = $_POST['userid'];

            $sql = $con->query(" DELETE FROM Customer WHERE User_ID = '$userid' ") ;
            
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