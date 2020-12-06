using System;

namespace Royal_Restaurant
{
    public partial class AdminServices : System.Web.UI.Page
    {
       public MasterSite ms;
        protected void Page_Load(object sender, EventArgs e)
        {
            ms = (MasterSite)this.Master;
           
            if (!ms.isLoggedIn() || !ms.isAdmin())
            {
                Response.Redirect("/Login.aspx");
            }

        }
    }
}