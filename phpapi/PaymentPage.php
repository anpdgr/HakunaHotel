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
            $result['Data'] = $users;
            
        }

        if($action == 'user'){
            $userid = $_POST['userid'];
            $sql = $con->query("SELECT Customer_FirstName, Customer_LastName FROM Customer WHERE User_ID='$userid' ");
            $users = array();

            while($row = $sql->fetch_assoc()){
                array_push($users,$row);
            }
            $result['Data'] = $users;
        }
        
        if($action == 'seasondis'){
            $S_Name = $_POST['S_Name'];
            $sql = $con->query("SELECT RoomType_Name,Discount FROM Today_Price WHERE Season_Name = '$S_Name' ");
            $users = array();

            while($row = $sql->fetch_assoc()){
                array_push($users,$row);
            }
            $result['Data'] = $users;
        }

        if($action == 'codepromo'){
            $sql = $con->query("SELECT * FROM CodePromo ");
            $users = array();

            while($row = $sql->fetch_assoc()){
                array_push($users,$row);
            }
            $result['Data'] = $users;

            if($sql){
                $result['message'] = "code successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "code fail";
            }
        }

        if($action == 'usecode'){
            $Code = $_POST['code'];
            $limit = $_POST['limit'];
            $limit = $limit-1;
            $sql = $con->query(" UPDATE CodePromo SET `Limit` = '$limit' WHERE `Code_ID` = '$Code' ");

            if($sql){
                $result['message'] = "updated successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "updated fail";
            }
        }

        if($action == 'booking'){
            $bookid = $_POST['bookid'];
            $userid = $_POST['userid'];
            $checkIn = $_POST['checkIn'];
            $checkOut = $_POST['checkOut'];
            $numguest = $_POST['numguest'];
            $status = "Booking";

            $method = $_POST['method'];
            $codeid = $_POST['codeid'];
            $date = date("Y-m-d");
            
            $sql = $con->query("INSERT INTO Booking VALUES ('$bookid', '$userid', '$checkIn', '$checkOut', '$date', '$numguest', '$status')") ;
            
            $sql = $con->query("INSERT INTO Payment(`Method`,`Booking_ID`,`Code_ID`,`Date`) VALUES ('$method', '$bookid', '$codeid', '$date')") ;

            if($sql){
                $result['message'] = "added successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "added fail";
            }
        }

        if($action == 'bookdetail'){
            $bookid = $_POST['bookid'];
            $typename = $_POST['typename'];
            $numroom = $_POST['numroom'];

            $sql = $con->query("INSERT INTO `Booking_Detail` VALUES ('$bookid', '$typename', '$numroom') ") ;
            
            if($sql){
                $result['message'] = "added successfully";
            }
            else {
                $result['error'] = true;
                $result['massage'] = "added fail";
            }
        }

        if($action == 'hisNo'){
            $userid = $_POST['userid'];
            $sql = $con->query('SELECT COUNT(*) AS Count FROM Booked_History');
            $users = array();

            while($row = $sql->fetch_assoc()){
                array_push($users,$row);
            }
            $result['Data'] = $users;
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