using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Royal_Restaurant
{
    public partial class AdminEmployees : AdminServices
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ms = (MasterSite)this.Master;

            if (!ms.isLoggedIn() || !ms.isAdmin())
            {
                Response.Redirect("/Login.aspx");
            }

            if (HttpContext.Current.Request.QueryString["valid"] != null)
            {
                if (HttpContext.Current.Request.QueryString["valid"].ToString() != "")
                {
                    ms.AlertDone("The employee is registered and the data is sent through email");
                }
            }

        }


        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string userId = GridView1.Rows[e.NewSelectedIndex].Cells[1].Text;
            e.Cancel = true;
            Response.Redirect("/AdminEmployee.aspx?userId=" + userId);
        }

        
    }
}