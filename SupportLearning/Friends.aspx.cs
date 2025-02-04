using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportLearning
{

    public partial class Friends : System.Web.UI.Page
    {
        static string connectionString = @"Data Source = MINH\SQLEXPRESS; Initial Catalog=CAPSTONE2; integrated security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Code_User"] != null)
                {
                    string userCode = Session["Code_User"].ToString();
                    DataTable friendsDataTable = GetFriendsList(userCode);

                    List_IsFriends.DataSource = friendsDataTable;
                    List_NotFriends.DataBind();
                }
            }
        }

        private DataTable GetFriendsList(string userCode) {
            DataTable dt = new DataTable();
            using(SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT U.Code_User_1, R.Code_User_2 AS FriendCode, R.Status_Relationship FROM Relationship R INNER JOIN SL_Auth U ON R.Code_User_2 = U.Code_User WHERE R.Code_User_1 = @UserCode AND R.Status_Relationship = 'friends'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserCode", userCode);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            return dt;
        }

        
    }
}