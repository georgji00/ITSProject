<%@ Page Language="VB" AutoEventWireup="false" CodeFile="portfolio.aspx.vb" Inherits="portfolio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Portfolio</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href='https://fonts.googleapis.com/css?family=Satisfy' rel='stylesheet' />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="script/jquery.min.js"></script>
    <script src="script/bootstrap.min.js"></script>
    <link href="css/bootstraps.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/Payment.css" rel="stylesheet" />


</head>
<body>
   <form runat="server" id="form1">
    <nav class="navbar navbar-inverse navbar-fixed-top">

        <div class="container-fluid">
            <!--Logo-->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#MainMenu">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">
                    <img src="img/logo.png" height="25" width="100"></a>
            </div>

            <!--Menu Itens-->
            <div class="collapse nav navbar-collapse" id="MainMenu">
                <ul class="nav navbar-nav">
                    <li><a href="home.aspx">Home</a></li>
                      <li class="dropdown active">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                           <asp:Repeater runat="server" ID="rptrPort">
                               <ItemTemplate>
                                   <li><asp:LinkButton OnClick="lnkPort_Click" runat="server" ID="lnkPort" Text='<%#Eval("pc_product_name")%>'></asp:LinkButton></li>
                               </ItemTemplate>
                           </asp:Repeater>

                        </ul>
                    </li>
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

                        <li runat="server" id="liCart" visible="false"><a href=""><span class="glyphicon glyphicon-shopping-cart"></span>MyCart</a></li>
                        <li runat="server" id="liLogout" visible="false"><asp:LinkButton runat="server" ID="lnkLogout" Text="Logout"></asp:LinkButton></li>
                        <li class="dropdown" runat="server" id="lilogin" visible="true">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login</a>
                            <ul class="dropdown-menu">
                                <li>&nbsp; Username:<asp:TextBox height="30px" runat="server" ID="txtUsername"></asp:TextBox></li>
                                <li>&nbsp;Password:<asp:TextBox  height="30px" runat="server" ID="txtPassword"></asp:TextBox></li>
                                <li><asp:Button OnClick="btnLog_Click" runat="server" height="30px" CssClass="form-control" ID="btnLog" Text="Login" /></li>
                                <li><asp:LinkButton runat="server" ID="lnkRecover" Text="Recover Password"></asp:LinkButton></li>
                            </ul>
                        </li>
                    </ul>

            </div>
        </div>

    </nav>

    <div class="container" style="margin-top:100px">
        <div class="container">
            <asp:Label runat="server" ID="lblHeader" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
        </div>
        <div class="container" style="margin-top:100px">
              <asp:DataList runat="server" ID="dtPort" RepeatDirection="Vertical" RepeatColumns="4">
            <ItemTemplate>
                <section style="margin:20px">
                    <asp:image runat="server" CssClass="img-responsive" ID="img" ImageUrl='<%#Eval("item_image")%>' Height="280px" Width="280px" />
                </section>
            </ItemTemplate>
        </asp:DataList>
        </div>
      
    </div>


    </form>
</body>


</html>
