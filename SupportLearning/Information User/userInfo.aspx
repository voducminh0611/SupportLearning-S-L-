<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userInfo.aspx.cs" Inherits="SupportLearning.userInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>User Information Page</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />

	<style>
		.container {
			display: flex;
			padding: 30px 70px;
			background-color: #f0f0f0;
			justify-content: center; /* căn giữa theo chiều ngang */
			align-items: center;
		}

		.lbTopic {
			color: #D11717;
			font-weight: bold;
			font-size: 35px;
		}

		.space {
			width: 10px;
		}

		.space1 {
			height: 20px;
		}

		.space2 {
			height: 10px;
		}

		.tableInfo {
			width: 100%;
			border-collapse: collapse;
		}

		.labelFake {
			width: 43%;
			text-align: right;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
		<div class="container">
			<img src="../Image/user-info.png" height="70px" width="70px" />
			<div class="space"></div>
			<asp:Label ID="Label1" runat="server" Text="YOUR INFORMATION MANAGEMENT" CssClass="lbTopic"></asp:Label>
		</div>

		<div class="space1"></div>

		<!-- content -->
		<table border="0" class="tableInfo">

			<!--Tên Sinh Viên-->
			<tr>
				<td class="labelFake">Tên Sinh Viên: 
				</td>

				<td class="textboxFake">
					<asp:TextBox ID="txt_Tensinhvien" Width="350px" runat="server"></asp:TextBox>
				</td>
			</tr>

			<tr class="space2"></tr>
			<!--MSSV-->
			<tr>
				<td class="labelFake">Mã Sinh Viên:
				</td>

				<td class="textboxFake">
					<asp:TextBox ID="txt_MSSV" Width="350px" runat="server"></asp:TextBox>
				</td>
			</tr>

			<tr class="space2"></tr>


			<!--Giới tính-->
			<tr>
				<td class="labelFake">Giới tính:
				</td>

				<td class="textboxFake">
					<asp:TextBox ID="txt_gioitinh" Width="350px" runat="server"></asp:TextBox>
				</td>
			</tr>


			<tr class="space2"></tr>

			<!-- Ngày sinh -->
			<tr>
				<td class="labelFake">Ngày sinh (yyyy/mm/dd):
				</td>

				<td class="textboxFake">
					<asp:TextBox ID="txt_ngaysinh" Width="350px" runat="server"></asp:TextBox>
				</td>
			</tr>

			<tr class="space2"></tr>

			<!--CMND-->
			<tr>
				<td class="labelFake">CMND: 
				</td>

				<td class="textboxFake">
					<asp:TextBox ID="txt_cmnd" Width="350px" runat="server"></asp:TextBox>
				</td>
			</tr>

			<tr class="space2"></tr>

			<!--Email-->
			<tr>
				<td class="labelFake">Email: 
				</td>

				<td class="textboxFake">
					<asp:TextBox ID="txt_email" Width="350px" runat="server"></asp:TextBox>
				</td>
			</tr>

			<tr>
				<td>
					<asp:Button ID="bt_update" CssClass="buttonUpdate" runat="server" Text="Chỉnh Sửa Thông Tin" Style="display: block; margin: 5% 95%" Height="50px" Width="200px" BackColor="#C41E2B" ForeColor="#ffffff" BorderColor="#C41E2B" OnClick="bt_update_Click" />
				</td>
			</tr>


		</table>

	</form>
</body>
</html>



