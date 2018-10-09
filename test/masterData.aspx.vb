﻿Imports System.Data
Imports MySql.Data.MySqlClient
Imports System.Configuration
Public Class masterData
    Inherits System.Web.UI.Page
    'Public conn As MySqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
            Dim conn As New MySqlConnection(constr)
            Try
                conn.Open()
                'Response.Write("Database opened!") JANGAN DIPAKAI, BISA MERUBAH FONT PAGE
                viewTabelSKU()
            Catch ex As Exception
                Response.Write(ex.Message)
            End Try
        End If
    End Sub
    Sub viewTabelSKU()
        Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
        Using con As New MySqlConnection(constr)
            Using cmd As New MySqlCommand("SELECT * FROM TABEL_SKU")
                Using sda As New MySqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Sub showModal(ByVal modal As String)
        Dim builder As New StringBuilder()
        builder.Append("<script type='text/javascript'>")
        builder.Append("$('" & modal & "').modal({backdrop: 'static', keyboard: false});")
        builder.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType, modal & "show-MasterDataScript", builder.ToString(), False)
    End Sub
    Sub closeModal(ByVal modal As String)
        Dim builder As New StringBuilder()
        builder.Append("<script type='text/javascript'>")
        builder.Append("$('" & modal & "').modal('toggle');")
        builder.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType, modal & "close-MasterDataScript", builder.ToString(), False)
    End Sub


    Protected Sub BtnAddSup_Click(sender As Object, e As EventArgs) Handles BtnAddSup.Click

    End Sub

    Protected Sub BtnUpdateSup_Click(sender As Object, e As EventArgs) Handles BtnUpdateSup.Click

    End Sub

    Protected Sub BtnDelSup_Click(sender As Object, e As EventArgs) Handles BtnDelSup.Click

    End Sub

    Protected Sub BtnAddSal_Click(sender As Object, e As EventArgs) Handles BtnAddSal.Click

    End Sub

    Protected Sub BtnUpdateSal_Click(sender As Object, e As EventArgs) Handles BtnUpdateSal.Click

    End Sub

    Protected Sub BtnDelSal_Click(sender As Object, e As EventArgs) Handles BtnDelSal.Click

    End Sub

    Protected Sub BtnSaveSku_Click(sender As Object, e As EventArgs) Handles BtnSaveSku.Click

    End Sub
    Protected Sub BtnAddSku_Click(sender As Object, e As EventArgs) Handles BtnAddSku.Click
        tbnewSKU.Text = ""
        tbnewNamaSKU.Text = ""
        tbnewBerat.Text = ""
        showModal("#SkuAddModal")
    End Sub
    Protected Sub BtnManualAddSaveSku_Click(sender As Object, e As EventArgs) Handles BtnManualAddSaveSku.Click
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("INSERT INTO TABEL_SKU (SKU,NAMA,QTY,BERAT,HARGA) VALUES (@SKU, @NAMA, @QTY, @BERAT, @HARGA)")
                    Using sda As New MySqlDataAdapter()
                        cmd.Parameters.AddWithValue("@SKU", tbnewSKU.Text)
                        cmd.Parameters.AddWithValue("@NAMA", tbnewNamaSKU.Text)
                        cmd.Parameters.AddWithValue("@QTY", "0")
                        cmd.Parameters.AddWithValue("@BERAT", tbnewBerat.Text)
                        cmd.Parameters.AddWithValue("@HARGA", "0")
                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()
                    End Using
                End Using
            End Using
            viewTabelSKU()
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        closeModal("#SkuAddModal")
    End Sub

    Protected Sub BtnDelSku_Click(sender As Object, e As EventArgs) Handles BtnDelSku.Click
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("DELETE FROM TABEL_SKU WHERE ID_SKU = @ID_SKU")
                    Using sda As New MySqlDataAdapter()
                        cmd.Parameters.AddWithValue("@ID_SKU", lbidsku.Text)
                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()
                    End Using
                End Using
            End Using
            viewTabelSKU()
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        closeModal("#SkuDeleteModal")
        closeModal("#myModalEditTabelSKU")
    End Sub
    'UPDATE SKU
    Protected Sub BtnMdlUpdateSKU_Click(sender As Object, e As EventArgs)
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("UPDATE TABEL_SKU SET SKU = @SKU, NAMA = @NAMA, BERAT = @BERAT WHERE ID_SKU = @ID_SKU")
                    Using sda As New MySqlDataAdapter()
                        cmd.Parameters.AddWithValue("@ID_SKU", lbidsku.Text)
                        cmd.Parameters.AddWithValue("@SKU", tbsku.Text)
                        cmd.Parameters.AddWithValue("@NAMA", tbnamasku.Text)
                        cmd.Parameters.AddWithValue("@BERAT", tbberat.Text)
                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()
                    End Using
                End Using
            End Using
            viewTabelSKU()
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        closeModal("#myModalEditTabelSKU")
    End Sub
    'HAPUS SKU
    Protected Sub BtnMdlDeleteSKU_Click(sender As Object, e As EventArgs)
        showModal("#SkuDeleteModal")
    End Sub

    Protected Sub DisplayEditSKU(sender As Object, e As EventArgs)
        Dim rowIndex As Integer = Convert.ToInt32(TryCast(TryCast(sender, LinkButton).NamingContainer, GridViewRow).RowIndex)
        Dim row As GridViewRow = GridView1.Rows(rowIndex)
        lbidsku.Text = TryCast(row.FindControl("ID_SKU"), Label).Text
        tbsku.Text = TryCast(row.FindControl("SKU"), Label).Text
        tbnamasku.Text = TryCast(row.FindControl("NAMA"), Label).Text
        lbqty.Text = TryCast(row.FindControl("QTY"), Label).Text
        tbberat.Text = TryCast(row.FindControl("BERAT"), Label).Text
        lbharga.Text = TryCast(row.FindControl("HARGA"), Label).Text
        'ClientScript.RegisterStartupScript(Me.[GetType](), "Pop", "openModalEditSKU();", True)
        showModal("#myModalEditTabelSKU")
    End Sub
End Class