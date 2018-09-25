<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="masterData.aspx.vb" Inherits="test.masterData" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Master Data</h1>
		</div>
	</div>


	<!-- SKU Table -->
	<div class="row">
		<div class="col-lg-12">
			<h4 class="page-header">SKU Table</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<table class="table table-striped table-bordered table-hover">
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

				</tbody>
			</table>
		</div>
	</div>
	<div class="row page-header">
			<asp:UpdatePanel ID="tableControllerSku" runat="server">
				<ContentTemplate>
			<div class="col-lg-3 col-md-3 form-group">						
							<asp:Button ID="BtnAddSku" CssClass="btn btn-success btn-block" Text="Tambah Transaksi Manual" runat="server" OnClick="BtnAddSku_Click" />
						</div>
					<div class="col-lg-3 col-md-3 form-group">
								<asp:Button ID="BtnUpdateSku" CssClass="btn btn-primary btn-block" Text="Edit" runat="server" OnClick="BtnUpdateSku_Click" />						
						</div>
					<div class="col-lg-3 col-md-3 form-group">
								<asp:Button ID="BtnDeleteSku" CssClass="btn  btn-danger btn-block" Text="Hapus" runat="server" OnClick="BtnDeleteSku_Click" />	
						</div>
					</ContentTemplate>
						  <Triggers>
                </Triggers>
				</asp:UpdatePanel>
	</div>

	<!--  Update modal box -->
	<div class="modal fade" id="SkuEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                            <asp:Button ID="BtnSaveSku" runat="server" Text="Update" CssClass="btn btn-info" OnClick="BtnSaveSku_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                                        </div>
						</ContentTemplate>
											 <Triggers>
                 
                        <asp:AsyncPostBackTrigger ControlID="BtnSaveSku" EventName="Click" />
                    </Triggers>
											</asp:UpdatePanel>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
	<!-- /Update modal box -->

	<!--  Tambah manual transaksi modal box -->
	<div class="modal fade" id="SkuAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
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
                                            <asp:Button ID="BtnManualAddSaveSku" runat="server" Text="Simpan" CssClass="btn btn-info" OnClick="BtnManualAddSaveSku_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                                        </div>
						</ContentTemplate>
											 <Triggers>
                 
                        <asp:AsyncPostBackTrigger ControlID="BtnManualAddSaveSku" EventName="Click" />
                    </Triggers>
											</asp:UpdatePanel>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
	<!-- /Tambah manual transaksi modal box -->

		<!--  Hapus Data modal box -->
	<div class="modal fade" id="SkuDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                            <asp:Button ID="BtnDelSku" runat="server" Text="Hapus" CssClass="btn btn-info" OnClick="BtnDelSku_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Batal</button>
                                        </div>
						</ContentTemplate>
											 <Triggers>
                 
                        <asp:AsyncPostBackTrigger ControlID="BtnDelSku" EventName="Click" />
                    </Triggers>
											</asp:UpdatePanel>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
	<!-- /Hapus data modal box -->

	<!--/Table Sku -->

	<!-- Table Supplier -->
		<div class="row">
		<div class="col-lg-12">
			<h4 class="page-header">Supplier Table</h4>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<table class="table table-striped table-bordered table-hover">
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

				</tbody>
			</table>
		</div>
	</div>
	<div class="row page-header">
			<asp:UpdatePanel ID="tableControllerSup" runat="server">
				<ContentTemplate>
			<div class="col-lg-3 col-md-3 form-group">						
							<asp:Button ID="BtnAddSup" CssClass="btn btn-success btn-block" Text="Tambah Transaksi Manual" runat="server" OnClick="BtnAddSup_Click" />
						</div>
					<div class="col-lg-3 col-md-3 form-group">
								<asp:Button ID="BtnUpdateSup" CssClass="btn btn-primary btn-block" Text="Edit" runat="server" OnClick="BtnUpdateSup_Click" />						
						</div>
					<div class="col-lg-3 col-md-3 form-group">
								<asp:Button ID="BtnDelSup" CssClass="btn  btn-danger btn-block" Text="Hapus" runat="server" OnClick="BtnDelSup_Click" />	
						</div>
					</ContentTemplate>
						  <Triggers>
                </Triggers>
				</asp:UpdatePanel>
	</div>
	<!-- /Table Supplier -->

	<!-- Table Sales -->
		<div class="row">
		<div class="col-lg-12">
			<h4 class="page-header">Sales Table</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<table class="table table-striped table-bordered table-hover">
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

				</tbody>
			</table>
		</div>
	</div>
	<div class="row page-header">
			<asp:UpdatePanel ID="tableControllerSales" runat="server">
				<ContentTemplate>
			<div class="col-lg-3 col-md-3 form-group">						
							<asp:Button ID="BtnAddSal" CssClass="btn btn-success btn-block" Text="Tambah Transaksi Manual" runat="server" OnClick="BtnAddSal_Click" />
						</div>
					<div class="col-lg-3 col-md-3 form-group">
								<asp:Button ID="BtnUpdateSal" CssClass="btn btn-primary btn-block" Text="Edit" runat="server" OnClick="BtnUpdateSal_Click" />						
						</div>
					<div class="col-lg-3 col-md-3 form-group">
								<asp:Button ID="BtnDelSal" CssClass="btn  btn-danger btn-block" Text="Hapus" runat="server" OnClick="BtnDelSal_Click" />	
						</div>
					</ContentTemplate>
						  <Triggers>
                </Triggers>
				</asp:UpdatePanel>
	</div>
    <!-- /Table Sales -->
</asp:Content>
