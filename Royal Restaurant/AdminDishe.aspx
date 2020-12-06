<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="AdminDishe.aspx.cs" Inherits="Royal_Restaurant.AdminDishe" %>
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
                                       <li class="breadcrumb-item"><a href="/AdminViewDishes.aspx">Dishes</a></li>
                                    <% if (DisheIdSelect == 0)
                                        { %>
                                          <li class="breadcrumb-item active">Add New Dishe</li>
                                    
                                    <%}else{ %>
                                <li class="breadcrumb-item active">#<%: DisheIdSelect %></li>
                                     <%} %>
                                </ol>
                            </div>

                             <% if (DisheIdSelect == 0)
                                        { %>
                                         <h4 class="page-title">Add New Dishe</h4>
                                    
                                    <%}else{ %>
                                 <h4 class="page-title">Edit Dishe #<%: DisheIdSelect %></h4>
                                     <%} %>

                          
                        </div>
                    </div>
                </div>



           

              <div class="row  mb-5 p-5 rounded border border-warning py-3 shadow-sm">
            
  <div class="col-lg-8">

                        <div class="form-group">
                       
                        <div class="col ">
                        <label>Categories</label>
                        <asp:DropDownList ID="DropDownListDisheType" CssClass="form-control" runat="server"   AutoPostBack="false">
                        <asp:ListItem Value=""> Select Category</asp:ListItem>
                        <asp:ListItem Value="Main">Main</asp:ListItem>
                        <asp:ListItem Value="Seafood">Seafood</asp:ListItem>
                        <asp:ListItem Value="Sweet">Sweet</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListDisheType" ErrorMessage="Category is a required." ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        </div>

                        </div>



        <div class="form-group">
				<div class="col">
                    <label>Name</label>
                    <asp:TextBox runat="server" ID="DisheName"  CssClass="form-control"  placeholder="Dishe Name" />
                    <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator1" runat="server" ControlToValidate="DisheName" ErrorMessage="Dishe Name is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </div>     	
        </div>

                  <div class="form-group">
				<div class="col">
               <label>Description</label>
                    <asp:TextBox runat="server" ID="DisheDescription" TextMode="MultiLine"  CssClass="form-control"  placeholder="Dishe Description" />
                    <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator2" runat="server" ControlToValidate="DisheDescription" ErrorMessage="Dishe Description is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </div>     	
        </div>

                
             
        <div class="form-group">
			<div class="col">
                 <label>Price</label>
                     <asp:TextBox runat="server" ID="DishePrice" CssClass="form-control" placeholder="Dishe Price" />
                <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator4" runat="server" ControlToValidate="DishePrice" ErrorMessage="Dishe Price is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator runat="server" ID="rev1" ControlToValidate="DishePrice" CssClass="text-danger font-weight-bolder float-left"
    ValidationExpression="^\d*[0-9](?:\.[0-9]{1,2})?$" ErrorMessage="Number only #.##"
    Display="Dynamic"></asp:RegularExpressionValidator>

				</div>      	
        </div>


                   <div class="form-group">
				<div class="col">
             
                 
                    </div>     	
        </div>


            </div>

                    <div class="col-lg-4">

                                                     <div class="form-group">
			<div class="col">
                   <asp:Button runat="server" ID="btnDownloadImage" Visible="false" Text="Download Image" CssClass="btn btn-light btn-sm float-right" OnClick="downloadImage"  />
                      <asp:Image runat="server" ID="DisheImage" CssClass="img-thumbnail border rounded shadow-sm" ImageUrl="~/assets/images/dishes/empty_image.png"  />
            <asp:FileUpload runat="server" ID="FileUpload1"  CssClass=" mt-2" placeholder="Dishe Image"   />
                     
                <asp:RequiredFieldValidator 
                        id="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Dishe Image is a required field." ForeColor="Red">
                    </asp:RequiredFieldValidator>

				</div>      	
        </div>


                      <div class="form-group">
			<div class="col">
        <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-warning btn-lg btn-block " Text="Submit" OnClick="doSubmit" />
        <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger btn-lg btn-block " Text="Delete" OnClientClick='return confirm("Are you sure you want to delete this Dishe ?");' OnClick="deleteDishe" Visible="false" />
                

        <button type="reset" runat="server" id="btnReset" class="btn btn-light btn-lg btn-block">Reset</button>
				</div>      	
        </div>

		


            </div>

            

        </div>
    </div>
    
</asp:Content>

