using System.Web.UI.WebControls;

namespace Royal_Restaurant
{
    public partial class AdminViewDishes : AdminServices
    {
     
        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

          
             string disheId = GridView1.Rows[e.NewSelectedIndex].Cells[2].Text;



            e.Cancel = true;
            Response.Redirect("/AdminDishe.aspx?disheId=" + disheId);
        }
    }
}