Public Class masterData
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Protected Sub BtnAddSku_Click(sender As Object, e As EventArgs) Handles BtnAddSku.Click
		Dim builder As New StringBuilder()
		builder.Append("<script type='text/javascript'>")
		builder.Append("$('#SkuAddModal').modal({backdrop: 'static', keyboard: false});")
		builder.Append("</script>")
		ScriptManager.RegisterClientScriptBlock(Me, Me.GetType, "SkuAddShowModal-MasterDataScript", builder.ToString(), False)
	End Sub

	Protected Sub BtnUpdateSku_Click(sender As Object, e As EventArgs) Handles BtnUpdateSku.Click
		Dim builder As New StringBuilder()
		builder.Append("<script type='text/javascript'>")
		builder.Append("$('#SkuEditModal').modal({backdrop: 'static', keyboard: false});")
		builder.Append("</script>")
		ScriptManager.RegisterClientScriptBlock(Me, Me.GetType, "SkuEditShowModal-MasterDataScript", builder.ToString(), False)
	End Sub

	Protected Sub BtnDeleteSku_Click(sender As Object, e As EventArgs) Handles BtnDeleteSku.Click
		Dim builder As New StringBuilder()
		builder.Append("<script type='text/javascript'>")
		builder.Append("$('#SkuDeleteModal').modal({backdrop: 'static', keyboard: false});")
		builder.Append("</script>")
		ScriptManager.RegisterClientScriptBlock(Me, Me.GetType, "SkuDeleteShowModal-MasterDataScript", builder.ToString(), False)
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

	Protected Sub BtnManualAddSaveSku_Click(sender As Object, e As EventArgs) Handles BtnManualAddSaveSku.Click

	End Sub

	Protected Sub BtnDelSku_Click(sender As Object, e As EventArgs) Handles BtnDelSku.Click

	End Sub
End Class