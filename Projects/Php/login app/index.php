<?php
session_start();
$iuser=$_SESSION['lfrm_key'];
if($_SESSION['lfrm_key']=='')
    //If session not registered    
    { 
        header("location:login.php"); // Redirect to login.php page        
    }
else
    //Continue to current page
    {
    header( 'Content-Type: text/html; charset=utf-8' );    
    if(isset($_COOKIE["lfrm_username"]) && !empty($_COOKIE["lfrm_username"])) {
        $lfrmuser=$_COOKIE["lfrm_username"];        
     }
     else
     {
        $lfrmuser="Null";
     }
    }
?>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Simple login Form</title>
        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">                
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    </head>
    <body>
    <div class="top-content">        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                    <h1 id="wp">Welcome Back&nbsp;<?php echo $iuser?></h1>
                    <p>Cookie value:<?php echo $lfrmuser ?></p>
                    </div>                    
                    <button class="btn" onClick="document.location.href='logout.php'" >Logout</button>			                        
                </div>
            </div>
    
    </div>
</body>
</html>