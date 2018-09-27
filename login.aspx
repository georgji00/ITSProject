<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Login Page</title>
    
    <meta name="description" content="Free Admin Template Based On Twitter Bootstrap 3.x"/>
    <meta name="author" content=""/>
    
    <meta name="msapplication-TileColor" content="#5bc0de" />
    <meta name="msapplication-TileImage" content="assets/img/metis-tile.png" />
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="assets/lib/bootstrap/css/bootstrap.css"/>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="assets/lib/font-awesome/css/font-awesome.css"/>
    
    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="assets/css/main.css"/>
    
    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="assets/lib/metismenu/metisMenu.css"/>
    
    <!-- onoffcanvas stylesheet -->
    <link rel="stylesheet" href="assets/lib/onoffcanvas/onoffcanvas.css"/>
    
    <!-- animate.css stylesheet -->
    <link rel="stylesheet" href="assets/lib/animate.css/animate.css"/>


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="login">

	<nav class="navbar navbar-inverse navbar-fixed-top">

		<div class="container-fluid">
			<!--Logo-->
			<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#MainMenu">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
				  <a  href="#" class="navbar-brand"><img src="img/logo.png" height="25" width="100"></a>
			</div>

			<!--Menu Itens-->
			<div class= "collapse nav navbar-collapse" id="MainMenu">
				<ul class="nav navbar-nav">
					<li class="active" ><a href="home.aspx">Home</a></li>
					<li ><a href="portfolio.aspx">Portfolio</a></li>
					<li ><a href="tryyourown.aspx">Try Your Own</a></li>
					<li ><a href="payment.aspx">Payment</a></li>
					<!--DropDown Menu -->
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle ="dropdown" >About <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li ><a href="about.aspx">About Us</a></li>
							<li ><a href="faqs.aspx">FAQs</a></li>
							<li ><a href="contact.aspx">Contact Us</a></li>
						</ul>
					
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right" data-toggle="modal" data-target="#login">

				<li ><a href="cart.aspx"><span class="glyphicon glyphicon-shopping-cart"></span> MyCart</a></li>

					<li ><a href="login.aspx">Login</a></li>

				</ul>

				</div>
			</div>
	
	</nav>

      <div class="form-signin">
    <div class="text-center">
        <img src="https://dewey.tailorbrands.com/production/brand_version_mockup_image/402/1187844402_05cd3669-4818-4c9c-b855-d0bd93bbc7c8.png?cb=1537021252" height="40" width="150"/>
    </div>
    <hr/>
    <div class="tab-content">
        <div id="login" class="tab-pane active">
            <form action="index.html">
                <p class="text-muted text-center">
                    Enter your username and password
                </p>
                <input type="text" placeholder="Username" class="form-control top">
                <input type="password" placeholder="Password" class="form-control bottom">
                <div class="checkbox">
		</div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
        </div>
		<div id="signup" class="tab-pane">
            <form action="index.html">
                <p class="text-muted text-center">Fill up form</p>
				<input type="text" class="form-control" id="inputFirstname" placeholder="Enter Firstname">
				 <input type="text" class="form-control" id="inputLastname" placeholder="Enter Lastname">
                 <input type="text" class="form-control" id="inputUsername" placeholder="Enter Username">
				 <input type="email" class="form-control" id="inputEmail" placeholder="Enter email">
				  <input type="password" class="form-control" id="inputPassword3" placeholder="Enter Password">
                <br>
                <button class="btn btn-lg btn-danger btn-block" type="submit">Sign up</button>
            </form>
        </div>
        <div id="forgot" class="tab-pane">
            <form action="index.html">
                <p class="text-muted text-center">Enter your valid e-mail</p>
                <input type="email" placeholder="mail@domain.com" class="form-control">
                <br>
                <button class="btn btn-lg btn-danger btn-block" type="submit">Recover Password</button>
            </form>
        </div>
    </div>
    <hr>
    <div class="text-center">
        <ul class="list-inline">
            <li><a class="text-muted" href="#login" data-toggle="tab">Login</a></li>
            <li><a class="text-muted" href="#forgot" data-toggle="tab">Forgot Password</a></li>
			<li><a class="text-muted" href="#signup" data-toggle="tab">Sign up</a></li>
        </ul>
    </div>
  </div>


    <!--jQuery -->
    <script src="assets/lib/jquery/jquery.js"></script>

    <!--Bootstrap -->
    <script src="assets/lib/bootstrap/js/bootstrap.js"></script>


    <script type="text/javascript">
        (function ($) {
            $(document).ready(function () {
                $('.list-inline li > a').click(function () {
                    var activeForm = $(this).attr('href') + ' > form';
                    //console.log(activeForm);
                    $(activeForm).addClass('animated fadeIn');
                    //set timer to 1 seconds, after that, unload the animate animation
                    setTimeout(function () {
                        $(activeForm).removeClass('animated fadeIn');
                    }, 1000);
                });
            });
        })(jQuery);
    </script>
</body>

</html>