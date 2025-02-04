<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="SupportLearning.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Sign Up</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />

	<style>
		.container {
            margin: 0 auto; /* Center the container horizontally */
            padding: 20px; /* Add some padding inside the container */
            border: 1px solid #ddd; /* Add a thin border for better separation */
			width: 400px;
			height: 300px;
			border: none;
        }

        .signup-topic {
            background-color: #C41E2B;
            color: white;
            text-align: center;
            padding: 10px;
            margin-bottom: 20px;/* Add space between topic and form */
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
		<div class="container"> <!-- Container mới -->
			<h2 class="signup-topic">Fill Information</h2>
			<table align="center">

				<tr>
					<td>Student ID </td>
					<td>
						<asp:TextBox ID="txtStudentid" placeholder="Enter your Student ID" Width="200px" runat="server"></asp:TextBox>
					</td>
				</tr>

				<tr>
					<td>Pasword</td>
					<td>
						<asp:TextBox ID="txtPassword" placeholder="Enter your Password" Width="200px" runat="server"></asp:TextBox>
					</td>
				</tr>

			</table>

			<!-- Nút Button Đăng kí-->
			<div class="btn-container">
				<asp:Button ID="btnSignUp" runat="server" Text="Sign Up" BackColor="#C41E2B" ForeColor="#ffffff" BorderColor="#C41E2B" CssClass="btn btn-info form-control" OnClick="btnSignUp_Click" />
            </div>

		</div>
	</form>
</body>
</html>
