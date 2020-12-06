<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="AdminEmployee.aspx.cs" Inherits="Royal_Restaurant.AdminEmployee" %>
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
                                       <li class="breadcrumb-item"><a href="/AdminEmployees.aspx">Employees</a></li>
                                    <% if (EmployeeIdSelect == 0)
                                        { %>
                                          <li class="breadcrumb-item active">Add New Employee</li>
                                    
                                    <%}else{ %>
                                <li class="breadcrumb-item active">#<%: EmployeeIdSelect %></li>
                                     <%} %>
                                </ol>
                            </div>

                             <% if (EmployeeIdSelect == 0)
                                        { %>
                                         <h4 class="page-title">Add New Employee</h4>
                                    
                                    <%}else{ %>
                                 <h4 class="page-title">Edit Employee #<%: EmployeeIdSelect %></h4>
                                     <%} %>

                          
                        </div>
                    </div>
                </div>

            
              
        
        <div class="row  mb-5 p-5 rounded border border-warning py-3 shadow-sm">
            


            <div class="col-lg-6">
            
           

                      <div class="form-group">
                       
                       	<div class="col">
                                  <label>UserLevel</label>
                            <asp:DropDownList ID="UserLevel" CssClass="form-control" runat="server"   AutoPostBack="false">
                            <asp:ListItem Value=""> Select UserLevel</asp:ListItem>
                                <asp:ListItem Value="2">Employee</asp:ListItem>
                                <asp:ListItem Value="1">Admin</asp:ListItem>
                        </asp:DropDownList>
                                <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator8" runat="server" ControlToValidate="UserLevel" ErrorMessage="UserLevel is a required." ForeColor="Red">
                    </asp:RequiredFieldValidator>
				</div>

                       </div>

                

     

            

                
             
       

                      <div class="form-group">
                       
                       	<div class="col">
                                  <label>Gender</label>
                            <asp:DropDownList ID="Gender" CssClass="form-control" runat="server"   AutoPostBack="false">
                            <asp:ListItem Value=""> Select Gender</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:DropDownList>
                                <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator5" runat="server" ControlToValidate="Gender" ErrorMessage="Gender is a required." ForeColor="Red">
                    </asp:RequiredFieldValidator>
				</div>

                       </div>


                             <div class="form-group">
				<div class="col">
               <label>Age</label>
                    <asp:TextBox runat="server" ID="Age"   CssClass="form-control"  placeholder="Age" />
                    <asp:RangeValidator runat="server" id="rngDate" ControlToValidate="Age"  Type="Integer" minimumvalue="18" maximumvalue="45" errormessage="Please enter a valid Age 18~45" CssClass="text-danger font-weight-bold" />

                    <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator3" runat="server" ControlToValidate="Age" ErrorMessage="Age is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    

                    </div>     	
        </div>

        <div class="form-group">
				<div class="col">
               <label>Phone Number</label>
                    <asp:TextBox runat="server" ID="PhoneNumber"  CssClass="form-control"  placeholder="PhoneNumber" />
                    <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator6" runat="server" ControlToValidate="PhoneNumber" ErrorMessage="PhoneNumber is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </div>     	
        </div>

                <div class="form-group">
				<div class="col">
               <label>Email</label> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Invalid Email" Font-Bold="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass=" text-danger float-right"></asp:RegularExpressionValidator>
                    <asp:TextBox runat="server" ID="Email"  TextMode="Email"  CssClass="form-control"  placeholder="Email" />
                    <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator9" runat="server" ControlToValidate="Email" ErrorMessage="Email is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </div>     	
        </div>

                
                
                <div class="form-group">
			<div class="col">

        <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger btn-lg float-left"  Text="Delete" OnClientClick='return confirm("Are you sure you want to delete this Employee ?");' OnClick="deleteDishe" Visible="false" />
                

        <button type="reset" runat="server" id="btnReset" class="btn btn-light btn-lg  float-left">Reset</button>
				</div>      	
        </div>

	


            </div>

            <div class="col-lg-6">


                   <div class="form-group">
				<div class="col">
                    <label>Username</label>
                    <asp:TextBox runat="server" ID="Username"  CssClass="form-control"  placeholder="Username" />
                    <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator1" runat="server" ControlToValidate="Username" ErrorMessage="Username is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </div>     	
        </div>


                      <div class="form-group">
				<div class="col">
               <label>Password</label>
                    <asp:TextBox runat="server" ID="Password"  CssClass="form-control"  placeholder="Password" />
                    <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator2" runat="server" ControlToValidate="Password" ErrorMessage="Password is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </div>     	
        </div>


                 <div class="form-group">
			<div class="col">
                 <label>FullName</label>
                     <asp:TextBox runat="server" ID="FullName" CssClass="form-control" placeholder="FullName" />
                <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator4" runat="server" ControlToValidate="FullName" ErrorMessage="FullName is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>

                

				</div>      	
        </div>


                    <div class="form-group">
				<div class="col">
               <label>Salary</label>
                    <asp:TextBox runat="server" ID="Salary"  CssClass="form-control"  placeholder="Salary" />
                    <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator7" runat="server" ControlToValidate="Salary" ErrorMessage="Salary is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator runat="server" ID="rev1" ControlToValidate="Salary" CssClass="text-danger font-weight-bolder float-left"
    ValidationExpression="^\d*[0-9](?:\.[0-9]{1,2})?$" ErrorMessage="Number only #.##"
    Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>     	
        </div>


                          <div class="form-group">
			<div class="col">
        <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-warning btn-lg float-right " Text="Submit" OnClick="doSubmit" />
				</div>      	
        </div>

                </div>

       

        </div>
</div>
    
</asp:Content>

