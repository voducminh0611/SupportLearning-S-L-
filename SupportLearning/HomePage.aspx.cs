using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace SupportLearning
{
    public partial class HomePage : System.Web.UI.Page
    {
        static string connectionString = @"Data Source = MINH\SQLEXPRESS; Initial Catalog=CAPSTONE2; integrated security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserInformation();
            }
        }

        private void LoadUserInformation()
        {
            try
            {
                if (Session["Code_User"] != null)
                {
                    string code_user = Session["Code_User"].ToString();
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT A.Code_User, U.Name_UserInfo FROM SL_Auth A, SL_UserInfo U WHERE A.Code_User = @Code_User AND A.Code_User = U.Code_User", con);
                        cmd.Parameters.AddWithValue("@Code_User", code_user);

                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            txtUserName.Text = reader["Code_User"].ToString();
                            txtNameUser.Text = reader["Name_UserInfo"].ToString();
                        }
                        reader.Close();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }


        protected void bt_UserInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Information User/userInfo.aspx");

        }

        protected void bt_new_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudySpace.aspx");
        }

        protected void bt_studySpace_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudySpace.aspx");
        }



        protected void bt_Friends_Click(object sender, EventArgs e)
        {
            Response.Redirect("Friends.aspx");

        }

        protected void bt_Chat_Click(object sender, EventArgs e)
        {
            Response.Redirect("Chat.aspx");
        }
    }
}
