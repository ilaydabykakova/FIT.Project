<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true" CodeBehind="Etiket.aspx.cs" Inherits="FIT.Project.Pages.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="post-preview preview-medium">
                        <!-- Post Title & Meta -->
                        <h2><a href="Örnek_Girdi.aspx" class="dark-link">Deneme Amaçlı Başlık</a></h2>
                        <div class="post-meta">
                              <a href="Etiket.aspx" class="dark-link">C#</a>
                           <%-- <span class="meta-tags">Kategoriler: C#  </span>--%>
                        </div>
                        <!-- End Post Title & Meta -->                        
                        <div>
                            <p>
                               Konu hakkında kısa bir açıklamada bulunan paragraf. 
                            </p>
                            
                                <a href="Örnek_Girdi.aspx"><i class=""></i> Devamı...</a>
                            
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        
        <!-- /.container-fluid -->
    </div>
                    
                       
</asp:Content>