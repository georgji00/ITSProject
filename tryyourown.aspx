<%@ Page Language="VB" AutoEventWireup="false" CodeFile="tryyourown.aspx.vb" Inherits="tryyourown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>TShirt Editor</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!--[if IE]><script type="text/javascript" src="js/excanvas.js"></script><![endif]-->


    <link href='https://fonts.googleapis.com/css?family=Satisfy' rel='stylesheet' />
    <%--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	--%>
    <script type="text/javascript" src="js/fabric.min.js"></script>
    <script src="script/bootstrap.min.js"></script>
    <script src="script/jquery.min.js"></script>
   
    <!-- Le styles -->
    <link type="text/css" rel="stylesheet" href="css/jquery.miniColors.css" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-glyphicons.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Satisfy' rel='stylesheet' />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstraps.min.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet" />

    <link href="css/style.css" rel="stylesheet" />
    <link href="css/Payment.css" rel="stylesheet" />
    <script type="text/javascript">
    </script>
    <style type="text/css">
        .footer {
            padding: 70px 0;
            margin-top: 70px;
            border-top: 1px solid #E5E5E5;
            background-color: whiteSmoke;
        }

        body {
            padding-top: 60px;
        }

        .color-preview {
            border: 1px solid #CCC;
            margin: 2px;
            zoom: 1;
            vertical-align: top;
            cursor: pointer;
            overflow: hidden;
            width: 20px;
            height: 20px;
        }

        .rotate {
            -webkit-transform: rotate(90deg);
            -moz-transform: rotate(90deg);
            -o-transform: rotate(90deg);
            /* filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=1.5); */
            -ms-transform: rotate(90deg);
        }

        .Arial {
            font-family: "Arial";
        }

        .Helvetica {
            font-family: "Helvetica";
        }

        .MyriadPro {
            font-family: "Myriad Pro";
        }

        .Delicious {
            font-family: "Delicious";
        }

        .Verdana {
            font-family: "Verdana";
        }

        .Georgia {
            font-family: "Georgia";
        }

        .Courier {
            font-family: "Courier";
        }

        .ComicSansMS {
            font-family: "Comic Sans MS";
        }

        .Impact {
            font-family: "Impact";
        }

        .Monaco {
            font-family: "Monaco";
        }

        .Optima {
            font-family: "Optima";
        }

        .HoeflerText {
            font-family: "Hoefler Text";
        }

        .Plaster {
            font-family: "Plaster";
        }

        .Engagement {
            font-family: "Engagement";
        }
    </style>
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
                        <img src="img/logo.png" height="10" width="100" /></a>
                </div>

                <!--Menu Itens-->
                <div class="collapse nav navbar-collapse" id="MainMenu">
                    <ul class="nav navbar-nav">
                        <li><a href="home.aspx">Home</a></li>
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
                        <li class="active"><a href="tryyourown.aspx">Try Your Own</a></li>
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
                </div>
            </div>
        </nav>

        <div class="container">
            <section id="typography">
                <div class="page-header">
                    <h1 style="color: #2fa4e7;">Customize T-Shirt</h1>
                </div>

                <!-- Headings & Paragraph Copy -->
                <div class="row">
                    <div class="span3">

                        <div class="tabbable">
                            <!-- Only required for left/right tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">T-Shirt Options</a></li>
                                <li><a href="#tab2" data-toggle="tab">Design</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="well">
                                        <!--					      	<h3>Tee Styles</h3>-->
                                        <!--						      <p>-->
                                        <select id="tshirttype">
                                            <option value="" selected="selected">-- Select Shirt Type --</option>
                                            <option value="img/crew_front.png">Short Sleeve Shirts</option>
                                            <option value="img/mens_longsleeve_front.png">Long Sleeve Shirts</option>
                                            <option value="img/mens_hoodie_front.png">Hoodies</option>
                                            <option value="img/mens_tank_front.png">Tank tops</option>
                                        </select>
                                        <!--						      </p>-->
                                    </div>
                                    <div class="well">
                                        <ul class="nav">
                                            <li class="color-preview" title="White" style="background-color: #ffffff;"></li>
                                            <li class="color-preview" title="Dark Heather" style="background-color: #616161;"></li>
                                            <li class="color-preview" title="Gray" style="background-color: #f0f0f0;"></li>
                                            <li class="color-preview" title="Charcoal" style="background-color: #5b5b5b;"></li>
                                            <li class="color-preview" title="Black" style="background-color: #222222;"></li>
                                            <li class="color-preview" title="Heather Orange" style="background-color: #fc8d74;"></li>
                                            <li class="color-preview" title="Heather Dark Chocolate" style="background-color: #432d26;"></li>
                                            <li class="color-preview" title="Salmon" style="background-color: #eead91;"></li>
                                            <li class="color-preview" title="Chesnut" style="background-color: #806355;"></li>
                                            <li class="color-preview" title="Dark Chocolate" style="background-color: #382d21;"></li>
                                            <li class="color-preview" title="Citrus Yellow" style="background-color: #faef93;"></li>
                                            <li class="color-preview" title="Avocado" style="background-color: #aeba5e;"></li>
                                            <li class="color-preview" title="Kiwi" style="background-color: #8aa140;"></li>
                                            <li class="color-preview" title="Irish Green" style="background-color: #1f6522;"></li>
                                            <li class="color-preview" title="Scrub Green" style="background-color: #13afa2;"></li>
                                            <li class="color-preview" title="Teal Ice" style="background-color: #b8d5d7;"></li>
                                            <li class="color-preview" title="Heather Sapphire" style="background-color: #15aeda;"></li>
                                            <li class="color-preview" title="Sky" style="background-color: #a5def8;"></li>
                                            <li class="color-preview" title="Antique Sapphire" style="background-color: #0f77c0;"></li>
                                            <li class="color-preview" title="Heather Navy" style="background-color: #3469b7;"></li>
                                            <li class="color-preview" title="Cherry Red" style="background-color: #c50404;"></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab2">
                                    <div class="well">
                                        <div class="input-append">
                                            <input class="span2" id="text-string" type="text" placeholder="add text here..." />
                                            <button id="add-text" class="btn" title="Add text"><i class="icon-share-alt"></i></button>
                                            <hr />
                                        </div>
                                        <div id="avatarlist">
                                            <img style="cursor: pointer;" class="img-polaroid" src="img/pikachu.png" height="100" width="100" />
                                            <img style="cursor: pointer;" class="img-polaroid" src="img/husky.png" height="100" width="100" />
                                            <img style="cursor: pointer;" class="img-polaroid" src="img/rose.png" height="100" width="100" />
                                            <img style="cursor: pointer;" class="img-polaroid" src="img/pony.png" height="100" width="100" />
                                            <img style="cursor: pointer;" class="img-polaroid" src="img/mr.png" height="100" width="100" />
                                            <img style="cursor: pointer;" class="img-polaroid" src="img/love.png" height="100" width="100" />
                                        </div>
                                        <div>
                                            <hr />

                                            <input type="file" id="file" name="fileToUpload" />

                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="span6">
                        <div style="min-height: 32px;">
                            <div class="clearfix">
                                <div class="btn-group inline pull-left" id="texteditor" style="display: none">
                                    <button id="font-family" class="btn dropdown-toggle" data-toggle="dropdown" title="Font Style"><i class="icon-font" style="width: 19px; height: 19px;"></i></button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="font-family-X">
                                        <li><a tabindex="-1" href="#" onclick="setFont('Arial');" class="Arial">Arial</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Helvetica');" class="Helvetica">Helvetica</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Myriad Pro');" class="MyriadPro">Myriad Pro</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Delicious');" class="Delicious">Delicious</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Verdana');" class="Verdana">Verdana</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Georgia');" class="Georgia">Georgia</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Courier');" class="Courier">Courier</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Comic Sans MS');" class="ComicSansMS">Comic Sans MS</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Impact');" class="Impact">Impact</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Monaco');" class="Monaco">Monaco</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Optima');" class="Optima">Optima</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Hoefler Text');" class="Hoefler Text">Hoefler Text</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Plaster');" class="Plaster">Plaster</a></li>
                                        <li><a tabindex="-1" href="#" onclick="setFont('Engagement');" class="Engagement">Engagement</a></li>
                                    </ul>
                                    <button id="text-bold" class="btn" data-original-title="Bold">
                                        <img src="img/font_bold.png" height="" width=""></button>
                                    <button id="text-italic" class="btn" data-original-title="Italic">
                                        <img src="img/font_italic.png" height="" width=""></button>
                                    <button id="text-strike" class="btn" title="Strike" style="">
                                        <img src="img/font_strikethrough.png" height="" width=""></button>
                                    <button id="text-underline" class="btn" title="Underline" style="">
                                        <img src="img/font_underline.png"></button>
                                    <a class="btn" href="#" rel="tooltip" data-original-title="Font Color">
                                        <input type="hidden" id="text-fontcolor" class="color-picker" size="7" value="#000000" style="back"></a>
                                    <a class="btn" href="#" rel="tooltip" data-original-title="Font Border Color">
                                        <input type="hidden" id="text-strokecolor" class="color-picker" size="7" value="#000000"></a>
                                    <!--- Background <input type="hidden" id="text-bgcolor" class="color-picker" size="7" value="#ffffff"> --->
                                </div>
                                <div class="pull-right" align="" id="imageeditor" style="display: none">
                                    <div class="btn-group">
                                        <button class="btn" id="bring-to-front"><i class="icon-fast-backward rotate" style="height: 19px;"></i></button>
                                        <button class="btn" id="send-to-back"><i class="icon-fast-forward rotate" style="height: 19px;"></i></button>
                                        <button id="flip" type="button" class="btn" title="Show Back View"><i class="icon-retweet" style="height: 19px;"></i></button>
                                        <button id="remove-selected" class="btn" title="Delete selected item"><i class="icon-trash" style="height: 19px;"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--	EDITOR      -->
                        <button id="flipback" type="button" class="btn" title="Rotate View"><i class="icon-retweet" style="height: 19px;"></i></button>
                        
                        <div id="shirtDiv" class="page" style="width: 530px; height: 630px; position: relative; background-color: rgb(255, 255, 255);">
                            <canvas id="tcanvas" width="530" height="630" style="-webkit-user-select: none;"></canvas>
                        </div>
                        <!--					<div id="shirtBack" class="page" style="width: 530px; height: 630px; position: relative; background-color: rgb(255, 255, 255); display:none;">-->
                        <!--						<img src="img/crew_back.png"></img>-->
                        <!--						<div id="drawingArea" style="position: absolute;top: 100px;left: 160px;z-index: 10;width: 200px;height: 400px;">					-->
                        <!--							<canvas id="backCanvas" width=200 height="400" class="hover" style="-webkit-user-select: none;"></canvas>-->
                        <!--						</div>-->
                        <!--					</div>						-->

                        <!--	/EDITOR		-->
                    </div>

                    <div class="span2	">
                        <div class="well">
                            <h3 style="color: #2fa4e7;">Sizes</h3>
                            <p>
                                <table class="table">
                                    <tr>
                                        <td>
                                            <input type="checkbox">&emsp;S</td>
                                        <td align="right">
                                            <input min="0" style="width: 40px;" value="1" type="number"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox">&emsp;M</td>
                                        <td align="right">
                                            <input min="0" style="width: 40px;" placeholder="1" type="number"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox">&emsp;L</td>
                                        <td align="right">
                                            <input min="0" style="width: 40px;" placeholder="1" type="number"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox">&emsp;XL</td>
                                        <td align="right">
                                            <input min="0" style="width: 40px;" placeholder="1" type="number"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox">&emsp;XXL</td>
                                        <td align="right">
                                            <input min="0" style="width: 40px;" placeholder="1" type="number"></td>
                                    </tr>
                                </table>
                            </p>
                            <asp:Button runat="server" OnClick="btnAddtoCart_Click" ID="btnAddtoCart" class="btn btn-large btn-block btn-success" Text="Proceed to cart" />
                           <button runat="server" type="button" class="btn btn-large btn-block btn-success" onclick="addimage()" id="add">SAVE</button>
                        </div>
                    </div>

                </div>

            </section>
        </div>
        <div runat="server" id="preview" class="container-fluid">
            <h3>PREVIEW</h3>
            <asp:Label runat="server" ID="hidden" Text="wala pa po"></asp:Label>
        </div>
        <!-- /container -->

        <!-- Footer ================================================== -->
        <script>

            $(document).ready(function () {

                $("#tshirttype").change(function () {
                    $("img[name=tshirtview]").attr("src", $(this).val());

                });
            });
        </script>
        <!-- Le javascript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script type="text/javascript" lang="javascript">

            var canvas = document.getElementById('tcanvas');

            var name;
            var colorimage;

            $('.color-preview').click(function () {
                var color = $(this).css("background-color");
                colorimage = $(this).css("background-color");
                document.getElementById("shirtDiv").style.backgroundColor = color;
            });

            function addimage() {

                if (name === 'front') {
                    $("#front").remove();
                } else if (name === 'back') {
                    $("#back").remove();
                }
                var image = document.createElement("img");

                image.id = name;
                image.name = name;
                image.src = canvas.toDataURL('image/png');
                image.runat = "server";
                image.style.backgroundColor = colorimage;
                document.getElementById('preview').appendChild(image);              
               
               
            };



            var valueSelect = $("#tshirttype").val();
            $("#tshirttype").change(function () {
                valueSelect = $(this).val();
                canvas.setBackgroundImage(valueSelect);
                name = 'front';
            });
            $('#flipback').click(

               function () {
                   if (valueSelect === "img/crew_front.png") {
                       if ($(this).attr("data-original-title") == "Show Back View") {
                           $(this).attr('data-original-title', 'Show Front View');
                           $("#tshirtFacing").attr("src", "img/crew_back.png");
                           name = 'back';
                           canvas.setBackgroundImage("img/crew_back.png");
                           a = JSON.stringify(canvas);
                           canvas.clear();
                           try {
                               var json = JSON.parse(b);
                               canvas.loadFromJSON(b);
                           }
                           catch (e)
                           { }

                       } else {
                           $(this).attr('data-original-title', 'Show Back View');
                           $("#tshirtFacing").attr("src", "img/crew_front.png");
                           name = 'front';
                           canvas.setBackgroundImage("img/crew_front.png");
                           b = JSON.stringify(canvas);
                           canvas.clear();
                           try {
                               var json = JSON.parse(a);
                               canvas.loadFromJSON(a);

                           }
                           catch (e)
                           { }

                       }

                   }

                   else if (valueSelect === "img/mens_longsleeve_front.png") {
                       if ($(this).attr("data-original-title") == "Show Back View") {
                           $(this).attr('data-original-title', 'Show Front View');
                           $("#tshirtFacing").attr("src", "img/mens_longsleeve_back.png");
                           name = 'back';
                           canvas.setBackgroundImage("img/mens_longsleeve_back.png");
                           a = JSON.stringify(canvas);
                           canvas.clear();
                           try {
                               var json = JSON.parse(b);
                               canvas.loadFromJSON(b);
                           }
                           catch (e)
                           { }

                       } else {
                           $(this).attr('data-original-title', 'Show Back View');
                           $("#tshirtFacing").attr("src", "img/mens_longsleeve_front.png");
                           name = 'front';
                           canvas.setBackgroundImage("img/mens_longsleeve_front.png");
                           b = JSON.stringify(canvas);
                           canvas.clear();
                           try {
                               var json = JSON.parse(a);
                               canvas.loadFromJSON(a);
                           }
                           catch (e)
                           { }

                       }
                   }
                   else if (valueSelect === "img/mens_tank_front.png") {
                       if ($(this).attr("data-original-title") == "Show Back View") {
                           $(this).attr('data-original-title', 'Show Front View');
                           $("#tshirtFacing").attr("src", "img/mens_tank_back.png");
                           name = 'back';
                           canvas.setBackgroundImage("img/mens_tank_back.png");
                           a = JSON.stringify(canvas);
                           canvas.clear();
                           try {
                               var json = JSON.parse(b);
                               canvas.loadFromJSON(b);
                           }
                           catch (e)
                           { }

                       } else {
                           $(this).attr('data-original-title', 'Show Back View');
                           $("#tshirtFacing").attr("src", "img/mens_tank_front.png");
                           name = 'front';
                           canvas.setBackgroundImage("img/mens_tank_front.png");
                           b = JSON.stringify(canvas);
                           canvas.clear();
                           try {
                               var json = JSON.parse(a);
                               canvas.loadFromJSON(a);
                           }
                           catch (e)
                           { }

                       }
                   }
                   else if (valueSelect === "img/mens_hoodie_front.png") {
                       if ($(this).attr("data-original-title") == "Show Back View") {
                           $(this).attr('data-original-title', 'Show Front View');
                           $("#tshirtFacing").attr("src", "img/mens_hoodie_back.png");
                           name = 'back';
                           canvas.setBackgroundImage("img/mens_hoodie_back.png");
                           a = JSON.stringify(canvas);
                           canvas.clear();
                           try {
                               var json = JSON.parse(b);
                               canvas.loadFromJSON(b);
                           }
                           catch (e)
                           { }

                       } else {
                           $(this).attr('data-original-title', 'Show Back View');
                           $("#tshirtFacing").attr("src", "img/mens_hoodie_front.png");
                           name = 'front';
                           canvas.setBackgroundImage("img/mens_hoodie_front.png");
                           b = JSON.stringify(canvas);
                           canvas.clear();

                           try {
                               var json = JSON.parse(a);
                               canvas.loadFromJSON(a);

                           }
                           catch (e)
                           { }

                       }
                   }
                   /*	if ($(this).attr("data-original-title") == "Show Back View") {
                        $(this).attr('data-original-title', 'Show Front View');			        		       
                        $("#tshirtFacing").attr("src","img/crew_back.png");			        
                        a = JSON.stringify(canvas);
                        canvas.clear();
                        try
                        {
                           var json = JSON.parse(b);
                           canvas.loadFromJSON(b);
                        }
                        catch(e)
                        {}
                        
                    } else {
                        $(this).attr('data-original-title', 'Show Back View');			    				    	
                        $("#tshirtFacing").attr("src","img/crew_front.png");			    	
                        b = JSON.stringify(canvas);
                        canvas.clear();
                        try
                        {
                           var json = JSON.parse(a);
                           canvas.loadFromJSON(a);			           
                        }
                        catch(e)
                        {}
                    }		*/
                   canvas.renderAll();
                   setTimeout(function () {
                       canvas.calcOffset();
                   }, 200);
               });
        </script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/tshirtEditor.js"></script>
        <script type="text/javascript" src="js/jquery.miniColors.min.js"></script>
        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-35639689-1']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();

        </script>
        <div class="row">
            <div class="col-md-12">
                <!-- Footer -->
                <footer class="page-footer font-small teal pt-4">

                    <!-- Footer Text -->
                    <div class="container-fluid text-center text-md-left">

                        <!-- Grid row -->
                        <div class="row">
                            <h3 class="text-uppercase font-weight-bold text-center">PAPAPRINT OPERATION</h3>
                            <!-- Grid column -->
                            <div class="col-md-6">

                                <!-- Content -->

                                <h4>Email</h4>
                                <p>jane.perez@yahoo.com</p>
                                <p>jane.perez@gmail.com</p>

                            </div>
                            <!-- Grid column -->



                            <!-- Grid column -->

                            <div class="col-md-6">

                                <!-- Content -->
                                <h5 class="text-uppercase font-weight-bold"></h5>
                                <h4>Contact Number</h4>
                                <p>+639499302306</p>
                                <p>+639064152841</p>
                            </div>
                            <!-- Grid column -->

                        </div>
                        <!-- Grid row -->

                    </div>
                    <!-- Footer Text -->

                    <!-- Copyright -->
                    <div class="footer-copyright text-center py-3">
                        © 2018 Copyright:
		           <a href="https://www.facebook.com/photo.php?fbid=435159890228244&set=a.104485173295719&type=3&theater">Papaprint.com</a>
                    </div>
                    <!-- Copyright -->

                </footer>
                <!-- Footer -->

            </div>
        </div>
    </form>
</body>
</html>
