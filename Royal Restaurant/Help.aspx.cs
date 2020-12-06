using System;
using System.Text;
using System.Web;

namespace Royal_Restaurant
{
    public partial class Help : System.Web.UI.Page
    {
		MasterSite ms;

		protected void Page_Load(object sender, EventArgs e)
        {
			ms = (MasterSite)this.Master;

		}

		protected void doSubmit(object sender, EventArgs e)
        {
			string email = Email.Text.Trim();

			if(email != "") {

			var html = new StringBuilder();
			html.AppendLine("Helo, " + FirstName.Text);
			html.AppendLine("<br>");
		    html.AppendLine("<p>");
			html.AppendLine(Description.Text);
			html.AppendLine("</p>");

				if (ms.sendEmail("Help Email", email, html))
            {

					ms.sendEmail("Help From " + FirstName.Text, ms.FromEmail, html);

					ms.AlertDone("The request has been sent to the administration and you will be answered soon ");

					FirstName.Text = "";
					LastName.Text = "";
					Email.Text = "";
					PhoneNumber.Text = "";
					Description.Text = "";

				}
			}

		}

	}
}