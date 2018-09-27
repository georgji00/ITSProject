Imports System
Imports System.Data

Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D
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
Imports System.IO


Partial Class tryyourown
    Inherits System.Web.UI.Page
    Dim con As New MySqlConnection("data source=localhost;database=db_papaprint;userid=root;password=0000")
    Dim cmd As New MySqlCommand
    Dim da As New MySqlDataAdapter
    Dim code, username, password, role As String


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                bindportmenu()

                If Session("login") = "true" Then
                 
                Else
                    Response.Redirect("backend/public/login.aspx")
                 
                End If
            Catch ex As Exception

            End Try
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
    Protected Sub lnkPort_Click(sender As Object, e As EventArgs)
        Dim button As LinkButton = sender
        Dim buttonID = button.Text
        Session("portforlio") = buttonID
        Response.Redirect("portfolio.aspx")
    End Sub

    

    Protected Sub btnAddtoCart_Click(sender As Object, e As EventArgs)
        Response.Redirect("cart.aspx")
    End Sub

    
   
End Class
