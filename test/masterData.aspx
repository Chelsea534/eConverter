﻿<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="masterData.aspx.vb" Inherits="test.masterData" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Master Data</h1>
		</div>
	</div>
    <div>
        
   <!-- <script type="text/javascript">
        function uploadComplete(sender, args) {
            try {
            alert("tada");
            $get("dvFileInfo").style.display = 'block';
            $get("<%=lblSuccess.ClientID%>").innerHTML="File uploaded";
        }
        catch (e) {
            alert("ERRORX")
        }
        }        
    </script> -->

    </div>
    
	<!-- SKU Table -->
	<div class="row">
		<div class="col-lg-12">
			<h4 class="page-header">SKU Table</h4>
		</div>
	</div>
    <div class="row">
        <div class="col-lg-12">
            <div class="table-responsive">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <div class="alert alert-success" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Success!</strong> 1 Data telah di update!
                        </div>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-striped" AutoGenerateColumns="False"
                            DataKeyNames="ID_SKU">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Editrows" Text="Edit" OnClick="DisplayEditSKU" CssClass="btn btn-info" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="ID_SKU" runat="server" Text='<%# Eval("ID_SKU") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Kode SKU">
                                    <ItemTemplate>
                                        <asp:Label ID="SKU" runat="server" Text='<%# Eval("SKU") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nama SKU">
                                    <ItemTemplate>
                                        <asp:Label ID="NAMA" runat="server" Text='<%# Eval("NAMA") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:Label ID="QTY" runat="server" Text='<%# Eval("QTY") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Berat">
                                    <ItemTemplate>
                                        <asp:Label ID="BERAT" runat="server" Text='<%# Eval("BERAT") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Harga">
                                    <ItemTemplate>
                                        <asp:Label ID="HARGA" runat="server" Text='<%# Eval("HARGA") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ImageField HeaderText="Gambar" DataImageUrlField="GAMBAR_PATH" ControlStyle-Height="80" ControlStyle-Width="80">
                                    <ControlStyle Height="80px" Width="80px" />
                                </asp:ImageField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <div class="row page-header">
        <asp:UpdatePanel ID="tableControllerSku" runat="server">
            <ContentTemplate>
                <div class="col-lg-3 col-md-3 form-group">
                    <asp:Button ID="BtnAddSku" CssClass="btn btn-success btn-block" Text="Tambah Transaksi Manual" runat="server" OnClick="BtnAddSku_Click" />
                </div>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <!--  Edit SKU modal box *ARRON -->
    <div class="modal fade" id="myModalEditTabelSKU" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabelTabelSKU">Edit Data SKU</h4>
                </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <div class="form-group">
                                <asp:Label ID="Label15" runat="server" Text="ID SKU :" />
                                <asp:Label ID="lbidsku" runat="server" Text="" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label18" runat="server" Text="Qty :" />
                                <asp:Label ID="lbqty" runat="server" Text="" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label20" runat="server" Text="Harga :" />
                                <asp:Label ID="lbharga" runat="server" Text="" />
                            </div>
                            <br />
                            <div class="form-group">
                                <asp:Label ID="Label16" runat="server" Text="SKU" />
                                <asp:TextBox ID="tbsku" CssClass="form-control" runat="server" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label17" runat="server" Text="Nama SKU" />
                                <asp:TextBox ID="tbnamasku" CssClass="form-control" runat="server" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label19" runat="server" Text="Berat" />
                                <asp:TextBox ID="tbberat" CssClass="form-control" runat="server" />
                            </div>

                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="BtnMdlUpdateSKU" runat="server" Text="Update" CssClass="btn btn-info" OnClick="BtnMdlUpdateSKU_Click" />
                            <asp:Button ID="BtnMdlDeleteSKU" runat="server" Text="Hapus" CssClass="btn btn-danger" OnClick="BtnMdlDeleteSKU_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
	<!-- /Update modal box *arron-->

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
                                <asp:Label ID="Label8" runat="server" Text="ID SKU :" />
                                <asp:Label ID="lbnewSKU" runat="server" Text="Auto Increment" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label10" runat="server" Text="Qty :" />
                                <asp:Label ID="lbnewQTY" runat="server" Text="*Update setelah Pembelian" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label12" runat="server" Text="Harga :" />
                                <asp:Label ID="lbnewHARGA" runat="server" Text="*Update setelah Pembelian" />
                            </div>
                            <br />
                            <div class="form-group">
                                <asp:Label ID="Label14" runat="server" Text="SKU" />
                                <asp:TextBox ID="tbnewSKU" CssClass="form-control" runat="server" Text="" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label21" runat="server" Text="Nama SKU" />
                                <asp:TextBox ID="tbnewNamaSKU" CssClass="form-control" runat="server" Text="" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label22" runat="server" Text="Berat" />
                                <asp:TextBox ID="tbnewBerat" CssClass="form-control" runat="server" Text="" />
                            </div>
                            
                            <ajaxToolkit:AsyncFileUpload ID="afuUpload" OnUploadedComplete="afuUpload_UploadedComplete" 
                                OnUploadedFileError="afuUpload_UploadedFileError" runat="server" OnClientUploadComplete="uploadComplete"
                                Width="400px" UploaderStyle="Traditional" UploadingBackColor="#CCFFFF" ThrobberID="myThrobber" />
                            
                            <br />
                            <br />
                            <div style="border-style: solid; display: none; width: 350px" id="dvFileInfo">
                                <asp:Image ID="gambarPro" runat="server"   />
                                <asp:Label ID="lblStatus" Font-Bold="true" runat="server" Text="Status:-" />
                                <asp:Label ID="lblSuccess" ForeColor="Green" runat="server" /><br />
                                <asp:Label ID="lblFileName" Font-Bold="true" runat="server" Text="FileName :-" />
                                <asp:Label ID="lblFileNameDisplay" runat="server" /><br />
                                <asp:Label ID="lblFileSize" Font-Bold="true" runat="server" Text="File Size :- " />
                                <asp:Label ID="lblFileSizeDisplay" runat="server" /><br />
                                <asp:Label ID="lblContentType" Font-Bold="true" runat="server" Text="Content Type :-" />
                                <asp:Label ID="lblContentTypeDisplay" runat="server" /><br />
                            </div>
                            <div style="border-style: solid; display: none; width: 350px" id="dvFileErrorInfo">
                                <asp:Label ID="lblErrorStatus" Font-Bold="true" runat="server" Text="Status:-" />
                                <asp:Label ID="lblError" ForeColor="Red" runat="server" /><br />
                            </div>
                            <div class="form-group">
                                <asp:FileUpload ID="inputfile" runat="server" onchange="showimagepreview(this)" accept=".jpg,.png,.jpeg"/>                                
                                <img id="image_upload_preview" src="http://placehold.it/100x100" alt="your image" height="150" width="150" />
                                <asp:Label ID="tmWarning" ForeColor="Red" runat="server" />
                            </div>                           
                            <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
                            <script type="text/javascript">
                                function showimagepreview(input) {
                                    if (input.files && input.files[0]) {
                                        var filerdr = new FileReader();
                                        filerdr.onload = function (e) {
                                            $('#image_upload_preview').attr('src', e.target.result);
                                        }
                                        filerdr.readAsDataURL(input.files[0]);
                                    }
                                    if (input.files[0].size > 2097152) {
                                        alert("File is too big!");
                                        $get("<%=tmWarning.ClientID%>").innerHTML = "File kudu lebih kecil dari 2 MB";
                                        input.value = "";
                                    }
                                }
                            </script>
                            <script type="text/javascript">
                                function uploadComplete(sender, args) {
                                    try {
                                        var fileExt = args.get_fileName();
                                        if (parseInt(args.get_length()) > 2100000) {
                                            $get("dvFileErrorInfo").style.display = 'block';
                                            $get("<%=lblErrorStatus.ClientID%>").innerHTML = "File kudu lebih kecil dari 2 MB";
                                            $get("dvFileInfo").style.display = 'none';
                                            return;
                                        }
                                        if (fileExt.indexOf('.jpg') == -1) {
                                            $get("dvFileErrorInfo").style.display = 'block';
                                            $get("<%=lblErrorStatus.ClientID%>").innerHTML = "Harus file gambar .jpg";
                                            $get("dvFileInfo").style.display = 'none';
                                            return;
                                        }
                                        $get("dvFileInfo").style.display = 'block';
                                        $get("dvFileErrorInfo").style.display = 'none';
                                        $get("<%=lblSuccess.ClientID%>").innerHTML = "File uploaded";
                                        $get("<%=lblFileNameDisplay.ClientID%>").innerHTML = args.get_fileName();
                                        $get("<%=lblFileSizeDisplay.ClientID%>").innerHTML = args.get_length();
                                        $get("<%=lblContentTypeDisplay.ClientID%>").innerHTML = args.get_contentType();

                                        var photo = document.getElementById("afuUpload");
                                        var file = photo.files[0];
                                        var preview = document.getElementById("gambarPro");
                                        preview.src = file.getAsDataURL();
                                    }
                                    catch (e) {
                                        alert(e.message)
                                    }
                                }
                            </script>
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
