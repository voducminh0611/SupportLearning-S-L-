<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Authentication.aspx.cs" Inherits="SupportLearning.Authentication" %>

<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>LOGIN</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />

	<style>
		.wrapper1 {
			display: flex;
			align-items: center;
			flex-direction: column;
			justify-content: content;
			width: 100% !important;
			padding: 20px;
		}

		.logincontainer {
			border-radius: 0px;
			background-color: #fff;
			width: 90%;
			max-width: 450px;
			position: relative;
			padding: 20px;
			border: 1px white solid;
			box-shadow: 0-15px 10px -10px #acacac;
		}

		.labelTOPIC {
			text-align: center;
			display: block;
			margin-top: 20px;
		}

		.forgotpass_btn {
			border:none;
			background-color: white;
		}

	</style>

</head>
<body>
	<form id="form1" runat="server">
		<div class="wrapper1">
			<div class="logincontainer">

				<h3>
					<img src="../Image/dtu.png" height=130px width=410px/> 
				</h3>


				<h3>
					<asp:Label ID="Label1" runat="server" Text="Label" CssClass="labelTOPIC">SUPPORT LEARNING SYSTEM</asp:Label>
				</h3>


				<hr />   <!-- Kẻ Ngang-->

				<asp:TextBox ID="txt_CodeUser" runat="server" placeholder="Enter Code Student" CssClass="form-control" />
				<br /> <!-- Xuống hàng-->

				<asp:TextBox ID="txt_Pass" runat="server" placeholder="Enter Pass" TextMode="Password" CssClass="form-control" />
				<div>
					<asp:Button ID="btnForgotpassword" runat="server" Text="Forgot Password?" CssClass="forgotpass_btn" OnClick="btnForgotpassword_Click" />
				</div>
				<br />

				<asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-info form-control"
					OnClick="btnLogin_Click" BackColor="#C41E2B" ForeColor="#ffffff" BorderColor="#C41E2B" />

				<br />
				<asp:Label ID="txt_Info" runat="server" />
				
				<hr />

				<asp:Button ID="btnSignup" runat="server" Text="Sign Up" BackColor="#C41E2B" BorderColor="#C41E2B" ForeColor="#ffffff" CssClass="btn btn-info form-control" OnClick="btnSignup_Click" />
				
				
			</div>
		</div>
	</form>
</body>
</html>
