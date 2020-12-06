using System;
using System.Data.SqlClient;
using System.Web;


namespace Royal_Restaurant
{
    public partial class AdminDishe : AdminServices
    {
        public int DisheIdSelect = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            ms = (MasterSite)this.Master;

            if (!ms.isLoggedIn() || !ms.isAdmin())
            {
                Response.Redirect("/Login.aspx");
            }

            if (HttpContext.Current.Request.QueryString["disheId"] != null)
            {
                try
                {
                    DisheIdSelect = int.Parse(HttpContext.Current.Request.QueryString["disheId"].ToString());
                }
                catch (Exception)
                {
                    DisheIdSelect = 0;
                }
            }

            if (DisheIdSelect > 0)
            {
                btnReset.Visible = false;
                btnDelete.Visible = true;

                var dishe = ms.fetchDisheById(DisheIdSelect);
                if (dishe != null)
                {
                    DisheName.Text = dishe["DisheName"].ToString();
                    DisheDescription.Text = dishe["DisheDescription"].ToString();
                    DropDownListDisheType.SelectedValue = dishe["DisheType"].ToString();
                    DishePrice.Text = dishe["DishePrice"].ToString();
                    DisheImage.ImageUrl = "~/assets/images/dishes/" + dishe ["DisheImage"].ToString();
                    btnDownloadImage.CommandArgument = dishe["DisheImage"].ToString();
                    btnDownloadImage.Visible = true;
                    RequiredFieldValidator3.Enabled = false;

                }

            }

      
        }

            protected void doSubmit(object sender, EventArgs e)
        {
           


                try
                {
                    SqlConnection con = new SqlConnection(((MasterSite)this.Master).MyConnection);
                    con.Open();
                    string mDisheType = DropDownListDisheType.SelectedValue;
                    string mDisheName = DisheName.Text;
                    string mDisheDescription = DisheDescription.Text;
                    string mDishePrice = DishePrice.Text;

                    SqlCommand cmd;
                string image = "";

                if (FileUpload1.HasFile)
                {
                    image = UploadMe();
                }

                if (DisheIdSelect == 0) { 
                     cmd = new SqlCommand("insert into Dishes(DisheName, DisheDescription, DisheType, DishePrice, DisheImage , UserId) values(@DisheName,@DisheDescription,@DisheType,@DishePrice,@DisheImage, @UserId)", con);

                    cmd.Parameters.AddWithValue("DisheType", mDisheType);
                    cmd.Parameters.AddWithValue("DisheName", mDisheName);
                    cmd.Parameters.AddWithValue("DisheDescription", mDisheDescription);
                    cmd.Parameters.AddWithValue("DishePrice", mDishePrice);
                    cmd.Parameters.AddWithValue("DisheImage", image);
                    cmd.Parameters.AddWithValue("UserId", ms.getUID());

                }
                else{

                        string imageCase = (image != "") ? ", DisheImage = @DisheImage " : "";


                        cmd = new SqlCommand("Update Dishes set DisheName = @DisheName, DisheDescription = @DisheDescription, DisheType = @DisheType, DishePrice = @DishePrice " + imageCase  + ", UserId = @UserId  Where DisheID =@DisheID", con);

                  
                    cmd.Parameters.AddWithValue("DisheType", Request.Form["ctl00$ContentPlaceHolder1$DropDownListDisheType"].ToString());
                    cmd.Parameters.AddWithValue("DisheName", Request.Form["ctl00$ContentPlaceHolder1$DisheName"].ToString());
                    cmd.Parameters.AddWithValue("DisheDescription", Request.Form["ctl00$ContentPlaceHolder1$DisheDescription"].ToString());
                    cmd.Parameters.AddWithValue("DishePrice", Request.Form["ctl00$ContentPlaceHolder1$DishePrice"].ToString());
                    cmd.Parameters.AddWithValue("UserId", ms.getUID());
                    if (image != "")
                    {
                        cmd.Parameters.AddWithValue("DisheImage", image);
                    }

                    cmd.Parameters.AddWithValue("DisheID", DisheIdSelect);
                }

                    
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("AdminViewDishes.aspx");

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }

        }

        protected void deleteDishe(object sender, EventArgs e)
        {
 
            SqlConnection con = new SqlConnection(ms.MyConnection);
            SqlCommand cmd = new SqlCommand("DELETE from Dishes WHERE DisheID=@DisheID", con);
            cmd.Parameters.AddWithValue("@DisheID", DisheIdSelect);
            try
            {
                con.Open(); 
                cmd.ExecuteNonQuery();
                Response.Redirect("AdminViewDishes.aspx");
            }
            catch (Exception)
            {
            }
            
        }
            
        protected string UploadMe()
        {
            
            string extension  = System .IO.Path .GetExtension(FileUpload1 .FileName );

            if (FileUpload1.HasFile)
            {
                try
                {
                    string path = Server.MapPath("~\\assets\\images\\dishes\\");
                    string newFileName = DateTime.Now.ToString("yyyyMMddHHmmss") + extension;
                    FileUpload1.SaveAs(path + newFileName);

                    return newFileName;
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
            else
            {
                Response.Write("Please choose a file to upload!");
            }
            return null;
        }

        protected void downloadImage(object sender, EventArgs e)
        {
            Response.Clear();            
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("content-disposition", "filename=" + btnDownloadImage.CommandArgument);
            Response.TransmitFile(Server.MapPath("~\\assets\\images\\dishes\\") + btnDownloadImage.CommandArgument);
            Response.End();

        }
    }
}