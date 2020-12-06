<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="Royal_Restaurant.Help" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        

        <h1>Help</h1>
        <div class="row  mb-5 p-5 rounded border border-warning py-3 shadow-sm">
            
    <div class="col-lg-4 offset-2">

        <div class="form-group">
            <div class="col">
                <label>First Name</label>
                <asp:TextBox runat="server" ID="FirstName"  CssClass="form-control"  placeholder="First Name" />
                    <asp:RequiredFieldValidator 
                    id="RequiredFieldValidator1" runat="server" ControlToValidate="FirstName" ErrorMessage="First Name is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
            </div>     	
        </div>

        <div class="form-group">
            <div class="col">
                <label>Email</label>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Invalid Email" Font-Bold="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass=" text-danger float-right"></asp:RegularExpressionValidator>
                <asp:TextBox runat="server" ID="Email"  CssClass="form-control"  placeholder="Email" />
                    <asp:RequiredFieldValidator 
                    id="RequiredFieldValidator3" runat="server" ControlToValidate="Email" ErrorMessage="Email is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
               
                
            </div>     	
        </div>


        </div>

                  <div class="col-lg-4">

      
        <div class="form-group">
            <div class="col">
                <label>Last Name</label>
                <asp:TextBox runat="server" ID="LastName"  CssClass="form-control"  placeholder="Last Name" />
                 
            </div>     	
        </div>


        <div class="form-group">
            <div class="col">
                <label>Phone Number</label>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="PhoneNumber" ErrorMessage="Only 10 Numbers" CssClass=" float-right text-danger" Font-Bold="true" ValidationExpression="^[0-9]{10,10}$"></asp:RegularExpressionValidator>
                <asp:TextBox runat="server" ID="PhoneNumber"  CssClass="form-control"  placeholder="Phone Number" MaxLength="10"/>
                    <asp:RequiredFieldValidator 
                    id="RequiredFieldValidator6" runat="server" ControlToValidate="PhoneNumber" ErrorMessage="Phone Number is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
            </div>     	
        </div>
                

    </div>


    <div class="col-lg-8 offset-2">

        <div class="form-group">
				<div class="col">
               <label>Description</label>
                    <asp:TextBox runat="server" ID="Description" TextMode="MultiLine"  CssClass="form-control"  placeholder="Description" />
                    <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator2" runat="server" ControlToValidate="Description" ErrorMessage="Description is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </div>     	
        </div>


            <div class="form-group">
				<div class="col">
                        <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-warning btn-lg float-right" Text="Submit" OnClick="doSubmit" />
                        <button type="reset" runat="server" id="btnReset" class="btn btn-light btn-lg float-left">Reset</button>
                    </div>
                </div>
    </div>

                  </div>
        </div>
    
   
    
</asp:Content>


