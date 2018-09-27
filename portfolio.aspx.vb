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
Partial Class portfolio
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection("data source=localhost;database=db_papaprint;userid=root;password=0000")
    Dim cmd As New MySqlCommand
    Dim da As New MySqlDataAdapter
    Dim code, username, password, role As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try

                lblHeader.Text = Session("portforlio")
                bindportmenu()
                bindimage()

                If Session("login") = "true" Then
                    liCart.Visible = True
                    lilogin.Visible = False
                    liLogout.Visible = True
                Else
                    liLogout.Visible = False
                    lilogin.Visible = True
                    liCart.Visible = False
                End If
            Catch ex As Exception

            End Try
        End If

    End Sub

    Protected Sub btnLog_Click(sender As Object, e As EventArgs)
        Dim userrole As String
        con.Close()
        code = "select * from tbl_user where user_username='" + txtUsername.Text + "'"
        con.Open()
        cmd = New MySqlCommand(code, con)
        Dim dr As MySqlDataReader
        dr = cmd.ExecuteReader
        While dr.Read
            username = dr("user_username").ToString
            password = dr("user_password").ToString
            userrole = dr("user_role").ToString
            Session("user_id") = dr("user_id").ToString
        End While
        dr.Close()
        con.Close()

        If (String.IsNullOrWhiteSpace(txtUsername.Text) Or String.IsNullOrEmpty(txtUsername.Text)) And (String.IsNullOrWhiteSpace(txtPassword.Text) Or String.IsNullOrEmpty(txtPassword.Text)) Then

        ElseIf username = txtUsername.Text And password = txtPassword.Text And userrole = "Customer" Then
            Session("login") = "true"

            Session("user_role") = userrole
            Response.Redirect("home.aspx")


        Else

        End If
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


    Private Sub bindimage()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using cons As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("select tbl_portfolio_item.item_image from tbl_portfolio_item,tbl_portfolio_cat where (tbl_portfolio_cat.pc_category_id=tbl_portfolio_item.category_id) and tbl_portfolio_cat.pc_product_name='" + lblHeader.Text + "' ")

                Using sda As New MySqlDataAdapter()
                    cmd.Connection = cons
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        dtPort.DataSource = dt
                        dtPort.DataBind()
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
End Class
