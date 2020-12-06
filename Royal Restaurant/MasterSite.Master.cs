using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Configuration;

namespace Royal_Restaurant
{
    public partial class MasterSite : System.Web.UI.MasterPage
    {
        public string MyConnection = WebConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["isLoggedIn"] != null && Boolean.Parse(Session["isLoggedIn"].ToString()) == true)
            {
                btnLogOut.Visible = true;
                btnSignIn.Visible = false;
            
     
            }
            else
            {
                btnLogOut.Visible = false;
                btnSignIn.Visible = true;
              
            }

            if(HttpContext.Current.Request.QueryString["logout"] != null && HttpContext.Current.Request.QueryString["logout"].ToString() == "true")
            {
                doLogout();
            }
        }

   

        internal string getFromSettings(string v)
        {
            var row = getRow("SELECT " + v + " FROM Settings ");
            return (row != null) ? row[v].ToString() : null;
        }

        public Boolean isLoggedIn()
        {
            if (Session["isLoggedIn"] != null)
            {
                return Boolean.Parse(Session["isLoggedIn"].ToString());
            }
            return false;
        }

        public Boolean isAdmin()
        {
            return (Session["userLevel"] != null && int.Parse(Session["userLevel"].ToString()) == 1) ? true : false;
        }

        public int getUID()
        {
            return (Session["UserId"] != null) ? int.Parse(Session["UserId"].ToString()) : 0;
        }

        protected void doLogout()
        {
            Session["userId"] = null;
            Session["username"] = null;
            Session["fullName"] = null;
            Session["userLevel"] = null;
            Session["isLoggedIn"] = false;
            Response.Redirect("/Login.aspx");

        }


        // Database Functions
        public DataTable getDataByQuery(string query)
        {
            using (SqlConnection con = new SqlConnection(MyConnection))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return (dt != null)? dt : null;
                    }
                }
            }

        }

        public DataRow getRow(string q)
        {
            try
            {
                DataRow data = getDataByQuery(q).Rows[0];
                return (data != null)? data : null;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public string getValue(string w, string t, string  where)
        {
            string q = "Select " + w + " From [" + t + "] Where " + where;
            //Response.Write(q);
            DataRow dr = getRow(q);
            if (dr != null)
            {
                string val = dr[w].ToString();
                return (val != "") ? val : "";
            }
            else
            {
                return "";
            }

        }

        public int getLastOrderOpen()
        {
           
            string OderId = getValue("OrderID", "Orders", " CloseTime is NULL AND UserId = " + getUID() + " Order By OrderID DESC ");
            return (OderId != "") ? int.Parse(OderId) : 0;
        }
            



        public DataRow fetchDisheById(int disheId)
        {
            var data = getRow("Select * From Dishes WHERE DisheID = " + disheId);
            return (data != null) ? data : null;
        }

        internal DataRow fetchUserById(int UserId)
        {
            var data = getRow("Select * From Users WHERE UserId = " + UserId);
            return (data != null) ? data : null;

        }

        internal void AlertError(string v)
        {
            doneMSG.Visible = false;
            errorMSG.Visible = true;
            errorMSG.Text = v;
        }

        internal void AlertDone(string v)
        {
            errorMSG.Visible = false;
            doneMSG.Visible = true;

            doneMSG.Text = v;
        }

        public string FromEmail = "Gym.kfu@gmail.com";
        public string FromPassword = "gymgym@kfu";
        public bool sendEmail(string Subject, string To, StringBuilder Body) {
            MailMessage msg = new MailMessage();
            System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
            try
            {
                    msg.Subject = Subject;
                    msg.Body = Body.ToString();
               
                    msg.From = new MailAddress(FromEmail, FromPassword);
                    msg.To.Add(To);
                    msg.IsBodyHtml = true;
                    client.Host = "smtp.gmail.com";
                    System.Net.NetworkCredential basicauthenticationinfo = new System.Net.NetworkCredential(FromEmail, FromPassword);
                    client.Port = int.Parse("587");
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = basicauthenticationinfo;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Send(msg);

                    return true;
                
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}