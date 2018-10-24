<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tabelSupplier.aspx.vb" Inherits="test.tabelSupplier" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" enctype="multipart/form-data">
    <div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Tabel Supplier</h1>
		</div>
	</div>
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

</asp:Content>