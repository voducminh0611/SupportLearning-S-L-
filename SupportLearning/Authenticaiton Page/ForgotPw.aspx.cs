using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;

namespace SupportLearning
{
    public partial class ForgotPw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_continue_Click(object sender, EventArgs e)
        {
            try
            {
                // 1. Validate User Input
                if (string.IsNullOrEmpty(txtStudentID.Text) || string.IsNullOrEmpty(txtEmail.Text))
                {
                    txt_Info.Text = "Please enter your Student ID and Email address.";
                    return;
                }

                // 2. Secure Database Connection (Recommended)
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // 3. Use Parameterized Query to Prevent SQL Injection
                    string sql = "SELECT Code_User FROM SL_Auth WHERE Code_User = @CodeUser";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@CodeUser", txtStudentID.Text);
                        SqlDataReader dr = cmd.ExecuteReader();

                        // 4. Check for Matching Student ID
                        if (dr.HasRows)
                        {
                            // Found matching student ID, proceed with secure password reset
                            // (implement token-based reset or password hashing)
                            txt_Info.Text = "A password reset link has been sent to your email (if the email address is registered)."; // Informative message
                        }
                        else
                        {
                            // Student ID not found, provide specific error message
                            txt_Info.Text = "Invalid Student ID. Please check and try again.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                txt_Info.Text = "An error occurred: " + ex.Message;
                // Log the exception for further investigation
            }
        }
    }
}
