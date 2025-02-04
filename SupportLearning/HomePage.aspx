<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="SupportLearning.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

	<title>Home Page of Support Learning System</title>

	<style>
		.container {
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 10px 20px;
			background-color: #f0f0f0;
		}

		.center-content {
			display: flex;
			align-items: center;
		}

		.menu ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
		}

			.menu ul li {
				display: inline-block;
				margin-right: 10px;
			}

				.menu ul li:last-child {
					margin-right: 0;
				}

				.menu ul li a {
					text-decoration: none;
					color: #333;
					font-weight: bold;
				}

		.menu {
			flex-grow: 1;
			text-align: center;
		}

		.logo-img {
			height: 60px;
			width: 150px;
		}

		.space1 {
			height: 20px;
		}

		.space2 {
			width: 10px;
		}

		/*Hàng thứ 2*/
		.Info_user {
			display: flex;
			justify-content: center;
			align-items: center;
			height: 50px;
			width: 200px;
			background-color: #E7E7E7;
			color: #D11717;
		}

		.left_IU {
			flex-grow: 1;
		}

		.right_IU {
			flex-shrink: 0;
			width: 45px;
		}

		.container_underAPPBAR {
			display: flex;
			align-items: center;
		}

		/*Search*/
		/*welcome cũng là search_container*/
		.Welcome {
			display: flex;
			justify-content: center;
			align-items: center;
			width: 100%;
			height: 50px;
			background-color: #E7E7E7;
		}


		.search_bar {
			display: flex;
			align-items: center;
			height: 20px;
			width: 150px;
		}

			.search_bar input[type="text"] {
				padding: 5px;
				border-radius: 5px;
				border: 1px solid #ccc;
			}

			.search_bar button {
				background-color: #333;
				color: #fff;
				border: none;
				padding: 5px 10px;
				border-radius: 0 5px 5px 0;
				cursor: pointer;
			}

		/*Hàng thứ 3*/

		.container_underINTRODUCTION {
			display: flex;
			align-items: center;
		}

		.Button_List {
			display: flex;
			flex-direction: column;
			justify-content: start;
			align-items: center;
			height: 500px;
			width: 200px;
			background-color: white;
			color: #D11717;
		}


		.text_introduce {
			display: flex;
			flex-direction: column;
			justify-content: start;
			align-items: start;
			width: 100%;
			height: 500px;
			background-color: white;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">


		<!--Appbar-->
		<div class="container">
			<div class="logo">
				<img src="Image/DTU.png" alt="Logo DTU" class="logo-img" />
			</div>

			<div class="space1"></div>
			<div class="menu">
				<ul>
					<li><a href="#">Trang Chủ</a></li>
					<li><a href="#">Giới Thiệu</a></li>
					<li><a href="#">Dịch Vụ</a></li>
					<li><a href="#">Liên Hệ</a></li>
				</ul>
			</div>
		</div>

		<!-- Khoảng cách -->
		<div class="space1"></div>
		<!-- Khoảng cách -->


		<!--------------------------------------------------------------- Ở dưới Appbar -->
		<div class="container_underAPPBAR">
			<!--Bên trái -->
			<div class="Info_user">
				<div class="right_IU" style="margin-left: 20px">
					<a href="Information User/userInfo.aspx">
						<img src="Image/user.png" width="30px" height="30px" />
					</a>
				</div>

				<div class="left_IU">
					<asp:Label runat="server" ID="txtNameUser" />
					<br />
					<asp:Label runat="server" ID="txtUserName" />
				</div>
			</div>

			<div class="space2"></div>

			<!--Bên phải : giới thiệu-->
			<div class="Welcome">
				<h3>WELCOME TO SUPPORT LEARNING - A Collaborative Learning Platform </h3>
			</div>
		</div>


		<!--------------------------------------------------------------- Ở dưới thanh USER INFO (Tên, mssv)-->
		<div class="space1"></div>

		<div class="container_underINTRODUCTION">
			<!--Bên trái -->
			<div class="Button_List">
				<asp:Button ID="bt_UserInfo" runat="server" Text="Personal information" Height="30px" Width="150px" BorderColor="#C41E2B" ForeColor="#ffffff" BackColor="#C41E2B" Style="border-radius: 5px" OnClick="bt_UserInfo_Click" />
				<div class="space1"></div>
				<asp:Button ID="bt_Friends" runat="server" Text="Friends" Height="30px" Width="150px" BorderColor="#C41E2B" ForeColor="#ffffff" BackColor="#C41E2B" Style="border-radius: 5px" OnClick="bt_Friends_Click" />
				<div class="space1"></div>
				<asp:Button ID="bt_studySpace" runat="server" Text="Study Space" Height="30px" Width="150px" BorderColor="#C41E2B" ForeColor="#ffffff" BackColor="#C41E2B" Style="border-radius: 5px" OnClick="bt_studySpace_Click" />
				<div class="space1"></div>
				<asp:Button ID="bt_Chat" runat="server" Text="Chat" Height="30px" Width="150px" BorderColor="#C41E2B" ForeColor="#ffffff" BackColor="#C41E2B" Style="border-radius: 5px" OnClick="bt_Chat_Click" />
			</div>

			<div class="space2"></div>

			<!--Bên phải-->
			<div class="text_introduce">

				<asp:Label ID="Label1" runat="server" Text="GENERAL INTRODUCTION" ForeColor="Red"></asp:Label>
				<p>
					SUPPORT LEARNING is a dynamic online platform designed to facilitate collaborative learning and knowledge sharing among students. 
                This innovative system provides a comprehensive space for students to access and share information, learning materials, and resources for various subjects. 
                Moreover, it serves as a virtual hub where students can come together to discuss, analyze, and solve problems related to their coursework.
				</p>
				<p>
					By leveraging the power of collective learning, SUPPORT LEARNING aims to foster a sense of community and civic responsibility among students. 
                Our platform encourages students to engage in meaningful discussions, share their perspectives, and learn from one another's strengths and weaknesses. 
                Through this collaborative approach, we strive to equip students with the essential skills, knowledge, and values necessary to succeed in their academic pursuits and beyond.
				</p>
				<p>
					At SUPPORT LEARNING, we believe that learning is a continuous process that extends beyond the classroom. 
                Our platform is designed to provide students with a supportive environment that promotes active learning, critical thinking, and problem-solving. 
                By joining our community, students can tap into a wealth of resources, expertise, and experiences that will help them achieve their academic goals and become responsible citizens.
				</p>

				<div style="text-align: center;">
					If you are ready please
					<asp:Button ID="bt_new" runat="server" Text="click here" ForeColor="#3366ff" OnClick="bt_new_Click" />
					to go to the main space of the system or click on the "Learning space" button on the left
				</div>
			</div>
		</div>
	</form>
</body>
</html>
