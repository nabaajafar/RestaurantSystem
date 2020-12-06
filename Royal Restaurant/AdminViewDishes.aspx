<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="AdminViewDishes.aspx.cs" Inherits="Royal_Restaurant.AdminViewDishes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

            <div class="row mb-3">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <div class="btn-group">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                                    <li class="breadcrumb-item"><a href="/AdminServices.aspx">Admin Services</a></li>
                                      <li class="breadcrumb-item active">Dishes</li>
                                </ol>
                            </div>
                                <h4 class="page-title">List Of Dishes </h4>
                        </div>
                    </div>
                </div>

      <div class="rounded border border-light shadow shadow-sm py-3 mt-3 mb-3">
                

                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT * FROM [Dishes] Order By [DisheID] DESC">
                          
                      </asp:SqlDataSource>

          <a href="AdminDishe.aspx" class="btn btn-sm btn-secondary"> + Add New Dishe</a>
         <div class="row mt-2"></div>
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="100%" DataKeyNames="DisheID" DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanging="GridView1_SelectedIndexChanging"
               EmptyDataText ="There is no row found !!!"
              >
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:CommandField ShowSelectButton="True" />
                  <asp:TemplateField >
                   <ItemTemplate>
                       <a href="<%# Eval("DisheImage","assets/images/dishes/{0}") %>" target="_blank">
                       <asp:Image ID="Image1" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("DisheImage","~/assets/images/dishes/{0}") %>'  />
                           </a>
                   </ItemTemplate>

<ControlStyle Width="50px"></ControlStyle>
                  </asp:TemplateField>

          

                  <asp:BoundField DataField="DisheID" HeaderText="DisheID" InsertVisible="False" ReadOnly="True" SortExpression="DisheID" />
                  <asp:BoundField DataField="DisheName" HeaderText="DisheName" SortExpression="DisheName" />
                  <asp:BoundField DataField="DisheDescription" HeaderText="DisheDescription" SortExpression="DisheDescription" />
                  <asp:BoundField DataField="DisheType" HeaderText="DisheType" SortExpression="DisheType" />
                  <asp:BoundField DataField="DishePrice" HeaderText="DishePrice" SortExpression="DishePrice" />
                
       
              </Columns>
                      <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#4F0000" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
          
              <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
              <SortedAscendingCellStyle BackColor="#FCF6C0" />
              <SortedAscendingHeaderStyle BackColor="#4D0000" />
              <SortedDescendingCellStyle BackColor="#FCF6C0" />
              <SortedDescendingHeaderStyle BackColor="#820000" />
                      </asp:GridView>



                </div>
        </div>

</asp:Content>
