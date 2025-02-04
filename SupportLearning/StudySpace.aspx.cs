using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace SupportLearning
{
    public partial class StudySpace : System.Web.UI.Page
    {
        static string connectionString = @"Data Source = MINH\SQLEXPRESS; Initial Catalog=CAPSTONE2; integrated security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = @"Select P.PostDocID,D.Name_Doc, U.Name_UserInfo, P.TimePost_Doc, P.Description_Doc, P.File_Doc, (Select Count(*) From Like_Post L Where L.PostDocID = P.PostDocID) AS TotalLike
                                    From SL_UserInfo U, Post_Doc P, Doc D
                                    Where U.CMND_UserInfo = P.CMND_UserInfo AND
                                          U.Code_User = D.Code_User AND
                                          D.File_Doc = P.File_Doc";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        DataTable dataTable = new DataTable();
                        dataTable.Load(reader);

                        DataList1.DataSource = dataTable;
                        DataList1.DataBind();

                        reader.Close();
                    }
                }
            }
        }



        protected async void bt_MeetingRoom_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://discord.gg/cqvreWja", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void bt_Modal_Click(object sender, EventArgs e)
        {
            InsertSL_UserInfo();
            InsertPost_Doc();
            InsertDoc();
        }

        public void InsertPost_Doc()
        {
            string query = @"Insert Into Post_Doc(PostDocID, Description_Doc, File_Doc, TimePost_Doc, CMND_UserInfo)
                     Values (@PostID, @Description, @FileDoc, CURRENT_TIMESTAMP, @CMND_UserInfo)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Chuyển đổi dữ liệu chuỗi từ các TextBox
                    cmd.Parameters.AddWithValue("@PostID", txt_PostID.Text);
                    cmd.Parameters.AddWithValue("@Description", txt_Description_Doc.Text);
                    cmd.Parameters.AddWithValue("@CMND_UserInfo", txt_CMND.Text);
                    // Chuyển đổi dữ liệu từ FileUpload thành kiểu varbinary
                    cmd.Parameters.AddWithValue("@FileDoc", bt_UpLoad.FileBytes);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Data Inserted Successfully');</script>");
                }
            }
        }


        public void InsertDoc()
        {
            string query = @"INSERT INTO Doc (DocumentID_Doc, Name_Doc, File_Doc, Code_User) 
                     VALUES (@DocumentID, @NameDoc, @FileDoc, @Code_User)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Lấy giá trị của các TextBox
                    string documentID = txt_DocumentID.Text;
                    string nameDoc = txt_NameDoc.Text;
                    string codeuser = txt_Code_User.Text;
                    // Thêm các tham số với giá trị đã lấy được
                    cmd.Parameters.AddWithValue("@DocumentID", documentID);
                    cmd.Parameters.AddWithValue("@NameDoc", nameDoc);
                    cmd.Parameters.AddWithValue("@Code_User", codeuser);
                    cmd.Parameters.AddWithValue("@FileDoc", bt_UpLoad.FileBytes);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }


        public void InsertSL_UserInfo()
        {
            string query = @"INSERT INTO [dbo].[SL_UserInfo] ([Name_UserInfo] ,[CMND_UserInfo], [Code_User])
                     VALUES (@NameUser, @CMND, @Code_User)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Lấy giá trị của các TextBox
                    string nameUser = txt_NameUser.Text;
                    string cmnd = txt_CMND.Text;
                    string codeuser = txt_Code_User.Text;
                    // Thêm các tham số với giá trị đã lấy được
                    cmd.Parameters.AddWithValue("@NameUser", nameUser);
                    cmd.Parameters.AddWithValue("@CMND", cmnd);
                    cmd.Parameters.AddWithValue("@Code_User", codeuser);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

        }

        protected void image_button_Click(object sender, ImageClickEventArgs e)
        {
            string searchText = txt_search_text.Text.Trim();
            if(!string.IsNullOrEmpty(searchText) )
            {
                SearchDocument(searchText);
            }
        }

        private void SearchDocument(string searchText)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT Name_Doc, Code_User, File_Doc FROM Doc WHERE Name_Doc LIKE '%' + @searchText + '%'", con))
                    {
                        cmd.Parameters.AddWithValue("@searchText", searchText);
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.HasRows)
                        {
                            DataList2.DataSource = reader;
                            DataList2.DataBind();

                        }
                        else
                        {
                            Response.Write("No documents found !!!");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }


        protected void bt_Chat_Click(object sender, EventArgs e)
        {
            Response.Redirect("Friends.aspx");
        }
    }
}


