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
		<div class="col-lg-6 col-md-6">
			<div class="form-group">
				<label>File input</label>
				 <div class="upload-drop-zone" id="drop-zone">
            Just drag and drop files here
          </div>
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
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-striped" AutoGenerateColumns="False">
                <Columns>
        <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
        <asp:TemplateField HeaderText="Header 1">
            <ItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Header 2">
            <ItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Header 3">
            <ItemTemplate>
                 <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </ItemTemplate>
                    </asp:TemplateField>
        </Columns>
            </asp:GridView>
    
            </div>
            
			<!-- <div class="table-responsive">
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
			</div>-->
			<!-- /.table-responsive --> 

		</div>
	</div>

	<div class="row">
			<asp:UpdatePanel ID="tableController" runat="server">
				<ContentTemplate>
			<div class="col-lg-3 col-md-3 form-group">

								
							<asp:Button ID="BtnAdd" CssClass="btn btn-success btn-block" Text="Tambah Transaksi Manual" runat="server" OnClick="BtnAdd_Click" />
								
							
						</div>
					<div class="col-lg-3 col-md-3 form-group">

								<asp:Button ID="BtnUpdate" CssClass="btn btn-primary btn-block" Text="Edit" runat="server" OnClick="BtnUpdate_Click" />
								
						</div>
					<div class="col-lg-3 col-md-3 form-group">

								<asp:Button ID="BtnDelete" CssClass="btn  btn-danger btn-block" Text="Hapus" runat="server" OnClick="BtnDelete_Click" />
							
						</div>
					</ContentTemplate>
						  <Triggers>
                </Triggers>
				</asp:UpdatePanel>
	</div>
	<!--  Update modal box -->
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
	<!-- /Update modal box -->

	<!--  Tambah manual transaksi modal box -->
	<div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel1">Add Manual</h4>
                                        </div>
										<asp:UpdatePanel ID="AddPanel1" runat="server">
                    <ContentTemplate>
                                        <div class="modal-body">
                                           
					
						<div class="form-group">
							<asp:Label ID="Label8" runat="server" Text="No.Order" AssociatedControlID="addNoOrder" />
							<asp:TextBox ID="addNoOrder" CssClass="form-control" runat="server" />
						</div>

						<div class="form-group">
							<asp:Label ID="Label9" runat="server" Text="Nama" AssociatedControlID="addNama" />
							<asp:TextBox ID="addNama" CssClass="form-control" runat="server" />
						</div>
					
						<div class="form-group">
							<asp:Label ID="Label10" runat="server" Text="Item" AssociatedControlID="addItem" />
							<asp:TextBox ID="addItem" CssClass="form-control" runat="server" />
						</div>

						<div class="form-group">
							<asp:Label ID="Label11" runat="server" Text="Service" AssociatedControlID="addService" />
							<asp:TextBox ID="addService" CssClass="form-control" runat="server" />
						</div>

						<div class="form-group">
							<asp:Label ID="Label12" runat="server" Text="Keterangan" AssociatedControlID="addKeterangan" />
							<asp:TextBox ID="addKeterangan" CssClass="form-control" runat="server" />
						</div>

						<div class="form-group">
							<asp:Label ID="Label13" runat="server" Text="Harga" AssociatedControlID="addHarga" />
							<asp:TextBox ID="addHarga" CssClass="form-control" runat="server" />
						</div>

						<div class="form-group">
							<asp:Label ID="Label14" runat="server" Text="Total" AssociatedControlID="addTotal" />
							<asp:TextBox ID="addTotal" CssClass="form-control" runat="server" />
						</div>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="BtnManualAddSave" runat="server" Text="Simpan" CssClass="btn btn-info" OnClick="BtnManualAddSave_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                                        </div>
						</ContentTemplate>
											 <Triggers>
                 
                        <asp:AsyncPostBackTrigger ControlID="BtnManualAddSave" EventName="Click" />
                    </Triggers>
											</asp:UpdatePanel>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
	<!-- /Tambah manual transaksi modal box -->

		<!--  Hapus Data modal box -->
	<div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel2">Add Manual</h4>
                                        </div>
										<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                                        <div class="modal-body">
                                           
					<p>Hapus data? </p>

                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="BtnDelData" runat="server" Text="Hapus" CssClass="btn btn-info" OnClick="BtnDelData_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Batal</button>
                                        </div>
						</ContentTemplate>
											 <Triggers>
                 
                        <asp:AsyncPostBackTrigger ControlID="BtnDelData" EventName="Click" />
                    </Triggers>
											</asp:UpdatePanel>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
	<!-- /Hapus data modal box -->
	<div class="row">
	<div class="form-group col-lg-4">
		<asp:Button ID="CommitOrder" CssClass="btn btn-lg btn-info btn-block" Text="Commit Order" runat="server" />

	</div>
		</div>
</asp:Content>
