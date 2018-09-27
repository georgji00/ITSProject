<%@ Page Language="VB" AutoEventWireup="false" CodeFile="payment.aspx.vb" Inherits="payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href='https://fonts.googleapis.com/css?family=Satisfy' rel='stylesheet'>
<%--    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
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
                        <li class="active"><a href="home.aspx">Home</a></li>
                           <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <asp:Repeater runat="server" ID="rptrPort">
                                    <ItemTemplate>
                                        <li>
                                            <asp:LinkButton OnClick="lnkPort_Click" runat="server" ID="lnkPort" Text='<%#Eval("pc_product_name")%>'></asp:LinkButton></li>
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


        <div class="login">
            <h1>HI THERE. PLEASE ENTER YOUR ORDER CODE.</h1>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtcode" ForeColor="red" Font-Bold="true" ValidationGroup="code" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
           <asp:Label runat="server" ID="lblErr" ForeColor="Red" Font-Bold="true"></asp:Label>
             <p>
                <asp:TextBox runat="server" ID="txtcode" placeholder="Enter Ordercode"></asp:TextBox></p>
            <p class="submit">
                <asp:Button runat="server" ID="btnCode" CausesValidation="true" ValidationGroup="code" text="Enter" OnClick="btnCode_Click"/>
            </p>
            
            <div class="container-fluid" runat="server" visible="false" id="divcode">
                 <asp:Repeater runat="server" ID="rptrOrder">
                                                <ItemTemplate>
                                                    Order Code: &nbsp;<asp:Label runat="server" ID="lblID" Text='<%#Eval("order_id")%>'></asp:Label>
                                                    <br>
                                                    <br>
                                                    Name:&nbsp;<%#Eval("order_fname")%>&nbsp;<%#Eval("order_lname")%>
                                                    <br>
                                                    <br>
                                                    Address:&nbsp;<%#Eval("order_address")%>
                                                    <br>
                                                    Contact Number:&nbsp;<%#Eval("order_contact")%>
                                                    <br>
                                                    <br>
                                                    Ordered Products:&nbsp;<%#Eval("order_prodtype")%>
                                                    <br>
                                                    <br>
                                                    <asp:Image runat="server" ID="front" ImageUrl='<%#Eval("order_design_front")%>' Height="250px" Width="250px" />
                                                    <asp:Image runat="server" ID="Image1" ImageUrl='<%#Eval("order_design_back")%>' Height="250px" Width="250px" />
                                                    <br>
                                                    <br>
                                                    Quantity:&nbsp; <%#Eval("order_quantity")%>
                                                    <br>
                                                    <br>
                                                    Price:&nbsp;<%#Eval("order_subtotal")%>
                                                    <br>
                                                    <br>
                                                    Order Type:&nbsp; <%#Eval("order_type")%>
                                                    <br>
                                                    <br>
                                                    Date:&nbsp; <%#Eval("order_date_needed")%>
                                                    <br>
                                                    <br>
                                                    Order Remarks:&nbsp;<%#Eval("order_remarks")%>
                                                    <br>
                                                    <br>
                                                    Shipment Method:&nbsp; <%#Eval("order_shipment")%>
                                                    <br>
                                                    <br>
                                                    Payment Method:&nbsp; <%#Eval("order_payment")%>
                                                </ItemTemplate>
                                            </asp:Repeater>
            </div>
        </div>

        <script>
            $('#MainMenu .navbar-nav a').on('click', function () {
                $('#MainMenu .navbar-nav').find('li.active').removeClass('active');
                $(this).parent('li').addClass('active');
            });
        </script>

    </form>
</body>


</html>
