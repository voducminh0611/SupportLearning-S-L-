using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace SupportLearning
{
    public class Search_Handler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string namedoc = context.Request.QueryString["name"];
            if (string.IsNullOrEmpty(namedoc))
            {
                context.Response.StatusCode = 400;
                context.Response.Write("No search query provided");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT Name_Doc, Code_User, File_Doc FROM Doc WHERE Name_Doc LIKE @Name_Doc";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name_Doc", "%" + namedoc + "%");
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string Name_Doc = reader["Name_Doc"].ToString();
                            if (!Name_Doc.EndsWith(".docx"))
                            {
                                Name_Doc += ".docx";
                            }
                            byte[] fileData = (byte[])reader["File_Doc"];

                            context.Response.ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
                            context.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + Name_Doc + "\"");
                            context.Response.BinaryWrite(fileData);
                            context.Response.End();
                        }
                        else
                        {
                            context.Response.StatusCode = 404;
                            context.Response.Write("File not found");
                        }
                    }
                }
            }
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}
