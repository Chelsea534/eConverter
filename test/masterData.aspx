<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="masterData.aspx.vb" Inherits="test.masterData" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" enctype="multipart/form-data">
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
                                <asp:ImageField HeaderText="Gambar" DataImageUrlField="GAMBAR_PATH" ControlStyle-Height="80" ControlStyle-Width="80" >
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
    <!--  Edit SKU modal box -->
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
                                <asp:Label ID="lbeditidsku" runat="server" Text="" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label18" runat="server" Text="Qty :" />
                                <asp:Label ID="lbeditqty" runat="server" Text="" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label20" runat="server" Text="Harga :" />
                                <asp:Label ID="lbeditharga" runat="server" Text="" />
                            </div>
                            <br />
                            <div class="form-group">
                                <asp:Label ID="Label16" runat="server" Text="SKU" />
                                <asp:TextBox ID="tbeditsku" onkeyup="SetButtonStatus2()" CssClass="form-control" runat="server" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label17" runat="server" Text="Nama SKU" />
                                <asp:TextBox ID="tbeditnamasku" onkeyup="SetButtonStatus2()" CssClass="form-control" runat="server" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label19" runat="server" Text="Berat" />
                                <asp:TextBox ID="tbeditberat" onkeyup="SetButtonStatus2()" CssClass="form-control" runat="server" />
                            </div>
                            <br />
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Gambar Produk" />
                                <asp:Label ID="lbPathGambar" runat="server" Text="~Path" style="display:none"/>
                                <asp:FileUpload id="inputfile2" runat="server" onchange="showimagepreview2(this)" accept=".jpg" style="display:none"/>
                            </div>                            
                            <img id="image_upload_preview2" class="img-thumbnail" src="Resources/insertgambar.jpg" style="cursor: pointer" alt="your image" height="150" width="150" />
                            <div style="display: none; width: 350px" id="dvFileErrorInfo2">
                                <asp:Label ID="tmWarning2" ForeColor="Red" Text="Size gambar harus di bawah 2 MB" runat="server" />
                            </div>
                            <script type="text/javascript">
                                function tampilGambar() {
                                    var pathGambar = document.getElementById("<%=lbPathGambar.ClientID %>").innerHTML;
                                    $('#image_upload_preview2').attr('src', pathGambar);
                                }
                            </script>
                            <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                            <script type="text/javascript">
                                $(function () {
                                    $("body").on("click", "#image_upload_preview2", function () {
                                        document.getElementById("<%=inputfile2.ClientID %>").click();
                                    });
                                });
                            </script>
                            <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
                            <script type="text/javascript">
                                function showimagepreview2(input) {
                                    if (input.files && input.files[0]) {
                                        if (input.files[0].size > 2097152) {
                                            $get("dvFileErrorInfo2").style.display = 'inline';
                                            input.value = "";
                                            $('#image_upload_preview2').attr('src', "Resources/insertgambar.jpg");
                                            return;
                                        }
                                        $get("dvFileErrorInfo2").style.display = 'none';
                                        var filerdr = new FileReader();
                                        filerdr.onload = function (e) {
                                            $('#image_upload_preview2').attr('src', e.target.result);
                                        }
                                        filerdr.readAsDataURL(input.files[0]);
                                    }
                                }
                            </script>
                            <script type="text/javascript">
                                function SetButtonStatus2() {
                                    var tbeditSKU = document.getElementById('<%=tbeditsku.ClientID%>').value;
                                    var tbeditNamaSKU = document.getElementById('<%=tbeditnamasku.ClientID%>').value;
                                    var tbeditBerat = document.getElementById('<%=tbeditberat.ClientID%>').value;
                                    //Change these conditions as your requirement
                                    if (tbeditSKU == "" || tbeditNamaSKU == "" || tbeditBerat == "") {
                                        document.getElementById('<%=BtnMdlUpdateSKU.ClientID%>').disabled = true;
                                        document.getElementById('<%=BtnMdlDeleteSKU.ClientID%>').disabled = true;
                                    }
                                    else {
                                        document.getElementById('<%=BtnMdlUpdateSKU.ClientID%>').disabled = false;
                                        document.getElementById('<%=BtnMdlDeleteSKU.ClientID%>').disabled = false;
                                    }
                                }
                            </script>
                            <script type="text/javascript">
                            function DisableButton2() {
                                document.forms[0].submit();
                                window.setTimeout("disableButton2('" +
                                    window.event.srcElement.id + "')", 0);
                            }
                            function disableButton2(buttonID) {
                                document.getElementById(buttonID).disabled = true;
                                }
                        </script>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="BtnMdlUpdateSKU" runat="server" Text="Update" CssClass="btn btn-info" OnClick="BtnMdlUpdateSKU_Click" />
                            <asp:Button ID="BtnMdlDeleteSKU" runat="server" Text="Hapus" CssClass="btn btn-danger" OnClick="BtnMdlDeleteSKU_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="BtnMdlUpdateSKU" />
                       
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
	<!-- /Update modal box *arron-->

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
                                <asp:TextBox ID="tbnewSKU" onkeyup="SetButtonStatus()" CssClass="form-control" runat="server" Text="" placeholder="Masukan Kode SKU" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label21" runat="server" Text="Nama SKU" />
                                <asp:TextBox ID="tbnewNamaSKU" onkeyup="SetButtonStatus()" CssClass="form-control" runat="server" Text="" placeholder="Masukan Nama Barang"/>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label22" runat="server" Text="Berat" />
                                <asp:TextBox ID="tbnewBerat" onkeyup="SetButtonStatus()" CssClass="form-control" runat="server" Text="" placeholder="Masukan Berat Barang"/>
                            </div>
                            <br />
                            <div class="form-group">
                                <asp:Label ID="Label9" runat="server" Text="Gambar Produk" />
                                <asp:FileUpload id="inputfile" runat="server" onchange="showimagepreview(this)" accept=".jpg" style="display:none"/>
                            </div>                            
                            <img id="image_upload_preview" class="img-thumbnail" src="Resources/insertgambar.jpg" style="cursor: pointer" alt="your image" height="150" width="150" />
                            <div style="display: none; width: 350px" id="dvFileErrorInfo">
                                <asp:Label ID="tmWarning" ForeColor="Red" Text="Size gambar harus di bawah 2 MB" runat="server" />
                            </div>
                            <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                            <script type="text/javascript">
                                $(function () {
                                    $("body").on("click", "#image_upload_preview", function () {
                                        document.getElementById("<%=inputfile.ClientID %>").click();
                                    });
                                });
                            </script>
                            <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
                            <script type="text/javascript">
                                function showimagepreview(input) {
                                    if (input.files && input.files[0]) {
                                        if (input.files[0].size > 2097152) {
                                            $get("dvFileErrorInfo").style.display = 'inline';
                                            input.value = "";
                                            $('#image_upload_preview').attr('src', "Resources/insertgambar.jpg");
                                            return;
                                        }
                                        $get("dvFileErrorInfo").style.display = 'none';
                                        var filerdr = new FileReader();
                                        filerdr.onload = function (e) {
                                            $('#image_upload_preview').attr('src', e.target.result);
                                        }
                                        filerdr.readAsDataURL(input.files[0]);
                                    }
                                }
                            </script>
                            <script type="text/javascript">
                                function SetButtonStatus() {
                                    var tbnewSKU = document.getElementById('<%=tbnewSKU.ClientID%>').value;
                                    var tbnewNamaSKU = document.getElementById('<%=tbnewNamaSKU.ClientID%>').value;
                                    var tbnewBerat = document.getElementById('<%=tbnewBerat.ClientID%>').value;
                                    //Change these conditions as your requirement
                                    if (tbnewSKU == "" || tbnewNamaSKU == "" || tbnewBerat == "") {
                                        document.getElementById('<%=BtnManualAddSaveSku.ClientID%>').disabled = true;
                                    }
                                    else {
                                        document.getElementById('<%=BtnManualAddSaveSku.ClientID%>').disabled = false;
                                    }
                                }
                            </script>
                            <script type="text/javascript">
                            function DisableButton() {
                                document.forms[0].submit();
                                window.setTimeout("disableButton('" +
                                    window.event.srcElement.id + "')", 0);
                            }

                            function disableButton(buttonID) {
                                document.getElementById(buttonID).disabled = true;
                            }
                            function BeginRequestHandler(sender, args) { var oControl = args.get_postBackElement(); oControl.disabled = true; }
                        </script>
                        </div>
                        <div class="col-xs-6 col-md-3"></div>
                        <div class="modal-footer">
                            <asp:Button ID="BtnManualAddSaveSku" runat="server" Text="Simpan" CssClass="btn btn-info" OnClick="BtnManualAddSaveSku_Click" Enabled="False" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="BtnManualAddSaveSku" />
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
                    <h4 class="modal-title" id="myModalLabel2">Konfirmasi</h4>
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
