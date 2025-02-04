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

    public partial class userInfo : System.Web.UI.Page
    {
        static string connectionString = @"Data Source = MINH\SQLEXPRESS; Initial Catalog=CAPSTONE2; integrated security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["Code_User"] != null)
                    {
                        string code_user = Session["Code_User"].ToString();
                        using (SqlConnection con = new SqlConnection(connectionString))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("SELECT Name_UserInfo, Code_User, Sex_UserInfo, DateBirth_UserInfo, CMND_UserInfo, Email_UserInfo FROM SL_UserInfo WHERE Code_User = @Code_User", con);
                            cmd.Parameters.AddWithValue("@Code_User", code_user);

                            SqlDataReader reader = cmd.ExecuteReader();
                            if (reader.Read())
                            {
                                txt_Tensinhvien.Text = reader["Name_UserInfo"].ToString();
                                txt_MSSV.Text = reader["Code_User"].ToString();
                                txt_gioitinh.Text = reader["Sex_UserInfo"].ToString();
                                txt_ngaysinh.Text = Convert.ToDateTime(reader["DateBirth_UserInfo"]).ToString("yyyy/MM/dd");
                                txt_cmnd.Text = reader["CMND_UserInfo"].ToString();
                                txt_email.Text = reader["Email_UserInfo"].ToString();
                            }
                            reader.Close();
                        }
                    }

                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void bt_update_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(@"UPDATE [dbo].[SL_UserInfo]
            SET[Name_UserInfo] = '"+txt_Tensinhvien.Text+"', [Code_User] = '"+txt_MSSV.Text+"', [Sex_UserInfo] = '"+txt_gioitinh.Text+"', [DateBirth_UserInfo] = '"+txt_ngaysinh.Text+"', [CMND_UserInfo] = '"+txt_cmnd.Text+"', [Email_UserInfo] = '"+txt_email.Text+"' WHERE [Code_User]='"+txt_MSSV.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Write("Cập nhật thành công");
            con.Close();
        }
    }
}