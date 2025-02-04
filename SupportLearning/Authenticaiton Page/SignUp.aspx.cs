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
    public partial class SignUp : System.Web.UI.Page
    {
        string gender;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source = MINH\\SQLEXPRESS; Initial Catalog=CAPSTONE2; integrated security=True");
            SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[SL_Auth]
                ([Code_User]
                ,[Pass])
                    VALUES
                        ('" + txtStudentid.Text + "', '" + txtPassword.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Success')</script>");
            Response.Redirect("~/Authentication.aspx");
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            gender = "male";
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            gender = "female";

        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            gender = "others";

        }
    }
}