using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace SupportLearning
{
    public class download_handler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string postDocID = context.Request.QueryString["id"];
            if (string.IsNullOrEmpty(postDocID))
            {
                context.Response.StatusCode = 400;
                context.Response.Write("No Illegal");
                return;
            }

            string connectionString = @"Data Source=MINH\SQLEXPRESS;Initial Catalog=CAPSTONE2;Integrated Security=True";
            string query = "SELECT Topic, File_Doc FROM Post_Doc WHERE PostDocID = @PostDocID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@PostDocID", postDocID);
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string Topic = reader["Topic"].ToString();
                            if (!Topic.EndsWith(".docx"))
                            {
                                Topic += ".docx";
                            }
                            byte[] fileData = (byte[])reader["File_Doc"];

                            context.Response.ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
                            context.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + Topic + "\"");
                            context.Response.BinaryWrite(fileData);
                            context.Response.End();
                        }
                        else
                        {
                            context.Response.StatusCode = 404;
                            context.Response.Write("No Found File");
                        }
                    }
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
