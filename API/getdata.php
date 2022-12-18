<?php
include "config.php";
$sql="select * from registration";
$result=array();
$res=$con->query($sql);
//print_r($res);
if($res->num_rows>0)
{
	while($row=$res->fetch_assoc()){
		$result[]=$row;
	}
}
//print_r($result);
echo json_encode($result);
?>