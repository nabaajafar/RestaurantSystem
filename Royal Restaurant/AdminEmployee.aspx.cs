using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Royal_Restaurant
{
    public partial class AdminEmployee : AdminServices
    {
        public int EmployeeIdSelect = 0;
        protected void Page_Load(object sender, EventArgs e)
        {


            ms = (MasterSite)this.Master;

            if (!ms.isLoggedIn() || !ms.isAdmin())
            {
                Response.Redirect("/Login.aspx");
            }

         


            if (HttpContext.Current.Request.QueryString["userId"] != null)
            {
                try
                {
                    EmployeeIdSelect = int.Parse(HttpContext.Current.Request.QueryString["userId"].ToString());
                }
                catch (Exception)
                {
                    EmployeeIdSelect = 0;
                }
            }

            if (EmployeeIdSelect > 0)
            {
                btnReset.Visible = false;
                btnDelete.Visible = true;

                var user = ms.fetchUserById(EmployeeIdSelect);
                if (user != null)
                {
                    UserLevel.SelectedValue = user["UserLevel"].ToString();
                    Username.Text = user["Username"].ToString();
                    Password.Text = user["Password"].ToString();
                    Email.Text = user["Email"].ToString();
                    FullName.Text = user["FullName"].ToString();
                    Gender.SelectedValue = user["Gender"].ToString();
                    Age.Text = user["Age"].ToString();
                    PhoneNumber.Text = user["PhoneNumber"].ToString();
                    Salary.Text = user["Salary"].ToString();
                 
                    

                }

            }

        }


        protected void doSubmit(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(((MasterSite)this.Master).MyConnection);
                con.Open();

        

               
                string mUsername = Username.Text;
                string mPassword = Password.Text;
                string mFullName = FullName.Text;
                string mGender = Gender.SelectedValue;
                string mAge = Age.Text;
                string mPhoneNumber = PhoneNumber.Text;
                string mEmail = Email.Text;
                string mSalary = Salary.Text;
                string mUserLevel = UserLevel.SelectedValue;

                SqlCommand cmd;
   

                if (EmployeeIdSelect == 0)
                {
                    cmd = new SqlCommand("insert into Users(Username, Password, FullName, Gender, Age, PhoneNumber, Email , Salary, UserLevel)" +
                                                    "values(@Username,@Password, @FullName, @Gender,@Age,@PhoneNumber, @Email, @Salary, @UserLevel)", con);

                    cmd.Parameters.AddWithValue("Username", mUsername);
                    cmd.Parameters.AddWithValue("Password", mPassword);
                    cmd.Parameters.AddWithValue("FullName", mFullName);
                    
                    cmd.Parameters.AddWithValue("Gender", mGender);
                    cmd.Parameters.AddWithValue("Age", mAge);
                    cmd.Parameters.AddWithValue("PhoneNumber", mPhoneNumber);
                    cmd.Parameters.AddWithValue("Email", mEmail);
                    
                    cmd.Parameters.AddWithValue("Salary", mSalary);

                    cmd.Parameters.AddWithValue("UserLevel", mUserLevel);

                    var html = new StringBuilder();
                    html.AppendLine("Helo, " + mFullName);
                    html.AppendLine("<br>");
                    html.AppendLine("<br>");
                    html.AppendLine("<strong>Username:</strong> " + mUsername);
                    html.AppendLine("<br>");
                    html.AppendLine("<strong>Password:</strong> " + mPassword);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ms.sendEmail("Created New Account ", mEmail, html);
                    Response.Redirect("AdminEmployees.aspx?valid=send");
                }
                else
                {

     


                    cmd = new SqlCommand("Update Users set Username = @Username, Password = @Password, FullName = @FullName, Gender = @Gender, Age = @Age, PhoneNumber = @PhoneNumber, Email = @Email , Salary = @Salary , UserLevel = @UserLevel   Where UserID =@UserID", con);

                    cmd.Parameters.AddWithValue("Username", Request.Form["ctl00$ContentPlaceHolder1$Username"].ToString());
                    
                    cmd.Parameters.AddWithValue("Password", Request.Form["ctl00$ContentPlaceHolder1$Password"].ToString());
                    cmd.Parameters.AddWithValue("FullName", Request.Form["ctl00$ContentPlaceHolder1$FullName"].ToString());
                    
                    cmd.Parameters.AddWithValue("Gender", Request.Form["ctl00$ContentPlaceHolder1$Gender"].ToString());
                    cmd.Parameters.AddWithValue("Age", Request.Form["ctl00$ContentPlaceHolder1$Age"].ToString());
                    cmd.Parameters.AddWithValue("PhoneNumber", Request.Form["ctl00$ContentPlaceHolder1$PhoneNumber"].ToString());
                    cmd.Parameters.AddWithValue("Email", Request.Form["ctl00$ContentPlaceHolder1$Email"].ToString());
                    
                    cmd.Parameters.AddWithValue("Salary", Request.Form["ctl00$ContentPlaceHolder1$Salary"].ToString());
                    cmd.Parameters.AddWithValue("UserLevel", Request.Form["ctl00$ContentPlaceHolder1$UserLevel"].ToString());
                   
                    
                    cmd.Parameters.AddWithValue("UserID", EmployeeIdSelect);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("AdminEmployees.aspx");

                }


                
               

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        protected void deleteDishe(object sender, EventArgs e)
        {
            if(EmployeeIdSelect != 1)
            {
                SqlConnection con = new SqlConnection(ms.MyConnection);
                SqlCommand cmd = new SqlCommand("DELETE from Users WHERE UserID=@DisheID ", con);
                cmd.Parameters.AddWithValue("@DisheID", EmployeeIdSelect);
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("AdminEmployees.aspx");
                }
                catch (Exception)
                {
                }
            }
            else
            {
                ms.AlertError(" cant be removed this admin main user ");
               
            }
            

        }

    }
}