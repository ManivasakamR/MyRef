<?php 
session_start();
include('connection.php');
extract($_POST);
if(isset($_COOKIE["lfrm_username"]) && !empty($_COOKIE["lfrm_username"])) {
    $lfrmuser=$_COOKIE["lfrm_username"];        
    $lfrmpass=$_COOKIE["lfrm_password"];
 }
 else
 {
    $lfrmuser="";
 }
  
if(isset($save))
{
	if($username=="" || $password=="")
	    {
	    $err="<font color='red'>fill all the fileds first</font>";	
	    }
	else
	    {
        //Prevent SQL Injection       
        $password=md5($password);
        $username=stripslashes($username); 
        $password=stripslashes($password);       
        $sql="SELECT * FROM login WHERE usern='$username' and upass='$password'";        
        $result=mysqli_query($conn, $sql);                        
        $count=mysqli_num_rows($result);        
        //echo "<script>alert('$rv');</script>";                                       
        if($count==1){            
            $_SESSION['lfrm_key']=md5($username);       
            header("location:index.php");                        
            if(!empty($_POST["remember"])) {
				setcookie ("lfrm_username",$_POST["username"],time()+ (10 * 365 * 24 * 60 * 60));
				setcookie ("lfrm_password",$_POST["password"],time()+ (10 * 365 * 24 * 60 * 60));
            }             			
        }                
            else
            {
                $err="<font color='red'>Invalid login details</font>";
            }
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
        <!-- Top content -->
        <div class="top-content">
                	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>Simple</strong> Login Form</h1>
                            <div class="description">
                            <div class="col-sm-4"></div>
                            	<p>
	                            	Enter Username &amp; Password	                            	
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Login</h3>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-lock"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="" method="post" class="login-form">
			                    	<div class="form-group">
                                        <label class="sr-only" for="form-username">Username</label>                                        
			                        	<input type="text" name="username" placeholder="Username" class="form-username form-control" id="form-username" value="<?php echo $lfrmuser ?>">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
                                        <input type="password" name="password" placeholder="Password" class="form-password form-control" id="form-password" value="<?php echo $lfrmpass ?>">
                                        <?php echo @$err;?>
                                    </div>
                                    <div class="field-group">
		                            <div><input type="checkbox" name="remember" id="remember" <?php if(isset($_COOKIE["member_login"])) { ?> checked <?php } ?> />
		                            <label for="remember-me">Remember me</label>
	                                </div>
                                    <button type="submit" value="Submit" name="save" class="btn">Login</button>                                                            			                        
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">    
                        <a  id="register" class="btn" href="register.php">
	                        		Register
	                        	</a>                
                        	<h3>...or login with:</h3>
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-2" href="#">
	                        		<i class="fa fa-facebook"></i> Facebook
	                        	</a>
	                        	<a class="btn btn-link-2" href="#">
	                        		<i class="fa fa-twitter"></i> Twitter
	                        	</a>
	                        	<a class="btn btn-link-2" href="#">
	                        		<i class="fa fa-google-plus"></i> Google Plus
	                        	</a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>