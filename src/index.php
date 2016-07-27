<?php
    require 'include/DB_Functions.php';
    $db = new DB_Functions();
    
if (isset($_REQUEST['tag']) && $_REQUEST['tag'] != ''){
    // get tag
    $tag = $_REQUEST['tag'];
    // include db handler

 
    // response Array
    $response = array("tag" => $tag, "error" => FALSE);
    $response2 =array();
    $k= array();
    
    if ($tag == 'register') {
        // Registration of user from DOSH Desk
         $code = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['code']);
        $name = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['name']);
        $email = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['email']);
        $college = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['college']);
        $phone = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['phone']);  
        $reg = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['reg']);  
        $accom = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['accom']);
        $team_id = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['team_id']);               
        // login user
            $user = $db->regUser($name,$email,$phone,$college,$code,$reg,$accom,$team_id);
            if ($user) {
                // user registered successfull
            } else {
                // user failed to store
                $response["error"] = TRUE;
                $response["error_msg"] = "Error occured in Registering at Main Desk";
                $response['registration']=0;
                echo json_encode($response);
            }
        }
       else  if ($tag == 'event_admin_login') {
        // Log in an Event Organiser
         $Bits_ID = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['Bits_ID']);
        $password = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['password']);
                      
        // login user
            $user = $db->checkEventAdmin($Bits_ID,$password);
            if ($user) {
                // user credentials correct
            } else {
                // user failed to login
                $response["error"] = TRUE;
                $response["error_msg"] = "Error occured in Logging ,Pls check Credentials!";
                echo json_encode($response);
            }
        }
        else  if ($tag == 'dosh_login') {
        // Log in an Event Organiser
         $team_id= mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['team_id']);
        $password = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['password']);
                      
        // login user
            $user = $db->checkDoshLogin($team_id,$password);
            if ($user) {
                // user credentials correct
            } else {
                // user failed to login
                $response["error"] = TRUE;
                $response["error_msg"] = "Error occured in Logging ,Pls check Credentials!";
                echo json_encode($response);
            }
        }

        else  if ($tag == 'event_indi_data') {
        // get individual events data
         $event_id = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['event_id']);
         $updated_at = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['updated_at']);
            $user = $db->getIndiEventData($event_id,$updated_at);
            if ($user) {
                // data fetching successfull
            } else {
                // failed to fetch data
                $response["error"] = TRUE;
                $response["error_msg"] = "Somethings is fishy";
                echo json_encode($response);
            }
        }
        else  if ($tag == 'event_group_data') {
        // get group details along with members
         $event_id = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['event_id']);
         $updated_at = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['updated_at']);
                           
        // login user
            $user = $db->getGroupEventData($event_id,$updated_at);
            if ($user) {
                // user registered successfull
            } else {
                // data not fetched
                $response["error"] = TRUE;
                $response["error_msg"] = "Group details and Members not fetched";
                echo json_encode($response);
            }
        }
              
        else if ($tag == 'addtoevent') {
        // Add particular participant to event
         
        $pearl_id = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['pearl_id']);
        $event_id = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['event_id']);
        $uploaded_by = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['uploaded_by']);
                    
          $user = $db->addUserToEvent($pearl_id,$event_id,$uploaded_by);
         
         
            if ($user) {
                // user registered successfully
                
            } else {
                // user failed to store
                $response["error"] = TRUE;
                $response["error_msg"] = "Error occured in Registering Participant for the event";
                echo json_encode($response);
            }
        }

        else if ($tag == 'getevents') {
        // Get all events
          $user = $db->getEvents();
            if ($user) {
                // got events successfully
                
            } else {
                // data not fetched
                $response["error"] = TRUE;
                $response["error_msg"] = "Error occured in fetching Events";
                echo json_encode($response);
            }
        }
        else if ($tag == 'creategroupid') {
        // Creating a group

          $group_id = $db->getGroupId();
          $group_name=mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['group_name']);
          $event_id=mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['event_id']);
          $uploaded_by=mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['uploaded_by']);
          $round_id=mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['round_id']);
          $user=$db->addGroupDetails($group_id,$group_name,$event_id,$uploaded_by,$round_id);
          if ($user) {
                // creating group               
            } else {
                // user failed to store
                $response["error"] = TRUE;
                $response["error_msg"] = "Error occured in creating Group";
                echo json_encode($response);
            }
        }
        
        else if ($tag == 'adduserstogroup') {
        // add members to group
        $temparray = json_decode($_REQUEST['data'],true);
        $count=count($temparray);
        $response3=array();
             for($i=0;$i<$count;$i++)
        {
            $group_id=$temparray[$i]['group_id'];
            $pearl_id=$temparray[$i]['pearl_id'];
            $event_id=$temparray[$i]['event_id'];
            $user=$db->addUserToGroup($pearl_id,$group_id,$event_id);
            if($user){
                $response3[$i]=$user;
            }
            else{
                $response3[$i]['user']=$pearl_id;
                $response3[$i]['group']=$group_id;
                $response3[$i]['error']='Error adding user to group'; 
            }
        }
        echo json_encode($response3);
    }
    else if ($tag == 'update_group_round') {
        // Request type is Login User
         
        $temparray = json_decode($_REQUEST['data'],true);
        $count=count($temparray);
        $response3=array();
             for($i=0;$i<$count;$i++)
        {
            $group_id=$temparray[$i]['group_id'];
            $round_id=$temparray[$i]['round_id'];
            $event_id=$temparray[$i]['event_id'];
            $user=$db->updateGroupRound($round_id,$group_id,$event_id);
            if($user){
                $response3[$i]=$user;
                $response3[$i]['error']=FALSE;
            }
            else{
                $response3[$i]['error']=TRUE;
                $response3[$i]['event_id']=$event_id;
                $response3[$i]['group']=$group_id;
                $response3[$i]['error']='Error updating group round'; 
            }
        }
        echo json_encode($response3);
    }
    else if ($tag == 'update_participant_round') {
        // Request type is Login User
         
        $temparray = json_decode($_REQUEST['data'],true);
        $count=count($temparray);
        $response3=array();
             for($i=0;$i<$count;$i++)
        {
            $event_id=$temparray[$i]['event_id'];
            $pearl_id=$temparray[$i]['pearl_id'];
            $round_id=$temparray[$i]['round_id'];
            $user=$db->updateParticipantRound($pearl_id,$event_id,$round_id);
            if($user){
                $response3[$i]['error']=FALSE;
                 $response3[$i]['event_id']=$user['event_id'];
                  $response3[$i]['pearl_id']=$user['pearl_id'];
            }
            else{
                $response3[$i]['user']=$code;
                $response3[$i]['error']=TRUE; 
            }
        }
        echo json_encode($response3);
    }
    else  if ($tag == 'get_event_schedule') {
        // Log in an Event Organiser
        
        $updated_at = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['updated_at']);
                      
        // login user
            $user = $db->getSchedule($updated_at);
            if ($user) {
                // user credentials correct
                $response["error"] = FALSE;
                $response["data"] = $user;
            } else {
                // user failed to login
                $response["error"] = TRUE;
                $response["error_msg"] = "Error occured in getting updated Schedule!";
                
            }
            echo json_encode($response);
        }
    else  if ($tag == 'get_feed') {
        // Log in an Event Organiser
        
        $updated_at = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['updated_at']);
                      
        // login user
            $user = $db->getFeed($updated_at);
            if ($user) {
                // user credentials correct
            } else {
                // user failed to login
                $response["error"] = TRUE;
                $response["error_msg"] = "Error occured in fetching Feed!";
                echo json_encode($response);
            }
        }
        else  if ($tag == 'add_token') {
        // Log in an Event Organiser
        
        $token = mysqli_real_escape_string($GLOBALS['con'],$_REQUEST['token']);
                      
        // login user
            $user = $db->addToken($token);
            if ($user) {
                // user credentials correct
                $response["error"] = FALSE;
                $response["error_msg"] = "Successfully added toekn!";
            } else {
                // user failed to login
                $response["error"] = TRUE;
                $response["error_msg"] = "Error occured in adding Token!";
                
            }
            echo json_encode($response);
        }
        
    else{
        $response["error"] = TRUE;
    $response["error_msg"] = "Required time missing!";
    echo json_encode($response);
    }
}
 else {
    $response["error"] = TRUE;
    $response["error_msg"] = "Required parameter 'tag' is missing!";
    echo json_encode($response);
}
?>