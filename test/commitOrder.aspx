<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="commitOrder.aspx.vb" Inherits="test.commitOrder" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Commit Order</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-3 col-md-6">
			<div class="form-group">
				<label>File input</label>
				<input type="file" />
			</div>
		</div>
		<div class="col-lg-2 col-md-6">
			<div class="form-group">
				<asp:Button ID="upload" CssClass="btn btn-success btn-block" Text="Upload" runat="server" />
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-3">
			<div class="form-group">
				<label>Pilih Filter</label>
				<asp:DropDownList ID="dataFilter" CssClass="form-control" runat="server">
					<asp:ListItem Value="1">New Order</asp:ListItem>
					<asp:ListItem Value="2">Sameday</asp:ListItem>
					<asp:ListItem Value="3">Reguler</asp:ListItem>
					<asp:ListItem Value="4">All</asp:ListItem>
				</asp:DropDownList>
			</div>
		</div>


	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="table-responsive">
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>Date</th>
							<th>Time</th>
							<th>Amount</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>3326</td>
							<td>10/21/2013</td>
							<td>3:29 PM</td>
							<td>$321.33</td>
						</tr>
						<tr>
							<td>3325</td>
							<td>10/21/2013</td>
							<td>3:20 PM</td>
							<td>$234.34</td>
						</tr>
						<tr>
							<td>3324</td>
							<td>10/21/2013</td>
							<td>3:03 PM</td>
							<td>$724.17</td>
						</tr>
						<tr>
							<td>3323</td>
							<td>10/21/2013</td>
							<td>3:00 PM</td>
							<td>$23.71</td>
						</tr>
						<tr>
							<td>3322</td>
							<td>10/21/2013</td>
							<td>2:49 PM</td>
							<td>$8345.23</td>
						</tr>
						<tr>
							<td>3321</td>
							<td>10/21/2013</td>
							<td>2:23 PM</td>
							<td>$245.12</td>
						</tr>
						<tr>
							<td>3320</td>
							<td>10/21/2013</td>
							<td>2:15 PM</td>
							<td>$5663.54</td>
						</tr>
						<tr>
							<td>3319</td>
							<td>10/21/2013</td>
							<td>2:13 PM</td>
							<td>$943.45</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- /.table-responsive -->

		</div>
	</div>

	<div class="row">
			<div class="col-lg-3 form-group">
						<asp:UpdatePanel ID="upCrudGrid" runat="server">
							<ContentTemplate>
								<asp:Button ID="btnUpdate" CssClass="btn btn-lg btn-success btn-block" Text="Update" runat="server" OnClick="btnUpdate_Click" />
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
                                            <asp:Button ID="btnSave" runat="server" Text="Update" CssClass="btn btn-info" OnClick="btnSave_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                                        </div>
						</ContentTemplate>
											 <Triggers>
                 
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    </Triggers>
											</asp:UpdatePanel>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->

                            </div>

	<div class="form-group">
		<asp:Button ID="commitOrder" CssClass="btn btn-lg btn-success btn-block" Text="Commit Order" runat="server" />

	</div>

</asp:Content>
