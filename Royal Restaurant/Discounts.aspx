<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="Discounts.aspx.cs" Inherits="Royal_Restaurant.Discounts" %>
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
                                      <li class="breadcrumb-item active">Discounts</li>
                                </ol>
                            </div>
                                <h4 class="page-title">Discounts </h4>
                        </div>
                    </div>
                </div>

   
            <div class="row  mb-5 p-5 rounded border border-warning py-3 shadow-sm">
            
                <div class="col-lg-4 offset-lg-3">

                     <div class="form-group">
				<div class="col">
                    <label>Discount Code</label>
                
                    <asp:Label runat="server" ID="codeUpdate"></asp:Label>
                 
                    <asp:TextBox runat="server" ID="DiscountCode"  CssClass="form-control"  placeholder="" />
                   
                    </div>     	
        </div>

                    
        <div class="form-group">
		<div class="col">
        <asp:Button runat="server" ID="btnDiscounts" CssClass="btn btn-warning btn-lg btn-block " Text="Save" OnClick="doDiscounts" />
        <asp:Button runat="server" ID="btnReset1" CssClass="btn btn-light btn-lg btn-block" Text="Reset" OnClick="doReset" />
   
				</div>      	
        </div>
                </div>
             
            </div>
</div>
    
</asp:Content>
