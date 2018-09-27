<%@ Page Language="VB" AutoEventWireup="false" CodeFile="details.aspx.vb" Inherits="details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html>
<head>
    <title>Payment</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link href='https://fonts.googleapis.com/css?family=Satisfy' rel='stylesheet' />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/Payment.css" rel="stylesheet" />
    <link href="css/detail.css" rel="stylesheet" />



</head>
<body>

    <nav class="navbar navbar-inverse navbar-fixed-top">

        <div class="container-fluid">
            <!--Logo-->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#MainMenu">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand"><font color="#4da6ff">Papa</font>Print</a>
            </div>

            <!--Menu Itens-->
            <div class="collapse nav navbar-collapse" id="MainMenu">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="home.aspx">Home</a></li>
                    <li><a href="portfolio.aspx">Portfolio</a></li>
                    <li><a href="tryyourown.aspx">Try Your Own</a></li>
                    <li><a href="payment.aspx">Payment</a></li>

                    <!--DropDown Menu -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">About <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="about.aspx">About Us</a></li>
                            <li><a href="faqs.aspx">FAQs</a></li>
                            <li><a href="contact.aspx">Contact Us</a></li>

                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right" data-toggle="modal" data-target="#login">
                    <li><a href="cart.aspx"><span class="glyphicon glyphicon-shopping-cart"></span>MyCart</a></li>
                    <li><a href="login.aspx">Login</a></li>

                </ul>

            </div>

        </div>
    </nav>



    <div id="page-wrapper" style="margin-top: 90px;">
        <h1>Payment Details</h1>

        <h2>Order Information</h2>

        <!-- Specifying an 'open' attribute will make all the content visible when the page loads -->
        <details>
            <summary>Order #24892105</summary>

            <table>
                <tr>
                    <th scope="row">Order Date</th>
                    <td>30th May 2003</td>
                </tr>
                <tr>
                    <th scope="row">Order Number</th>
                    <td>#24892105</td>
                </tr>
                <tr>
                    <th scope="row">Remittance</th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row">Name</th>
                    <td>Jane Perez
                    </td>
                </tr>
                <tr>
                    <th scope="row">Bank to Bank</th>
                    <td></td>
                </tr>
            </table>
        </details>

        <button type="button" class="btn btn-success">Upload Reciept</button>
        <button type="button" class="btn btn-light pull-right">Done</button>

    </div>



</body>


</html>

