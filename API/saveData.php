<?php
include "config.php";
$name = $_POST['name'];
$mobileno = $_POST['mobileno'];
$password = $_POST['password'];
if($name!="" && $mobileno!="" && $password!="")
{
$sql = "insert into registration(cid, name, mobileno, password) values ('','$name','$mobileno','$password');";
if($con->query($sql))
{
	echo "true";
}
else
{
	echo "false";
}
}
?>