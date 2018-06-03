<?php
session_start();
session_destroy();
$_SESSION['lfrm_key']='';
header("location:index.php");
?>
