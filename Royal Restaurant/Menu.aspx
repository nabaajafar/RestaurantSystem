<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Royal_Restaurant.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
.img-responsive {
    width: auto;
    height: 200px;
}
    </style>
      <div class=" container-fluid">
     
        <div class="row  mb-5 p-3">

            <div class="col-lg-9">
             
                <div class="row p-5">
                    <div class="col-12">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT * FROM [Dishes]"></asp:SqlDataSource>
                    <div class="row">
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="DisheID" DataSourceID="SqlDataSource1" GroupItemCount="1">
                        <EmptyDataTemplate>
                            <table >
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
           
                        <EmptyItemTemplate>
                            <td runat="server" />
                        </EmptyItemTemplate>
                        <GroupTemplate>
                                <div id="itemPlaceholderContainer" runat="server" class="col-lg-2" >
                                     <div  id="itemPlaceholder" runat="server">
                                     </div>
                                 </div>
                              
                        </GroupTemplate>
               
           
                        <ItemTemplate>
                                <div class="mb-3" >

                       
                                   <img src="assets/images/dishes/<%# Eval("DisheImage") %>" class=" img-responsive img-thumbnail rounded shadow-sm" style="width:100%"  alt="work-thumbnail">
                             
                                
                                <h4 class="text-center mt-2"><%# Eval("DisheName") %></h4>
                                <h6 class="text-center mt-2 "><%# Eval("DishePrice") %> SR</h6>

                                <asp:Button runat="server"  OnClick="doAddToCart"  CssClass="btn btn-warning btn-block" CommandArgument='<%# Eval("DisheID") %>' Text='Add'  />

                       
                        </div>

                   
                        </ItemTemplate>
                         <LayoutTemplate>
                               
                                  <div class="row" runat="server">   
                                      <div id="groupPlaceholderContainer" runat="server" class="row">
                                          <div id="groupPlaceholder" runat="server" class="row">
                                        
                                          </div>
                                      </div>
                           
                                 </div>
                                 
                             </LayoutTemplate>
                 
                        <SelectedItemTemplate>
                            <td runat="server" style="">DisheID:
                                <asp:Label ID="DisheIDLabel" runat="server" Text='<%# Eval("DisheID") %>' />
                                <br />
                                DisheName:
                                <asp:Label ID="DisheNameLabel" runat="server" Text='<%# Eval("DisheName") %>' />
                                <br />
                                DisheDescription:
                                <asp:Label ID="DisheDescriptionLabel" runat="server" Text='<%# Eval("DisheDescription") %>' />
                                <br />
                                DisheType:
                                <asp:Label ID="DisheTypeLabel" runat="server" Text='<%# Eval("DisheType") %>' />
                                <br />
                                DishePrice:
                                <asp:Label ID="DishePriceLabel" runat="server" Text='<%# Eval("DishePrice") %>' />
                                <br />
                                DisheImage:
                                <asp:Label ID="DisheImageLabel" runat="server" Text='<%# Eval("DisheImage") %>' />
                                <br />
                                UserId:
                                <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                                <br />
                            </td>
                        </SelectedItemTemplate>
                 
                    </asp:ListView>
      </div>
            </div>           
      
                       </div>

                </div>
                        <div class="col-lg-3 rounded border border-warning py-3 shadow-sm">
            
                		<h4 class=" p-2  text-black">List Of Order # <asp:Label runat="server" ID="lastIdOpen"></asp:Label>
                    
                        </h4>


  

		<div class="form-group">


            <asp:ListView ID="ListView2" runat="server" DataKeyNames="Id,Expr1" DataSourceID="SqlDataSource2" OnItemDataBound="ListView2_ItemDataBound" OnDataBound="ListView2_DataBound1">
         
          
     
   
                <ItemTemplate>
              
                    <tr >
                    
                         <td>
                             <asp:Image runat="server"   ImageUrl='<%# "assets/images/dishes/" + Eval("DisheImage") %>'  CssClass=" card-img" Height="40"/>
                          
                        </td>
                        <td>
                            <asp:Label ID="DisheNameLabel" runat="server" Text='<%# Eval("DisheName") %>' />
                        </td>
                         <td>
                            <asp:Label ID="DishePriceLabel" runat="server" Text='<%# Eval("DishePrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="QuntityLabel" runat="server" Text='<%# Eval("Quntity") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TotalOfLIst" runat="server" Text='<%# String.Format("{0}",Convert.ToInt32(Eval("DishePrice"))  * Convert.ToInt32(Eval("Quntity"))) %>' />
                        </td>
                       <td>
                           <asp:Button runat="server"  Text="Delete" OnClick="doDeleteItem"  CssClass="btn btn-sm btn btn-danger " CommandArgument='<%# Eval("id") %>'/>
                       </td>
                    
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" class="table " runat="server"  style=" width:100%">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">Name</th>
                                        <th runat="server">Price</th>
                                        <th runat="server">Quntity</th>
                                         <th runat="server">Total</th>
                                           <th runat="server">Delete</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                          
                        </tr>
               
                   
                    </table>
                </LayoutTemplate>
  
            </asp:ListView>

            <table class="table">
                    <tr>
                    
                     <th>
                         Discount Code
                     </th>
                    <td>
                        <asp:TextBox runat="server" ID="disCode" CssClass="form-control" ></asp:TextBox>
                    </td>
                </tr>
                      <tr>
                    
                     <th>
                         Total
                     </th>
                    <td>
                        <asp:Label runat="server" ID="totalLabel" ></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT OrderList.Id, OrderList.OrderID, OrderList.DisheID, OrderList.Quntity, Dishes.DisheID AS Expr1, Dishes.DisheName, Dishes.DisheDescription, Dishes.DisheType, Dishes.DishePrice, Dishes.DisheImage, Dishes.UserId FROM OrderList INNER JOIN Dishes ON OrderList.DisheID = Dishes.DisheID WHERE (OrderList.OrderID = @OrderID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lastIdOpen" Name="OrderID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

       
            <hr />
              <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-warning btn-lg float-right" Text="Check" OnClick="doCheck" />  
            <asp:Button runat="server" ID="btnClear" OnClick="doClearOrder" CssClass="btn btn-danger btn-lg float-left" Text="Clear" />  
                
            
        </div>


            </div>
        </div>
</div>
</asp:Content>
