Public Class update
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

	End Sub

	Protected Sub BtnUpdate_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
		'Dim cs As ClientScriptManager = Page.ClientScript
		'Dim csType As Type = Me.GetType()
		Dim builder As New StringBuilder()
		builder.Append("<script type='text/javascript'>")
		builder.Append("$('#editModal').modal({backdrop: 'static', keyboard: false});")
		builder.Append("</script>")
		'cs.RegisterClientScriptBlock(csType, "EditShowModalScript", builder.ToString(), True)
		'cs.RegisterStartupScript(csType, "EditShowModalScript", builder.ToString(), True)
		ScriptManager.RegisterClientScriptBlock(Me, Me.GetType, "EditShowModal-UpdateOrderScript", builder.ToString(), False)

	End Sub

	Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
		MsgBox("saved!")

	End Sub
End Class