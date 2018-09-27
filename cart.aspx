<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cart.aspx.vb" Inherits="cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href='https://fonts.googleapis.com/css?family=Satisfy' rel='stylesheet' />
    <%--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
                        <img src="img/logo.png" height="25" width="100" /></a>
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">About<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="about.aspx">About Us</a></li>
                                <li><a href="faqs.aspx">FAQs</a></li>
                                <li><a href="contact.aspx">Contact Us</a></li>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container-fluid" runat="server" id="divCart">
            <div class="container">
                <div class="row">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h5><span class="glyphicon glyphicon-shopping-cart"></span>Shopping Cart</h5>
                                    </div>
                                    <div class="col-xs-6">
                                        <button type="button" class="btn btn-primary btn-sm btn-block">
                                            <span class="glyphicon glyphicon-share-alt"></span>Continue shopping
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">

                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="cart" ForeColor="Red" Font-Bold="true" ShowSummary="true" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlprodType" runat="server" ErrorMessage="product type is required" ValidationGroup="cart" Display="None"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlprodname" runat="server" ErrorMessage="product name is required" ValidationGroup="cart" Display="None"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtQuantity" runat="server" ErrorMessage="quantity is required" ValidationGroup="cart" Display="None"></asp:RequiredFieldValidator>

                            <div class="row">

                                <div class="col-xs-3">
                                    <h4 class="product-name"><strong>Product type</strong></h4>
                                    <h4>
                                        <small>
                                            <asp:DropDownList AutoPostBack="true" runat="server" ID="ddlprodType">
                                            </asp:DropDownList>
                                        </small>
                                    </h4>
                                </div>
                                <div class="col-xs-3">
                                    <h4 class="product-name"><strong>Product name</strong></h4>
                                    <h4>
                                        <small>
                                            <asp:DropDownList AutoPostBack="true" Enabled="false" runat="server" ID="ddlprodname">
                                            </asp:DropDownList>
                                        </small>

                                    </h4>
                                </div>
                                <div class="col-xs-3">
                                    <h4 class="product-name"><strong>Upload image</strong></h4>
                                    <h4>
                                        <small>
                                            <asp:Label runat="server" ID="imagefront" Text="Front"></asp:Label>
                                            <asp:FileUpload runat="server" ID="fileupload" />
                                            <asp:Label runat="server" ID="imageBack" Text="Back"></asp:Label>
                                            <asp:FileUpload runat="server" ID="fileupload1" />
                                        </small>

                                    </h4>
                                </div>
                                <div class="col-xs-3">
                                    <div class="col-xs-2 text-right">
                                        <h6><strong>
                                            <asp:Label runat="server" ID="lblprice"></asp:Label><span class="text-muted">x</span></strong></h6>
                                    </div>
                                    <div class="col-xs-1">
                                        <asp:TextBox runat="server" ID="txtQuantity" TextMode="Number"></asp:TextBox>

                                    </div>
                                </div>

                            </div>
                            <hr>

                            <div class="row">
                                <div class="text-center">
                                    <div class="col-xs-9">
                                        <asp:GridView CssClass="table table-striped responsive-table" ID="gvCart" runat="server" AutoGenerateColumns="False" EmptyDataText="There is no data records to display" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvCart_PageIndexChanging">

                                            <Columns>
                                                <asp:BoundField DataField="orderid" HeaderText="ORDER ID." />
                                                <asp:BoundField DataField="product_type" HeaderText="PRODUCT TYPE" />
                                                <asp:BoundField DataField="product_name" HeaderText="PRODUCT NAME" />
                                                <asp:BoundField DataField="quantity" HeaderText="QUANTITY" />
                                                <asp:BoundField DataField="subtotal" HeaderText="SUB TOTAL" />
                                                <asp:TemplateField HeaderText="DESIGN">
                                                    <ItemTemplate>
                                                        <asp:Image runat="server" ID="imgDesign" ImageUrl='<%#Eval("image_f")%>' CssClass="img-responsive" Height="100px" Width="100px" />
                                                        <asp:Image runat="server" ID="Image2" ImageUrl='<%#Eval("image_b")%>' CssClass="img-responsive" Height="100px" Width="100px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete" ShowHeader="true">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkCatDel" OnClientClick="if (!confirm('Do you want to delete this product type?')) return false;" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons" style="font-size: 1.50em;">&#xE872;</i></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <div class="col-xs-3">
                                        <asp:Button CausesValidation="true" ValidationGroup="cart" OnClick="btnUpdateCart_Click" runat="server" ID="btnUpdateCart" Text="Add" class="btn btn-default btn-sm btn-block" />

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="panel-footer">
                            <div class="row text-center">
                                <div class="col-xs-9">
                                    <h4 class="text-right">Total:  <strong>
                                        <asp:Label runat="server" ID="lbltotal"></asp:Label></strong></h4>
                                </div>
                                <div class="col-xs-3">
                                    <asp:Button OnClientClick="if (!confirm('Are you sure to proceed to checkout??')) return false;" OnClick="btnCheckout_Click" runat="server" ID="btnCheckout" CssClass="btn btn-success btn-block" Text="Checkout" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="container-fluid" runat="server" id="divSummary" visible="false">
            <h3>Order Summary</h3>
            <div class="container-fluid">
                <table class="table-responsive">
                    <tr>
                        <th>Order ID</th>
                        <th>Product Type</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Sub Total</th>
                        <th>Design</th>
                    </tr>
                    <asp:Repeater runat="server" ID="rptrSummary">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("orderid")%></td>
                                <td><%#Eval("product_type")%></td>
                                <td><%#Eval("product_name")%></td>
                                <td><%#Eval("quantity")%></td>
                                <td><%#Eval("subtotal")%></td>
                                <td>
                                    <asp:Image runat="server" ID="imgImage" ImageUrl='<%#Eval("image_f")%>' Width="100px" Height="100px" />
                                    <asp:Image runat="server" ID="Image1" ImageUrl='<%#Eval("image_b")%>' Width="100px" Height="100px" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <h4>Total: &nbsp;<small><asp:Label runat="server" ID="lblSummaryTotal"></asp:Label></small></h4>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <asp:Button OnClick="btnback_Click" runat="server" ID="btnback" Text="Back" />

                </div>
                <div class="col-md-6">
                    <asp:Button OnClick="btnProceed_Click" runat="server" ID="btnProceed" Text="Proceed" />
                </div>
            </div>

        </div>
        <div class="container-fluid" runat="server" id="divForm" visible="false">
            <h3>Order Form</h3>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="form" ForeColor="Red" Font-Bold="true" ShowSummary="true" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtaddress" runat="server" ErrorMessage="address is required" ValidationGroup="form" Display="None"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtemail" runat="server" ErrorMessage="email is required" ValidationGroup="form" Display="None"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtcon" runat="server" ErrorMessage="contact number is required" ValidationGroup="form" Display="None"></asp:RequiredFieldValidator>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtdateneed" runat="server" ErrorMessage="Date needed is required" ValidationGroup="form" Display="None"></asp:RequiredFieldValidator>

            <div class="container-fluid">
                <p>
                    <strong>Address: &nbsp;</strong>
                    <asp:TextBox runat="server" ID="txtaddress" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                </p>
                <p>
                    <strong>Email Address: &nbsp;</strong>
                    <asp:TextBox runat="server" ID="txtemail" TextMode="Email" CssClass="form-control"></asp:TextBox>
                </p>
                <p>
                    <strong>Contact Number: &nbsp;</strong>
                    <asp:TextBox runat="server" ID="txtcon" TextMode="Number" CssClass="form-control"></asp:TextBox>
                </p>
                <p>
                    <strong>Order type: &nbsp;</strong>
                    <asp:DropDownList runat="server" ID="ddlorderType" CssClass="form-control">
                        <asp:ListItem Text="Rush" Value="Rush"></asp:ListItem>
                        <asp:ListItem Text="Regular" Value="Regular"></asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    <strong>Date Needed: &nbsp;</strong>
                    <asp:TextBox runat="server" ID="txtdateneed" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </p>
                <p>
                    <strong>Shipment Method: &nbsp;</strong>
                    <asp:DropDownList runat="server" ID="ddlship" CssClass="form-control">
                        <asp:ListItem Text="PICK UP" Value="PICK UP"></asp:ListItem>
                        <asp:ListItem Text="DELIVERY" Value="DELIVERY"></asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    <strong>Payment Method: &nbsp;</strong>
                    <asp:DropDownList runat="server" ID="ddlMethod" CssClass="form-control">
                        <asp:ListItem Text="BANK" Value="BANK"></asp:ListItem>
                        <asp:ListItem Text="MEETUP" Value="MEETUP"></asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    <strong>Remarks: &nbsp;</strong>
                    <asp:TextBox runat="server" ID="txtRemark" CssClass="form-control"></asp:TextBox>
                </p>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <asp:Button OnClick="btnFormBack_Click" runat="server" ID="btnFormBack" Text="Back" />
                </div>
                <div class="col-md-6">
                    <asp:Button CausesValidation="true" ValidationGroup="form" OnClick="btnSubmit_Click" runat="server" ID="btnSubmit" Text="Submit" />
                </div>
            </div>

        </div>
        <div class="container-fluid" id="divfinalstep" runat="server" visible="false">
            <h3>Summary</h3>
            <div class="container-fluid">
                <strong>Customer Information</strong>
                <p>First Name:&nbsp;<asp:Label runat="server" ID="lblfirstname"></asp:Label></p>
                <p>Last Name:&nbsp;<asp:Label runat="server" ID="lbllastname"></asp:Label></p>
                <p>Address:&nbsp;<asp:Label runat="server" ID="lbladdress"></asp:Label></p>
                <p>Email Address:&nbsp;<asp:Label runat="server" ID="lblemail"></asp:Label></p>
                <p>Contact Number:&nbsp;<asp:Label runat="server" ID="lblcon"></asp:Label></p>
                <p>Order Type:&nbsp;<asp:Label runat="server" ID="lblordertype"></asp:Label></p>
                <p>Order Needed Date:&nbsp;<asp:Label runat="server" ID="lbldateneed"></asp:Label></p>
                <p>Mode of Shipment:&nbsp;<asp:Label runat="server" ID="lblship"></asp:Label></p>
                <p>Mode of Payment:&nbsp;<asp:Label runat="server" ID="lblpay"></asp:Label></p>
                <p>Remarks:&nbsp;<asp:Label runat="server" ID="lblrem"></asp:Label></p>
                <hr />
                <strong>Order Information</strong>
                <table class="table-responsive">
                    <tr>
                        <th>Order ID</th>
                        <th>Product Type</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Sub Total</th>
                        <th>Design</th>
                    </tr>
                    <asp:Repeater runat="server" ID="rptrSummaryFinal">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("orderid")%></td>
                                <td><%#Eval("product_type")%></td>
                                <td><%#Eval("product_name")%></td>
                                <td><%#Eval("quantity")%></td>
                                <td><%#Eval("subtotal")%></td>
                                <td>
                                    <asp:Image runat="server" ID="imgImage" ImageUrl='<%#Eval("image_f")%>' Width="100px" Height="100px" />
                                    <asp:Image runat="server" ID="Image1" ImageUrl='<%#Eval("image_b")%>' Width="100px" Height="100px" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <asp:Button runat="server" OnClick="Button1_Click" ID="Button1" Text="Back" />
                </div>
                <div class="col-md-6">
                    <asp:Button runat="server" OnClientClick="if (!confirm('Are you sure to submit?')) return false;" ID="Button2" OnClick="Button2_Click" Text="Submit" />
                </div>
            </div>
        </div>
    </form>
</body>


</html>
