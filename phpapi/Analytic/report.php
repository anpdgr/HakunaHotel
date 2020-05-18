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
        if($action == 'RoomRating'){        
            # edit sql command here
            $sql = $con->query("SELECT rt.RoomType_Name, AVG(r.Rate) AS AVGRating
                                FROM RoomType rt JOIN Review r ON r.RoomType_Name=rt.RoomType_Name
                                GROUP BY r.RoomType_Name
                                ORDER BY AVGRating DESC");            # +
            # var buff for data in database
            $data = array();                                             # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($data,$row);                                  # -
            }
            $result['data'] = $data;                                     # -
        }
        
        if($action == 'useCode'){        
            # edit sql command here
            $sql = $con->query("SELECT Code_Name,COUNT(p.Code_ID) AS Number_of_Using
                                FROM Payment p RIGHT JOIN CodePromo c ON p.Code_ID=c.Code_ID
                                GROUP BY c.Code_Name
                                ORDER BY Number_of_Using DESC");            # +
            # var buff for data in database
            $data = array();                                             # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($data,$row);                                  # -
            }
            $result['data'] = $data;                                     # -
        }

        if($action == 'May'){        
            # edit sql command here
            $sql = $con->query("SELECT COUNT(d.Booking_ID)AS Num_of_Booking, d.RoomType_Name 
                                FROM Booking_Detail d
                                JOIN Booking b ON b.Booking_ID = d.Booking_ID
                                WHERE b.Book_Date LIKE '2020-05%'
                                GROUP BY d.RoomType_Name");            # +
            # var buff for data in database
            $data = array();                                             # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($data,$row);                                  # -
            }
            $result['data'] = $data;                                     # -
        }

        if($action == 'staff'){        
            # edit sql command here
            $sql = $con->query("SELECT Position, COUNT(Position)AS Num_of_Staff  
                                FROM Staff GROUP BY Position
                                ORDER BY Num_of_Staff DESC");            # +
            # var buff for data in database
            $data = array();                                             # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($data,$row);                                  # -
            }
            $result['data'] = $data;                                     # -
        }

        if($action == 'room'){        
            # edit sql command here
            $sql = $con->query("SELECT RoomType_Name, COUNT(Room_ID)AS Num_of_Room  
                                FROM Room GROUP BY RoomType_Name
                                ORDER BY Num_of_Room DESC");            # +
            # var buff for data in database
            $data = array();                                             # -
            # fetch data from database
            while($row = $sql->fetch_assoc()){                             # -
                array_push($data,$row);                                  # -
            }
            $result['data'] = $data;                                     # -
        }

        #return data in page Don't edit!!!
        echo json_encode($result);                                         # -
    }
?>