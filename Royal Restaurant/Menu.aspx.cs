
using System;

using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Royal_Restaurant
{
    public partial class Menu : System.Web.UI.Page
    {

        MasterSite ms;
        protected void Page_Load(object sender, EventArgs e)
        {
            ms = ((MasterSite)this.Master);

            if (!ms.isLoggedIn())
            {
                Response.Redirect("/");
            }

            int orderId = ms.getLastOrderOpen();

            if (orderId <= 0)
            {
                createNewOrder();
            }

            if (orderId > 0)
            {
                lastIdOpen.Text = "" + orderId;

            }

        }

        private void createNewOrder()
        {
            try
            {
                SqlConnection con = new SqlConnection(((MasterSite)this.Master).MyConnection);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Orders(UserId) values(@UserId)", con);
                cmd.Parameters.AddWithValue("UserId", ms.getUID());
                cmd.ExecuteScalar();
                //int newId = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                Response.Redirect("/Menu.aspx");

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


        }


    protected void doAddToCart(object sender, EventArgs e)
        {
            int orderId = int.Parse(lastIdOpen.Text.ToString());

            Button btn = (Button)sender;
            int DisheID = int.Parse(btn.CommandArgument.ToString());
            string id = ms.getValue("id", "OrderList", " OrderID = " + orderId + " AND DisheID = " + DisheID);

            if (DisheID >0)
            {

                try
                {
                    SqlConnection con = new SqlConnection(((MasterSite)this.Master).MyConnection);
                    con.Open();
                    SqlCommand cmd;
                    if (id == "")
                    {
                       
                        cmd = new SqlCommand("insert into OrderList(OrderID, DisheID, Quntity) values(@OrderID,@DisheID,@Quntity)", con);
                        cmd.Parameters.AddWithValue("OrderID", orderId);
                        cmd.Parameters.AddWithValue("DisheID", DisheID);
                        cmd.Parameters.AddWithValue("Quntity", "1");
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {

              
                        string Quntity = ms.getValue("Quntity", "OrderList", " id = " + id);
                        cmd = new SqlCommand("Update OrderList set Quntity = '"+ (int.Parse(Quntity) + 1) + "' Where id = " + id, con) ;
                        cmd.ExecuteNonQuery();
                        con.Close();
                }
                    Response.Redirect("/Menu.aspx");

                }
                    catch (Exception ex)
                {
                    Response.Write(ex.Message + " " + id);
                }

            }

        }

    protected void doClearOrder(object sender, EventArgs e)
            {
            int OrderID = int.Parse(lastIdOpen.Text.ToString());
            if (OrderID > 0)
            {

                try
                {
               
                    SqlConnection con = new SqlConnection(((MasterSite)this.Master).MyConnection);

                    con.Open();
                    string qry = "Delete OrderList where OrderID = " + OrderID;

                    SqlCommand cmd = new SqlCommand(qry, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                        Response.Redirect("/Menu.aspx");
                }
                catch (Exception)
                {
                }

            }

        }

    protected void doCheck(object sender, EventArgs e)
        {
            string DiscountCode = ms.getValue("DiscountCode", "Settings", " id = 1");
            //ms.getFromSettings("DiscountCode");

            if(disCode.Text.Length > 0 && disCode.Text != DiscountCode)
            {
                ms.AlertError("The Discount Code is incorrect !!!");
                
            }
            else { 



            int OrderID = int.Parse(lastIdOpen.Text.ToString());
    
         
            if (OrderID > 0)
            {

                try
                {
                    float Amount = float.Parse(totalLabel.Text.ToString());

                
                    if (disCode.Text == DiscountCode)
                    {
                            var result = 5 * ((decimal)Amount) / 100;
                            float dis = Amount - float.Parse(result.ToString());


                            Amount = dis;

                    }

                    SqlConnection con = new SqlConnection(((MasterSite)this.Master).MyConnection);
                    con.Open();

                    SqlCommand cmd = new SqlCommand("insert into Bill(Amount, UserID) values(@Amount, @UserID)", con);
                    cmd.Parameters.AddWithValue("Amount", Amount);
                    cmd.Parameters.AddWithValue("UserID", ms.getUID());
                        
                    cmd.ExecuteNonQuery();
                  

                    cmd = new SqlCommand("Update Orders set CloseTime = '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' Where OrderID = " + OrderID, con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    if (disCode.Text == DiscountCode)
                    {
                        ms.AlertDone("Congratulations, I got a 5% discount The Total Amount is <strong>" + Amount + "</strong>");
                    }
                    else
                    {
                        Response.Redirect("/Menu.aspx");
                    }
                        
                }
                catch (Exception)
                {
                }

            }
            }

        }

    protected void doDeleteItem(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = int.Parse(btn.CommandArgument.ToString());
            if (id > 0)
            {

                try
                {

                    SqlConnection con = new SqlConnection(((MasterSite)this.Master).MyConnection);

                    con.Open();
                    string qry = "Delete OrderList where id = " + id;

                    SqlCommand cmd = new SqlCommand(qry, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("/Menu.aspx");
                }
                catch (Exception)
                {
                }

            }

        }

    protected void ListView2_DataBound(object sender, EventArgs e)
        {
            
          
            Label lb =  (Label)ListView2.FindControl("TotalOfLIst");
            lb.Text = "" + total;

          
        }

    int total = 0;
    protected void ListView2_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
           

            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label TotalOfLIst = (Label)e.Item.FindControl("TotalOfLIst");
    

                total = total + Convert.ToInt32(TotalOfLIst.Text.ToString());
                totalLabel.Text = "" + total;

            }

         

        }

        protected void ListView2_DataBound1(object sender, EventArgs e)
        {
            if (ListView2.Items.Count <= 0)
            {
                btnSubmit.Enabled = false;
            }
            else
            {
                btnSubmit.Enabled = true;
            }
        }
    }
}