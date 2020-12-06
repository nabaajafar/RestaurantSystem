using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;

namespace Royal_Restaurant
{
    
    public partial class Login : System.Web.UI.Page
    {
        
        MasterSite ms;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            ms = ((MasterSite)this.Master);
            
            if (ms.isLoggedIn())
            {
               Response.Redirect("/");
            }

            if (HttpContext.Current.Request.QueryString["valid"] != null)
            {
                Boolean valid =  Boolean.Parse(HttpContext.Current.Request.QueryString["valid"].ToString());

                if (!valid)
                {
                    ms.AlertError("Please check the username and password is incorrect !!!");
                }
            }

        }


            protected void LoginButton_Click(object sender, EventArgs e)
        {
            
            string query = "Select * From Users where Username='" + Login1.UserName.ToString() + "' and Password='" + Login1.Password.ToString() + "'";

            DataTable dt = ((MasterSite)this.Master).getDataByQuery(query);
            int userLevel = 0;
            
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];

                Session["userId"] = dr["UserId"].ToString();
                Session["username"] = dr["Username"].ToString();
                Session["fullName"] = dr["FullName"].ToString();
                userLevel = int.Parse(dr["UserLevel"].ToString());
                Session["userLevel"] = userLevel;
                Session["isLoggedIn"] = true;

                if (ms.isAdmin())
                {
                    Response.Redirect("AdminServices.aspx");
                }
                else
                {
                    Response.Redirect("Menu.aspx");

                }


            }
            else
            {
                Response.Redirect("/Login.aspx?valid=false");
            }

      
        }

   
    }
}