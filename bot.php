<?php
require("ts3admin.class.php");

$ignore_groups = 1;

$msg_kick = "un proxy a été détecté"; 
$login_query = "serveradmin"; 
$pass_query = "password"; 
$adres_ip = "127.0.0.1";
$query_port = "10011"; 
$port_ts = "9987"; 
$nom_bot = "Robot-Anti-VPN"; 

$ts = new ts3Admin($adres_ip, $query_port);

if(!$ts->getElement('success', $ts->connect()))  {
      die("Anti-Proxy");
}
  
 $ts->login($login_query, $pass_query);

 $ts->selectServer($port_ts);
 
$ts->setName($nom_bot);

while(true) {
sleep(1);
$clientList = $ts->clientList("-ip -groups");



foreach($clientList['data'] as $val) {


$groups = explode(",", $val['client_servergroups'] );

if(in_array($ignore_groups, $groups) || ($val['client_type'] == 1)) {
continue;
}

$file = file_get_contents('https://api.xdefcon.com/proxy/check/?ip='.$val['connection_client_ip'].'');
$file = json_decode($file, true);
if($file['message'] == "Proxy detected.") {
$ts->clientKick($val['clid'], "server", $msg_kick);
}
}
}
?>

