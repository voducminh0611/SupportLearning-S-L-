<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPw.aspx.cs"
Inherits="SupportLearning.ForgotPw" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Retrieve Password</title>
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
            crossorigin="anonymous"
        />

        <style>
            .container {
                margin: 0 auto; /* Center the container horizontally */
                padding: 20px; /* Add some padding inside the container */
                border: 1px solid #ddd; /* Add a thin border for better separation */
                width: 400px;
                height: 300px;
                border: none;
            }

            .RetrievePass-topic {
                background-color: #C41E2B;
                color: white;
                text-align: center;
                padding: 10px;
                margin-bottom: 20px; /* Add space between topic and form */
            }

            .btn-container {
                text-align: center;
                width: 365px;
                margin-top: 20px; /* Add space below form elements */
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                <div class="container">
                    <!-- Container mới -->
                    <h2 class="RetrievePass-topic">Fill Information</h2>
                    <table align="center">

                        <tr>
                            <td>Student ID</td>
                            <td>
                                <asp:TextBox ID="txtStudentID" placeholder="Enter your Student Id" Width="250px" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>Email </td>
                            <td>
                                <asp:TextBox ID="txtEmail" placeholder="Enter your Email" Width="250px" runat="server"></asp:TextBox>
                            </td>

                           <asp:Label ID="txt_Info" runat="server" />

                        </tr>
                    </table>

                    <!-- Nút Button tiếp tục để lấy lại pass-->
                    <div class="btn-container">
						<asp:Button ID="bt_continue" Width="150px" runat="server" Text="Continue" CssClass="btn btn-info form-control" BackColor="#C41E2B" ForeColor="#ffffff" BorderColor="#C41E2B" OnClick="bt_continue_Click" />
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
