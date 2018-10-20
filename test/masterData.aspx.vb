Imports System.Data
Imports MySql.Data.MySqlClient
Imports System.Configuration
Imports System
Imports AjaxControlToolkit
Imports System.IO

Public Class masterData
    Inherits System.Web.UI.Page
    'Public conn As MySqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            BtnManualAddSaveSku.Attributes.Add("onclick", "DisableButton()")
            Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
            Dim conn As New MySqlConnection(constr)
            Try
                conn.Open()
                viewTabelSKU()
            Catch ex As Exception
                MsgBox(ex.Message)
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
    Function getNextIncrement()
        Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
        Dim conn As New MySqlConnection(constr)
        Try
            conn.Open()
            Dim cmd As New MySqlCommand("SELECT `AUTO_INCREMENT` FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'sql12259867' AND TABLE_NAME = 'TABEL_SKU'")
            cmd.Connection = conn
            Dim sda As New MySqlDataAdapter()
            sda.SelectCommand = cmd
            Dim datardr As MySqlDataReader = cmd.ExecuteReader
            If datardr.HasRows Then
                datardr.Read()
                Return datardr("AUTO_INCREMENT")
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        Return 0
    End Function
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

    Protected Sub BtnAddSku_Click(sender As Object, e As EventArgs) Handles BtnAddSku.Click
        tbnewSKU.Text = ""
        tbnewNamaSKU.Text = ""
        tbnewBerat.Text = ""
        showModal("#SkuAddModal")
    End Sub
    Protected Sub BtnManualAddSaveSku_Click(sender As Object, e As EventArgs) Handles BtnManualAddSaveSku.Click
        Try
            'MsgBox(getNextIncrement())
            Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("INSERT INTO TABEL_SKU (SKU,NAMA,QTY,BERAT,HARGA,GAMBAR_PATH) VALUES (@SKU, @NAMA, @QTY, @BERAT, @HARGA, @GAMBAR_PATH)")
                    Using sda As New MySqlDataAdapter()
                        cmd.Parameters.AddWithValue("@SKU", tbnewSKU.Text)
                        cmd.Parameters.AddWithValue("@NAMA", tbnewNamaSKU.Text)
                        cmd.Parameters.AddWithValue("@QTY", "0")
                        cmd.Parameters.AddWithValue("@BERAT", tbnewBerat.Text)
                        cmd.Parameters.AddWithValue("@HARGA", "0")
                        Dim strname As String
                        If inputfile.HasFile Then
                            inputfile.PostedFile.SaveAs(Server.MapPath("~/GambarProduk/") & getNextIncrement() & ".jpg")
                            strname = "~/GambarProduk/" & getNextIncrement() & ".jpg"
                            cmd.Parameters.AddWithValue("@GAMBAR_PATH", strname)
                        Else
                            cmd.Parameters.AddWithValue("@GAMBAR_PATH", "~/GambarProduk/DEFAULT.png")
                        End If
                        cmd.Connection = con
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()
                    End Using
                End Using
            End Using
            viewTabelSKU()
            closeModal("#SkuAddModal")
            'Mencegah form re submit
            Response.Redirect("masterData.aspx", False)
            Context.ApplicationInstance.CompleteRequest()
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

    End Sub

    Protected Sub BtnDelSku_Click(sender As Object, e As EventArgs) Handles BtnDelSku.Click
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
            Using con As New MySqlConnection(constr)
                Using cmd As New MySqlCommand("DELETE FROM TABEL_SKU WHERE ID_SKU = @ID_SKU")
                    Using sda As New MySqlDataAdapter()
                        cmd.Parameters.AddWithValue("@ID_SKU", lbeditidsku.Text)
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
                        cmd.Parameters.AddWithValue("@ID_SKU", lbeditidsku.Text)
                        cmd.Parameters.AddWithValue("@SKU", tbeditsku.Text)
                        cmd.Parameters.AddWithValue("@NAMA", tbeditnamasku.Text)
                        cmd.Parameters.AddWithValue("@BERAT", tbeditberat.Text)
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

    Protected Sub upload_Click(sender As Object, e As EventArgs)
        MsgBox("simvan")
        'If fileupload1.HasFile Then
        'Dim strname As String
        'strname = fileupload1.FileName.ToString()
        'MsgBox(strname)
        'fileupload1.PostedFile.SaveAs(Server.MapPath("~/GambarProduk/") & strname)
        'FileUpload.SaveAs(Server.MapPath("~/GambarProduk/" & strname))
        'End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        'MsgBox("simvanmonobox")
        'If AsyncFileUpload1.HasFile Then
        'Dim fileSize As Double = CDbl(AsyncFileUpload1.FileBytes.Length)
        'Dim fileinMB As Double = fileSize / (1024 * 1024)
        'If fileinMB <= 2 Then
        'Dim strname As String
        'strname = AsyncFileUpload1.FileName.ToString()
        'AsyncFileUpload1.PostedFile.SaveAs(Server.MapPath("~/GambarProduk/") & strname)
        'MsgBox(strname & " sukses disimpan")
        'FileUpload.SaveAs(Server.MapPath("~/GambarProduk/" & strname))xxx
        'Else
        ' MsgBox("File kudu < 2 MB")
        'End If
        'End If
    End Sub

End Class