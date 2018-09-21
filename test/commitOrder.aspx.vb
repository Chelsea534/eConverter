Public Class commitOrder
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
		Dim builder As New StringBuilder()
		builder.Append("<script type='text/javascript'>")
		builder.Append("$('#editModal').modal({backdrop: 'static', keyboard: false});")
		builder.Append("</script>")
		'cs.RegisterClientScriptBlock(csType, "EditShowModalScript", builder.ToString(), True)
		'cs.RegisterStartupScript(csType, "EditShowModalScript", builder.ToString(), True)
		ScriptManager.RegisterClientScriptBlock(Me, Me.GetType, "EditShowModal-CommitOrderScript", builder.ToString(), False)
	End Sub

	Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
		MsgBox("saved!!!")
	End Sub
End Class