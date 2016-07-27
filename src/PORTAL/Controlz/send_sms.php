<?php
//Please Enter Your Details
if(isset($_POST['login'])){
	$con=mysqli_connect('bits-su.com','dbpearl','dotapearl15','pearl_15');
$user=mysqli_real_escape_string($con,$_POST['user']); //your username
$password=mysqli_real_escape_string($con,$_POST['password']); //your password
$mobilenumbers=mysqli_real_escape_string($con,$_POST['mobilenumber']);//enter Mobile numbers comma seperated
$message = mysqli_real_escape_string($con,$_POST['message']); //enter Your Message
$senderid="PEARLH"; //Your senderid
$messagetype="N"; //Type Of Your Message
$DReports="Y"; //Delivery Reports
$url="http://sms.sperrysms.in/WebServiceSMS.aspx";
$message = urlencode($message);
$ch = curl_init();
if (!$ch){die("Couldn't initialize a cURL handle");}
$ret = curl_setopt($ch, CURLOPT_URL,$url);
curl_setopt ($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
curl_setopt ($ch, CURLOPT_POSTFIELDS,
"User=$user&passwd=$password&mobilenumber=$mobilenumbers&message=$message&sid=$senderid&mtype=$messagetype&DR=$DReports");
$ret = curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//If you are behind proxy then please uncomment below line and provide your proxy ip with port.
// $ret = curl_setopt($ch, CURLOPT_PROXY, "PROXY IP ADDRESS:PORT");
$curlresponse = curl_exec($ch); // execute
if(curl_errno($ch))
echo 'curl error : '. curl_error($ch);
if (empty($ret)) {
// some kind of an error happened
die(curl_error($ch));
curl_close($ch); // close cURL handler
} else {
$info = curl_getinfo($ch);
curl_close($ch); // close cURL handler
echo $curlresponse; //echo "Message Sent Succesfully" ;
}
}
else{
	echo "Invalid Request";
}
?>