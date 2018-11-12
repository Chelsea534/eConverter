Public Class tabelSupplier
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

        End If
    End Sub

	Protected Sub BtnAddSup_Click(sender As Object, e As EventArgs) Handles BtnAddSup.Click

	End Sub

	Protected Sub BtnUpdateSup_Click(sender As Object, e As EventArgs) Handles BtnUpdateSup.Click

	End Sub

    Protected Sub BtnDelSup_Click(sender As Object, e As EventArgs) Handles BtnDelSup.Click

    End Sub
    Sub removeHidden()

        Dim cls As String = updateAlert.Attributes("class")
        Dim newCls As String = cls.Replace("hidden", "")
        updateAlert.Attributes("class") = newCls

    End Sub
    Protected Sub BtnManualAddSaveSku_Click(sender As Object, e As EventArgs) Handles BtnManualAddSaveSku.Click
        removeHidden()
    End Sub
End Class