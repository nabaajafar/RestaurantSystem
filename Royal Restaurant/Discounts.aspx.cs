using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Royal_Restaurant
{
    public partial class Discounts : AdminServices
    {
        string mDiscountCode = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            ms = (MasterSite)this.Master;

            if (!ms.isLoggedIn() || !ms.isAdmin())
            {
                Response.Redirect("/Login.aspx");
            }

            mDiscountCode = ms.getFromSettings("DiscountCode");

            //Response.Write("mDiscountCode " + mDiscountCode);
            DiscountCode.Text = mDiscountCode;
        }

        
            protected void doReset(object sender, EventArgs e)
            {
                DiscountCode.Text = "";
          
            }
            protected void doDiscounts(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(((MasterSite)this.Master).MyConnection);
                con.Open();
                string tbDiscountCode = DiscountCode.Text;
                string newCode = Request.Form["ctl00$ContentPlaceHolder1$DiscountCode"].ToString();
                SqlCommand cmd = new SqlCommand("Update Settings SET DiscountCode = @DiscountCode Where id = 1 ", con);
                cmd.Parameters.AddWithValue("@DiscountCode", newCode);

                cmd.ExecuteNonQuery();
                con.Close();

                if(DiscountCode != null && newCode != mDiscountCode)
                {
                    if (newCode == "")
                    {
                        codeUpdate.Text = "<hr><span class='text-warning'> Code has been removed</span><hr>";
                    }
                    else { 
                    codeUpdate.Text = "<hr><span class='text-success'> Done New Code :  { " + newCode + "} </span><hr>";
                    }
                    DiscountCode.Text = newCode;
                }
                else
                {
                    codeUpdate.Text = "<hr><span class='text-info'> There is no change </span><hr>";
                }
                
               // Response.Redirect("AdminServices.aspx");

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        

    }
}