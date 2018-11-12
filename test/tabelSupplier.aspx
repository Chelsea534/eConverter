<%@ Page Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tabelSupplier.aspx.vb" Inherits="test.tabelSupplier" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Tabel Supplier</h1>
        </div>
    </div>

    <div id="updateAlert2" class="hidden alert alert-danger" role="alert" runat="server">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>ERROR!</strong> 1 Data telah ERROR!
    </div>
    <div id="updateAlert" class="hidden alert alert-success" role="alert" runat="server">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Success!</strong> 1 Data telah di update!
    </div>
    <asp:UpdatePanel ID="AddPanel1" runat="server">
        <ContentTemplate>
            
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button ID="BtnManualAddSaveSku" runat="server" Text="Simpan" CssClass="btn btn-info" OnClick="BtnManualAddSaveSku_Click" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript">
    $(document).ready(function () {
        window.setTimeout(function () {
            $(".alert").fadeTo(1500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 2000);
    });
    </script>
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