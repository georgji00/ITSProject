Imports System
Imports System.Data
Imports System.IO
Imports System.Configuration
Imports System.Collections
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Xml.Linq
Imports MySql.Data.MySqlClient
Partial Class cart
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection("data source=localhost;database=db_papaprint;userid=root;password=0000")
    Dim cmd As New MySqlCommand
    Dim da As New MySqlDataAdapter
    Dim code, username, password, role As String
    Dim orderid As Integer

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try

                If Session("login") = "true" Then

                Else
                    Response.Redirect("backend/public/login.aspx")
                End If


                Dim cart As New DataTable
                cart.Columns.AddRange(New DataColumn(6) {New DataColumn("orderid"), New DataColumn("product_type"), New DataColumn("product_name"), New DataColumn("image_f"), New DataColumn("quantity"), New DataColumn("subtotal", GetType(Integer)), New DataColumn("image_b")})
                ViewState("cart") = cart
                bindCart()
                orderid = 1

                bindtype()
                bindportmenu()

            Catch ex As Exception

            End Try
        End If

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        Dim fname, lname, userid As String
        con.Close()
        code = "select * from tbl_user where user_username='" + Session("username") + "'"
        con.Open()
        cmd = New MySqlCommand(code, con)
        Dim dr As MySqlDataReader
        dr = cmd.ExecuteReader
        While dr.Read
            userid = dr("user_id").ToString
            fname = dr("user_firstname").ToString
            lname = dr("user_lastname").ToString
        End While
        dr.Close()
        con.Close()

        divfinalstep.Visible = True
        divForm.Visible = False
        rptrSummaryFinal.DataSource = DirectCast(ViewState("cart"), DataTable)
        rptrSummaryFinal.DataBind()
        lblfirstname.Text = fname
        lbllastname.Text = lname
        lbladdress.Text = txtaddress.Text
        lblemail.Text = txtemail.Text
        lblcon.Text = txtcon.Text
        lblordertype.Text = ddlorderType.SelectedValue
        lbldateneed.Text = txtdateneed.Text
        lblship.Text = ddlship.SelectedValue
        lblpay.Text = ddlMethod.SelectedValue
        lblrem.Text = txtRemark.Text

    End Sub
    Private Sub bindtype()

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim cons As New MySqlConnection(constr)
        Dim cmd As New MySqlCommand("select * from tbl_product")
        Dim sda As New MySqlDataAdapter()
        cmd.Connection = cons
        sda.SelectCommand = cmd
        Using dt As New DataTable()
            sda.Fill(dt)
            ddlprodType.DataSource = dt
            ddlprodType.DataTextField = "product_type"
            ddlprodType.DataValueField = "product_type"
            ddlprodType.DataBind()
        End Using
        ddlprodType.Items.Insert(0, New ListItem("", ""))
        ddlprodType.SelectedIndex = 0

    End Sub
    Private Sub bindname()

        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim cons As New MySqlConnection(constr)
        Dim cmd As New MySqlCommand("select * from tbl_price where product_type='" + ddlprodType.SelectedValue + "'")
        Dim sda As New MySqlDataAdapter()
        cmd.Connection = cons
        sda.SelectCommand = cmd
        Using dt As New DataTable()
            sda.Fill(dt)
            ddlprodname.DataSource = dt
            ddlprodname.DataTextField = "description"
            ddlprodname.DataValueField = "price_id"
            ddlprodname.DataBind()
        End Using
        ddlprodname.Items.Insert(0, New ListItem("", ""))
        ddlprodname.SelectedIndex = 0

    End Sub
    Private Sub bindCart()

        gvCart.DataSource = DirectCast(ViewState("cart"), DataTable)
        gvCart.DataBind()

       
    End Sub

    Private Sub bindportmenu()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using cons As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("select * from tbl_portfolio_cat")

                Using sda As New MySqlDataAdapter()
                    cmd.Connection = cons
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        rptrPort.DataSource = dt
                        rptrPort.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Protected Sub lnkPort_Click(sender As Object, e As EventArgs)
        Dim button As LinkButton = sender
        Dim buttonID = button.Text
        Session("portforlio") = buttonID
        Response.Redirect("portfolio.aspx")
    End Sub

    Protected Sub btnUpdateCart_Click(sender As Object, e As EventArgs)
        orderid = +1
        Dim fn As String = Path.GetFileName(fileupload.PostedFile.FileName)
       
        Dim fn1 As String = Path.GetFileName(fileupload1.PostedFile.FileName)


        If fn = Nothing Or (fn = Nothing And fn1 = Nothing) Then
            ClientScript.RegisterStartupScript(Me.GetType(), "myalert", "alert('please upload your design');", True)
        Else
            fileupload.PostedFile.SaveAs(Server.MapPath("/images/") + fn)
            fileupload1.PostedFile.SaveAs(Server.MapPath("/images/") + fn1)
            Dim total As Integer
            total = Convert.ToInt32(lblprice.Text) * Convert.ToInt32(txtQuantity.Text)
            Dim images As String = "/images/" + fn
            Dim images1 As String = "/images/" + fn1

            Dim adddata As DataTable = DirectCast(ViewState("cart"), DataTable)
            adddata.Rows.Add(orderid, ddlprodType.SelectedItem.Text, ddlprodname.SelectedItem.Text, images, txtQuantity.Text, total, images1)
            ViewState("cart") = adddata
            bindCart()
            Dim sumdata As DataTable = DirectCast(ViewState("cart"), DataTable)
            Dim sum As Integer = Convert.ToInt32(sumdata.Compute("SUM(subtotal)", String.Empty))
            lbltotal.Text = sum
        End If
       
    End Sub
    Protected Sub gvCart_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvCart.PageIndex = e.NewPageIndex
        bindCart()
    End Sub
    Protected Sub gvCart_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles gvCart.RowDeleting
        Try
            con.Close()
            Dim id = Convert.ToInt32(gvCart.Rows(e.RowIndex).Cells(0).Text)


            Dim adddata As DataTable = DirectCast(ViewState("cart"), DataTable)
            adddata.Rows.RemoveAt(e.RowIndex)
            ViewState("servBook") = adddata
            bindCart()
            ClientScript.RegisterStartupScript(Me.GetType(), "myalert", "alert('report successfull deleted');", True)
        Catch ex As Exception
            con.Close()
        End Try

    End Sub

    Protected Sub ddlprodname_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlprodname.SelectedIndexChanged

        con.Close()

        code = "select * from tbl_price where price_id ='" + ddlprodname.SelectedValue + "'"
        con.Open()
        cmd = New MySqlCommand(code, con)
        Dim dr As MySqlDataReader
        dr = cmd.ExecuteReader
        While dr.Read
            lblprice.Text = dr("price").ToString
        End While
        dr.Close()
        con.Close()


    End Sub

    Protected Sub ddlprodType_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlprodType.SelectedIndexChanged
        bindname()
        ddlprodname.Enabled = True
    End Sub

    Protected Sub btnCheckout_Click(sender As Object, e As EventArgs)
        divSummary.Visible = True
        divCart.Visible = False
        lblSummaryTotal.Text = lbltotal.Text
        rptrSummary.DataSource = DirectCast(ViewState("cart"), DataTable)
        rptrSummary.DataBind()
    End Sub

    Protected Sub btnback_Click(sender As Object, e As EventArgs)
        divSummary.Visible = False
        divCart.Visible = True
    End Sub

    Protected Sub btnProceed_Click(sender As Object, e As EventArgs)
        divSummary.Visible = False
        divCart.Visible = False
        divForm.Visible = True
    End Sub

  

    Protected Sub btnFormBack_Click(sender As Object, e As EventArgs)
        divForm.Visible = False
        divCart.Visible = False
        divSummary.Visible = True
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Dim fname, lname, userid As String
        con.Close()
        code = "select * from tbl_user where user_username='" + Session("username") + "'"
        con.Open()
        cmd = New MySqlCommand(code, con)
        Dim dr As MySqlDataReader
        dr = cmd.ExecuteReader
        While dr.Read
            userid = dr("user_id").ToString
            fname = dr("user_firstname").ToString
            lname = dr("user_lastname").ToString
        End While
        dr.Close()
        con.Close()


        Dim adddata As DataTable = DirectCast(ViewState("cart"), DataTable)
        ViewState("cart") = adddata
        Dim prodtype, prodname, quantity, subtotal, imagef, imageb As String
        For index = 0 To (adddata.Rows.Count - 1)
            prodtype = adddata.Rows(index).Item(1).ToString
            prodname = adddata.Rows(index).Item(2).ToString
            quantity = adddata.Rows(index).Item(4).ToString
            subtotal = adddata.Rows(index).Item(5).ToString
            imagef = adddata.Rows(index).Item(3).ToString
            imageb = adddata.Rows(index).Item(6).ToString

            con.Close()
            Dim dateformat As Date
            dateformat = Convert.ToDateTime(txtdateneed.Text)
            code = "insert into tbl_order(order_userid,order_fname,order_lname,order_address,order_email,order_contact,order_type,order_date,order_date_needed,order_shipment,order_payment,order_remarks,order_prodtype,order_prodname,order_quantity,order_subtotal,order_design_front,order_design_back)values('" + userid + "' , '" + fname + "' ,'" + lname + "' ,'" + txtaddress.Text + "' ,'" + txtemail.Text + "' ,'" + txtcon.Text + "' ,'" + ddlorderType.SelectedValue + "' ,'" + Date.Now.ToString("yyyy-MM-dd") + "' ,'" + lbldateneed.Text + "' ,'" + ddlship.SelectedValue + "' ,'" + ddlMethod.SelectedValue + "' ,'" + txtRemark.Text + "' , '" + prodtype + "' ,'" + prodname + "' ,'" + quantity + "' ,'" + subtotal + "' ,'" + imagef + "' ,'" + imageb + "')"
            con.Open()
            cmd = New MySqlCommand(code, con)
            cmd.ExecuteNonQuery()
            con.Close()
            ClientScript.RegisterStartupScript(Me.GetType(), "myalert", "alert('successfull');", True)
            Response.Redirect("home.aspx")

        Next
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        divForm.Visible = False
        divSummary.Visible = True
       
    End Sub
End Class
