using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SupportLearning
{
    public partial class Authentication : System.Web.UI.Page
    {
        static string connectionString = @"Data Source = MINH\SQLEXPRESS; Initial Catalog=CAPSTONE2; integrated security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open(); // Mở kết nối

                    SqlCommand cmd = new SqlCommand("sp_Login", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@code_user", txt_CodeUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@pass", txt_Pass.Text.Trim()); // Sử dụng trường nhập liệu cho mật khẩu

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())

                        Session["Code_User"] = txt_CodeUser.Text.Trim();
                        txt_Info.Text = "Login Successfully";

                        Response.Redirect("~/HomePage.aspx");
                    }
                    else
                    {
                        txt_Info.Text = "Invalid credentials";
                    }

                    reader.Close(); // Đóng DataReader
                }
            }
            catch (Exception ex)
            {
                // Hiển thị thông báo lỗi hoặc ghi log lỗi
                txt_Info.Text = "An error occurred: " + ex.Message;
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void btnForgotpassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPw.aspx");
        }
    }
}