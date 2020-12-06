<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Royal_Restaurant.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div class="row justify-content-center align-items-center ">

            <div class="mt-5 col-lg-2  ">


    <asp:Login ID="Login1"  runat="server" Width="100%">
                    <LayoutTemplate>
                        </div>

    <div id="login">
       
         <div id="login-row" class=" border rounded shadow-sm mb-5">
               
                <div id="login-column">
                    <div id="login-box" class="col-lg-12 p-4">
              
                            <h3 class="text-center text-warning font-weight-bolder">Login</h3>
                           

                          <div class="form-group text-danger">
                              <hr />
                               <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                               </div>

                            <div class="form-group">
                                <label for="username" class="text-secondary">Username:</label> 
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                                
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-secondary">Password:</label>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                
                            </div>
                         
                          
                            <div class="form-group">
                                
                                  <asp:CheckBox ID="RememberMe" runat="server" Text=" Remember me next time." />

                            </div>

                        <div class="form-group">
                               <asp:Button ID="LoginButton" runat="server" CssClass="btn btn-warning btn-block " CommandName="Login" Text="Log In" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                            </div>
                           
                     
                    </div>
                </div>
            </div>
    </div>

                    </LayoutTemplate>

            </asp:Login>

              
    
        </div>

            </div>

</asp:Content>
