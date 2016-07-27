<?php 
session_start();
include("../functions/functions.php");
if(!isset($_SESSION['controlz_id'])){
  echo "<script>window.open('login.php','_self')</script>";
}
else{
  // start controlz work here
}

?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Controlz'16</title>

    <link href='https://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css'>
<link type="text/css" rel="stylesheet" href="../bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="../../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
<style type="text/css">
 .space{
    width:100%;
    height: 50px;
  }</style>
</head>
<body>
<nav>
 <ul class="navigbar">
  <li><a href="addevent.php">Add Event</a></li>
  <li><a href="send_notification.php">Send Notification</a></li>
  <li><a href="participants.php">Participants</a></li>
  <li><a href="#">Team</a></li>
  <li style="float:right"><a href="logout.php">Log Out</a></li>
  </ul>
 </ul>
</nav>
<div class="space"></div>
<div class="container"><br>
<div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Send SMS</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="post" action="http://bits-pearl.org/App/send_sms.php">
                        <fieldset>
                            <div class="form-group"  >
                                <input class="form-control" placeholder="Username" name="user" type="text" autofocus>
                            </div>
                            <div class="form-group"  >
                                <input class="form-control" placeholder="Password" name="password" type="text" autofocus>
                            </div>
                            <div class="form-group"  >
                                <input class="form-control" placeholder="Mobile Numbers" name="mobilenumber" type="number" autofocus>
                            </div>
                            <div class="form-group"  >
                                <input class="form-control" placeholder="ENter your Message" name="message" type="text" autofocus>
                            </div>

                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Login" name="login" >
                        </fieldset>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

