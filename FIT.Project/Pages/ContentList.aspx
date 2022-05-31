<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true" CodeBehind="ContentList.aspx.cs" Inherits="FIT.Project.Pages.ContentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

              
   
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
       
                    <h3 class="page-header">Content List</h3>

                  <asp:Repeater ID="Repeater1" runat="server">



                                <ItemTemplate>
                                     
 
                                      
   <asp:Button ID="btnBaslik" CssClass="btn btn-default" style="margin:10px;margin-right:20px" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Keys")%>' PostBackUrl='<%#DataBinder.Eval(Container.DataItem, "TagID","/~/Pages/ContentList.aspx?TagID={0}")%>'></asp:Button>
                                     
                                  
                                </ItemTemplate>
                            </asp:Repeater>
</div>
              
                
                </div>
            </div>
            </div>
</asp:Content>