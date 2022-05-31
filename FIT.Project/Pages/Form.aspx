<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="FIT.Project.Pages.Form" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Form</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Konu Oluşturun
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form role="form">
                                        <div class="form-group">
                                            <label>Kullanıcı&nbsp;&nbsp;&nbsp; </label>(Kullanıcı adı giriniz.)<p class="help-block">&nbsp;<asp:TextBox ID="txtKullanici" runat="server" class="form-control"></asp:TextBox>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Başlık&nbsp;&nbsp;&nbsp; </label>(Konu başlığı giriniz.)<p class="help-block">&nbsp;<asp:TextBox ID="txtBaslik" runat="server" class="form-control"></asp:TextBox>
                                            
                                                
                                        </div>
                                        <div class="form-group">
                                            <label>Etiket&nbsp;&nbsp;&nbsp; </label>(Birden fazla etiket girecekseniz "Virgül" (,) kullanarak etiketleri ayırmalısınız.)<p class="help-block">&nbsp;<asp:TextBox ID="txtEtiket" runat="server" class="form-control"></asp:TextBox>
                                          
                                        </div>
                                        <div class="form-group">
                                            <label>Dosya Seçin </label>
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <label>Metin Kutusu</label>
                                            <CKEditor:CKEditorControl ID="ckeditor" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>

                                        </div>
                                        <asp:Button ID="btnGonder" runat="server" class="btn btn-default" Text="Kaydet" OnClick="btnGonder_Click"></asp:Button>
                                </div>

                                <!-- /.col-lg-6 (nested) -->

                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
 
   

</asp:Content>