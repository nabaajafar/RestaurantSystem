<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="AdminEmployees.aspx.cs" Inherits="Royal_Restaurant.AdminEmployees" %>
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
                                      <li class="breadcrumb-item active">Employees</li>
                                </ol>
                            </div>
                                <h4 class="page-title">List Of Employees </h4>
                        </div>
                    </div>
                </div>

      <div class="rounded border border-light shadow shadow-sm py-3 mt-3 mb-3">
                

                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT * FROM [Users]">
                          
                      </asp:SqlDataSource>

          <a href="AdminEmployee.aspx" class="btn btn-sm btn-secondary"> + Add New Employee</a>
         <div class="row mt-2"></div>
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="100%" DataKeyNames="UserID" DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanging="GridView1_SelectedIndexChanging"
               EmptyDataText ="There is no row found !!!"
              >
              <AlternatingRowStyle BackColor="White" />
              <Columns>

          

                  <asp:CommandField ShowSelectButton="True" />

          

                  <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                  <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                  <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                  <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                  <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                
       
                  <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                  <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                  <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                  <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                  <asp:TemplateField HeaderText="UserLevel">
                      <ItemTemplate>
                          <asp:Label runat="server" Text='<%# (Eval("UserLevel").ToString() == "1")? "Admin": "Employee" %>' SortExpression="UserLevel"></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
               
                
                   
       
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
