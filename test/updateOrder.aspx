<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="updateOrder.aspx.vb" Inherits="test.update" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
           

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Update</h1>
			<p class="help-block">Update after committing.</p>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<table class="table table-striped table-bordered table-hover" id="dataTables-example">
				<thead>
					<tr>
						<th>Rendering engine</th>
						<th>Browser</th>
						<th>Platform(s)</th>
						<th>Engine version</th>
						<th>CSS grade</th>
					</tr>
				</thead>
				<tbody>
					<tr class="">
						<td>Trident</td>
						<td>Internet Explorer 4.0</td>
						<td>Win 95+</td>
						<td class="center">4</td>
						<td class="center">X</td>
					</tr>
					<tr class="even gradeC">
						<td>Trident</td>
						<td>Internet Explorer 5.0</td>
						<td>Win 95+</td>
						<td class="center">5</td>
						<td class="center">C</td>
					</tr>
					<tr class="odd gradeA">
						<td>Trident</td>
						<td>Internet Explorer 5.5</td>
						<td>Win 95+</td>
						<td class="center">5.5</td>
						<td class="center">A</td>
					</tr>
					<tr class="even gradeA">
						<td>Trident</td>
						<td>Internet Explorer 6</td>
						<td>Win 98+</td>
						<td class="center">6</td>
						<td class="center">A</td>
					</tr>
					<tr class="odd gradeA">
						<td>Trident</td>
						<td>Internet Explorer 7</td>
						<td>Win XP SP2+</td>
						<td class="center">7</td>
						<td class="center">A</td>
					</tr>
					<tr class="even gradeA">
						<td>Trident</td>
						<td>AOL browser (AOL desktop)</td>
						<td>Win XP</td>
						<td class="center">6</td>
						<td class="center">A</td>
					</tr>
					<tr class="gradeA">
						<td>Gecko</td>
						<td>Firefox 1.0</td>
						<td>Win 98+ / OSX.2+</td>
						<td class="center">1.7</td>
						<td class="center">A</td>
					</tr>
					<tr class="gradeA">
						<td>Gecko</td>
						<td>Firefox 1.5</td>
						<td>Win 98+ / OSX.2+</td>
						<td class="center">1.8</td>
						<td class="center">A</td>
					</tr>
					<tr class="gradeA">
						<td>Gecko</td>
						<td>Firefox 2.0</td>
						<td>Win 98+ / OSX.2+</td>
						<td class="center">1.8</td>
						<td class="center">A</td>
					</tr>

				</tbody>
			</table>
		</div>

	</div>
	
	<div class="row">
					<div class="col-lg-3 col-md-3">
						<asp:UpdatePanel ID="upCrudGrid" runat="server">
							<ContentTemplate>
								<asp:Button ID="BtnUpdate" CssClass="btn btn-primary btn-block" Text="Edit" runat="server" OnClick="BtnUpdate_Click" />
							</ContentTemplate>
						  <Triggers>
                </Triggers>
							</asp:UpdatePanel>
						</div>
		</div>
		


	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Edit Content</h4>
                                        </div>
										<asp:UpdatePanel ID="upEdit" runat="server">
                    <ContentTemplate>
                                        <div class="modal-body">
                                           
					
						<div class="form-group">
							<asp:Label ID="Label1" runat="server" Text="No.Order" AssociatedControlID="noOrder" />
							<asp:TextBox ID="noOrder" CssClass="form-control" runat="server" disabled="true" />
						</div>

						<div class="form-group">
							<asp:Label ID="Label2" runat="server" Text="Nama" AssociatedControlID="nama" />
							<asp:TextBox ID="nama" CssClass="form-control" runat="server" disabled="true" />
						</div>
					

					
						<div class="form-group">
							<asp:Label ID="Label3" runat="server" Text="Item" AssociatedControlID="item" />
							<asp:TextBox ID="item" CssClass="form-control" runat="server" />
						</div>

						<div class="form-group">
							<asp:Label ID="Label4" runat="server" Text="Service" AssociatedControlID="service" />
							<asp:TextBox ID="service" CssClass="form-control" runat="server" />
						</div>

						<div class="form-group">
							<asp:Label ID="Label5" runat="server" Text="Keterangan" AssociatedControlID="keterangan" />
							<asp:TextBox ID="keterangan" CssClass="form-control" runat="server" />
						</div>

						<div class="form-group">
							<asp:Label ID="Label6" runat="server" Text="Harga" AssociatedControlID="harga" />
							<asp:TextBox ID="harga" CssClass="form-control" runat="server" />
						</div>

						<div class="form-group">
							<asp:Label ID="Label7" runat="server" Text="Total" AssociatedControlID="total" />
							<asp:TextBox ID="total" CssClass="form-control" runat="server" />
						</div>
					
					
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="BtnSave" runat="server" Text="Update" CssClass="btn btn-info" OnClick="BtnSave_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                                        </div>
						</ContentTemplate>
											 <Triggers>
                 
                        <asp:AsyncPostBackTrigger ControlID="BtnSave" EventName="Click" />
                    </Triggers>
											</asp:UpdatePanel>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->

                            </div>


</asp:Content>


