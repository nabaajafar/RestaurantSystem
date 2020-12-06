<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="AdminServices.aspx.cs" Inherits="Royal_Restaurant.AdminServices" %>
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
                                    <li class="breadcrumb-item active">Admin Services</li>
                                </ol>
                            </div>
                          <h4 class="page-title">Admin Services </h4>
                        </div>
                    </div>
                </div>

        <div class="row mt-5 mb-5">
            <div class="col-lg-12 rounded border border-warning py-3 shadow-sm">
            
                	

        <div class="row py-1">

               <div class="col-lg-4">
                    
                   <a href="AdminEmployees.aspx" class="btn btn-block">
                       <img class="img-fluid border rounded rounded-pill shadow-sm p-2" src="assets/images/add.png"  alt="Card image cap">
                       
                   </a>
                   <h5 class="text-center bg-secondary text-light card-header mt-2 rounded">Employees</h5>
                </div>

             <div class="col-lg-4">
                    
                   <a href="AdminViewDishes.aspx" class="btn btn-block">
                       <img class="img-fluid border rounded rounded-pill shadow-sm p-2" src="assets/images/veiw.png"  alt="Card image cap">
                       
                   </a>
                   <h5 class="text-center bg-secondary text-light card-header mt-2 rounded">Dishes</h5>
                </div>

             <div class="col-lg-4">
                    
                   <a href="Discounts.aspx" class="btn btn-block">
                       <img class="img-fluid border rounded rounded-pill shadow-sm p-2" src="assets/images/activity.png"  alt="Card image cap">
                       
                   </a>
                   <h5 class="text-center bg-secondary text-light card-header mt-2 rounded">Discounts</h5>
                </div>

        


              
            </div>
       	
 
  

            </div>
        </div>

</div>

</asp:Content>
