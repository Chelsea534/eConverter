Imports System.Data
Imports MySql.Data.MySqlClient
Imports System.Configuration
Imports System
Imports AjaxControlToolkit
Imports System.IO

Public Class tabelSku
	Inherits System.Web.UI.Page
    'Public conn As MySqlConnection
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            'MsgBox("Not Page.IsPostBack ")
            BtnManualAddSaveSku.Attributes.Add("onclick", "DisableButton()")
            BtnMdlUpdateSKU.Attributes.Add("onclick", "DisableButton2()")
            Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
            Dim conn As New MySqlConnection(constr)
            Try
                conn.Open()
                viewTabelSKU()
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        End If
        Dim s As String = Request.QueryString("ID")
        If s = "alertUBSukses" Then
            tampilAlert(alertUBSukses)
        ElseIf s = "alertTBSukses" Then
            tampilAlert(alertTBSukses)
        ElseIf s = "alertHBSukses" Then
            tampilAlert(alertHBSukses)
        ElseIf s = "alertGagal" Then
            tampilAlert(alertGagal)
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
			conn.Close()
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
    Sub tampilAlert(alertlabel As HtmlGenericControl)
        Dim cls As String = alertlabel.Attributes("class")
        Dim newCls As String = cls.Replace("hidden", "")
        alertlabel.Attributes("class") = newCls
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
            Response.Redirect("tabelSku.aspx?ID=alertTBSukses", False)
            Context.ApplicationInstance.CompleteRequest()
		Catch ex As Exception
            MsgBox(ex.ToString)
            'Mencegah form re submit
            Response.Redirect("tabelSku.aspx?ID=alertGagal", False)
            Context.ApplicationInstance.CompleteRequest()
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
			File.Delete(Server.MapPath(lbPathGambar.Text))
            viewTabelSKU()
            closeModal("#SkuDeleteModal")
            closeModal("#myModalEditTabelSKU")
            'solusi supaya tidak post double ketika refresh
            Response.Redirect("tabelSku.aspx?ID=alertHBSukses", False)
            Context.ApplicationInstance.CompleteRequest()
        Catch ex As Exception
            MsgBox(ex.ToString)
            'Mencegah form re submit
            Response.Redirect("tabelSku.aspx?ID=alertGagal", False)
            Context.ApplicationInstance.CompleteRequest()
        End Try

    End Sub
	'UPDATE SKU
	Protected Sub BtnMdlUpdateSKU_Click(sender As Object, e As EventArgs)
		Try
			Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
			Using con As New MySqlConnection(constr)
				Using cmd As New MySqlCommand("UPDATE TABEL_SKU SET SKU = @SKU, NAMA = @NAMA, BERAT = @BERAT, GAMBAR_PATH = @GAMBAR_PATH WHERE ID_SKU = @ID_SKU")
					Using sda As New MySqlDataAdapter()
						cmd.Parameters.AddWithValue("@ID_SKU", lbeditidsku.Text)
						cmd.Parameters.AddWithValue("@SKU", tbeditsku.Text)
						cmd.Parameters.AddWithValue("@NAMA", tbeditnamasku.Text)
						cmd.Parameters.AddWithValue("@BERAT", tbeditberat.Text)
						cmd.Parameters.AddWithValue("@GAMBAR_PATH", "~/GambarProduk/" & lbeditidsku.Text & ".jpg")
						If inputfile2.HasFile Then
							inputfile2.PostedFile.SaveAs(Server.MapPath("~/GambarProduk/") & lbeditidsku.Text & ".jpg")
						End If
						cmd.Connection = con
						con.Open()
						cmd.ExecuteNonQuery()
						con.Close()
					End Using
				End Using
			End Using
			viewTabelSKU()
            closeModal("#myModalEditTabelSKU")
            'solusi supaya tidak post double ketika refresh
            Response.Redirect("tabelSku.aspx?ID=alertUBSukses", False)
            Context.ApplicationInstance.CompleteRequest()
        Catch ex As Exception
            MsgBox(ex.ToString)
            'Mencegah form re submit
            Response.Redirect("tabelSku.aspx?ID=alertGagal", False)
            Context.ApplicationInstance.CompleteRequest()
        End Try
		'removeHidden()
	End Sub
	'HAPUS SKU
	Protected Sub BtnMdlDeleteSKU_Click(sender As Object, e As EventArgs)
		showModal("#SkuDeleteModal")
	End Sub

    Protected Sub DisplayEditSKU(sender As Object, e As EventArgs)
        Dim constr As String = ConfigurationManager.ConnectionStrings("connect").ConnectionString
        Dim conn As New MySqlConnection(constr)
        Try
            conn.Open()
            Dim rowIndex As Integer = Convert.ToInt32(TryCast(TryCast(sender, LinkButton).NamingContainer, GridViewRow).RowIndex)
            Dim row As GridViewRow = GridView1.Rows(rowIndex)
            lbeditidsku.Text = TryCast(row.FindControl("ID_SKU"), Label).Text
            Dim cmd As New MySqlCommand("SELECT `SKU`,`NAMA`,`QTY`,`BERAT`,`HARGA`,`GAMBAR_PATH` FROM TABEL_SKU WHERE ID_SKU = @ID_SKU")
            cmd.Parameters.AddWithValue("@ID_SKU", lbeditidsku.Text)
            cmd.Connection = conn
            Dim sda As New MySqlDataAdapter()
            sda.SelectCommand = cmd
            Dim datardr As MySqlDataReader = cmd.ExecuteReader
            If datardr.HasRows Then
                datardr.Read()
                tbeditsku.Text = datardr("SKU")
                tbeditnamasku.Text = datardr("NAMA")
                lbeditqty.Text = datardr("QTY")
                tbeditberat.Text = datardr("BERAT")
                lbeditharga.Text = datardr("HARGA")
                lbPathGambar.Text = datardr("GAMBAR_PATH").ToString.Replace("~", "")
            End If
            conn.Close()
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, GetType(Page), "Script", "tampilGambar();", True)
            'image_upload_preview2.Src = lbPathGambar.Text
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        'lbeditidsku.Text = TryCast(row.FindControl("ID_SKU"), Label).Text
        showModal("#myModalEditTabelSKU")
    End Sub

End Class