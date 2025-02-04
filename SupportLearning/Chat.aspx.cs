using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SupportLearning
{
    public partial class Chat : System.Web.UI.Page
    {
        static string connectionString = @"Data Source = MINH\SQLEXPRESS; Initial Catalog=CAPSTONE2; integrated security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMessages();
            }
        }

        private void SaveMessage(string sender, string receiver, string content_Mess)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO SL_Chat (SenderCode_User, ReceiverCode_User, Content_Mess) VALUES (@Sender, @Receiver, @content_Mess)";
                using(SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Sender", sender);
                    cmd.Parameters.AddWithValue("@Receiver", receiver);
                    cmd.Parameters.AddWithValue("@Content_Mess", content_Mess);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            
            }
        }

        private void LoadMessages()
        {
            string senderCode = Session["Code_User"].ToString();
            string receiverCode = txt_ReceiverCode.Value;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM SL_Chat WHERE (SenderCode_User = @Sender AND ReceiverCode_User = @Receiver) OR (SenderCode_User = @Receiver AND ReceiverCode_User = @Sender) ORDER BY Timestamp";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Sender", senderCode);
                    cmd.Parameters.AddWithValue("@Receiver", receiverCode);

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        rpt_Message.DataSource = reader;
                        rpt_Message.DataBind();
                    }

                }
            }
        }

        protected void bt_send_Click(object sender, EventArgs e)
        {
            string senderCode = Session["Code_User"].ToString() ;
            string receiverCode = txt_ReceiverCode.Value;
            string content_Mess = ip_mess.Value;

            if (!string.IsNullOrEmpty(receiverCode) && !string.IsNullOrEmpty(content_Mess))
            {
                SaveMessage(senderCode,receiverCode, content_Mess);
                LoadMessages();
                ip_mess.Value = string.Empty;
            }
            LoadMessages();
        }
    }
}