<?php
//Start session
session_start();
//Check whether the session variable SESS_MEMBER_ID is present or not
if (!isset($_SESSION['idPersonel']) || (trim($_SESSION['idPersonel']) == '')) {
    header("location: index.php");
    exit();
}
$session_id=$_SESSION['idPersonel'];

?>