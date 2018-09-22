Public Class commitOrder
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            SetInitialRow()
        End If
    End Sub
    Private Sub SetInitialRow()
        Dim dt As New DataTable()
        Dim dr As DataRow = Nothing
        dt.Columns.Add(New DataColumn("RowNumber", GetType(String)))
        dt.Columns.Add(New DataColumn("Column1", GetType(String)))
        dt.Columns.Add(New DataColumn("Column2", GetType(String)))
        dt.Columns.Add(New DataColumn("Column3", GetType(String)))
        dr = dt.NewRow()
        dr("RowNumber") = 1
        dr("Column1") = String.Empty
        dr("Column2") = String.Empty
        dr("Column3") = String.Empty
        dt.Rows.Add(dr)
        'Store the DataTable in ViewState
        ViewState("CurrentTable") = dt
        GridView1.DataSource = dt
        GridView1.DataBind()

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
    Private Sub AddNewRowToGrid()

        Dim rowIndex As Integer = 0

        If ViewState("CurrentTable") IsNot Nothing Then
            Dim dtCurrentTable As DataTable = DirectCast(ViewState("CurrentTable"), DataTable)
            Dim drCurrentRow As DataRow = Nothing

            If dtCurrentTable.Rows.Count > 0 Then
                For i As Integer = 1 To dtCurrentTable.Rows.Count
                    'extract the TextBox values
                    Dim box1 As TextBox = DirectCast(GridView1.Rows(rowIndex).Cells(1).FindControl("TextBox1"), TextBox)
                    Dim box2 As TextBox = DirectCast(GridView1.Rows(rowIndex).Cells(2).FindControl("TextBox2"), TextBox)
                    Dim box3 As TextBox = DirectCast(GridView1.Rows(rowIndex).Cells(3).FindControl("TextBox3"), TextBox)
                    drCurrentRow = dtCurrentTable.NewRow()
                    drCurrentRow("RowNumber") = i + 1
                    dtCurrentTable.Rows(i - 1)("Column1") = box1.Text
                    dtCurrentTable.Rows(i - 1)("Column2") = box2.Text
                    dtCurrentTable.Rows(i - 1)("Column3") = box3.Text
                    rowIndex += 1
                Next

                dtCurrentTable.Rows.Add(drCurrentRow)
                ViewState("CurrentTable") = dtCurrentTable
                GridView1.DataSource = dtCurrentTable
                GridView1.DataBind()

            End If
        Else
            Response.Write("ViewState is null")
        End If
        SetPreviousData()

    End Sub

    Private Sub SetPreviousData()

        Dim rowIndex As Integer = 0

        If ViewState("CurrentTable") IsNot Nothing Then
            Dim dt As DataTable = DirectCast(ViewState("CurrentTable"), DataTable)
            If dt.Rows.Count > 0 Then
                For i As Integer = 0 To dt.Rows.Count - 1
                    Dim box1 As TextBox = DirectCast(GridView1.Rows(rowIndex).Cells(1).FindControl("TextBox1"), TextBox)
                    Dim box2 As TextBox = DirectCast(GridView1.Rows(rowIndex).Cells(2).FindControl("TextBox2"), TextBox)
                    Dim box3 As TextBox = DirectCast(GridView1.Rows(rowIndex).Cells(3).FindControl("TextBox3"), TextBox)
                    box1.Text = dt.Rows(i)("Column1").ToString()
                    box2.Text = dt.Rows(i)("Column2").ToString()
                    box3.Text = dt.Rows(i)("Column3").ToString()
                    rowIndex += 1
                Next
            End If
        End If

    End Sub


    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

    End Sub

    Private Sub commitOrder_Click(sender As Object, e As EventArgs) Handles commitOrder.Click
        AddNewRowToGrid()
    End Sub
End Class