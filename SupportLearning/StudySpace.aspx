<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudySpace.aspx.cs" Inherits="SupportLearning.StudySpace" Async="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Study Space</title>
	<style>
		.space1 {
			height: 20px;
		}

		.space2 {
			height: 10px;
		}

		.space {
			width: 10px;
		}

		.spacewidth {
			width: 20px;
		}

		.container {
			display: flex;
			padding: 30px 70px;
			background-color: #f0f0f0;
			justify-content: center;
			align-items: center;
		}

		.topicHeader {
			color: #D11717;
			font-weight: bold;
			font-size: 25px;
		}

		.search_container {
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


		/* CSS dưới search*/
		.container_underInfoSearchBar {
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

		.container_Fill_Post {
			display: flex;
			flex-direction: column;
			justify-content: start;
			align-items: start;
			width: 450px;
			height: 500px;
			background-color: white;
		}





		.like-button:hover, .comment-button:hover {
			background-color: #76b207; /* Màu nền khi di chuột lên */
		}

		/*								CSS của cột thứ 3 						*/



		/*css Bài Post*/


		.container_List_Post {
			display: flex;
			flex-direction: column;
			justify-content: start;
			align-items: start;
			width: 450px;
			height: 500px;
			background-color: white;
			margin-right: 10px;
		}

		.Bar_new1 {
			background-color: #89DA09;
			padding: 20px;
			margin-bottom: 10px;
			border-radius: 5px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
			width: 400px;
		}

		.on {
			font-weight: bold;
		}

		.bar_file_word {
			background-color: wheat;
			padding: 10px;
			margin-bottom: 5px;
			border-radius: 5px;
		}

		.Like_Comment {
			display: flex;
			justify-content: space-around;
			padding: 5px;
			border-radius: 5px;
		}

		.like-button, .comment-button, .post_button {
			padding: 5px 10px;
			margin: 5px;
			border: none;
			border-radius: 5px;
			color: white;
			background-color: #D11717;
			font-size: 14px;
			cursor: pointer;
			transition: background-color 0.3s;
		}


		/*css Thanh hiển thị bài post	*/
		.Bar_Post {
			height: auto;
			width: 400px;
			background-color: white;
			border-radius: 5px;
			padding: 20px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		}

		.modal-body {
			display: flex;
			flex-direction: column;
		}

		.form-group {
			display: flex;
			align-items: center;
			margin-bottom: 10px;
		}

		.form-label {
			margin-right: 10px;
			width: 200px;
		}

		/*								CSS của cột thứ 4 - 							*/

		.container_result_Search {
			display: flex;
			flex-direction: column;
			justify-content: start;
			align-items: start;
			width: 250px;
			height: 500px;
			background-color: white;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
			margin-left: 10px;
			padding: 10px;
			box-sizing: border-box;
		}

		.Bar_new2 {
			background-color: #89DA09;
			padding: 20px;
			margin-bottom: 10px;
			border-radius: 5px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
			width: 150px;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">

		<!-- START        Header -->
		<div class="container">
			<img src="Image/studySpace.png" height="70px" width="80px" />
			<div class="space"></div>
			<asp:Label ID="Label1" runat="server" Text=" YOUR STUDY SPACE" CssClass="topicHeader"></asp:Label>
		</div>
		<!-- End Header -->
		<div class="space1"></div>


		<!-- START       search bar-->
		<div class="search_container">
			<div class="search_bar">
				<asp:TextBox ID="txt_search_text" runat="server" type="text" placeholder="Document Search Here ..." Style="flex: 1; height: 20px;" />
			</div>

			<!-- ngăn cách giữa search và button-->
			<div class="space"></div>
			<div class="space"></div>
			<div class="space"></div>
			<div class="spacewidth"></div>

			<asp:ImageButton ID="image_button" runat="server" ImageUrl="~/Image/search.png" Height="25px" Width="20px" OnClick="image_button_Click" />
			<div class="space"></div>
			<asp:ImageButton ID="image_button_phanloai" runat="server" ImageUrl="~/Image/filter.png" Height="25px" Width="20px" />
		</div>
		<!-- END search bar-->
		<div class="space2"></div>


		<!-- START       underSearchbar  -->
		<div class="container_underInfoSearchBar">
			<!--Bên trái -->
			<div class="Button_List">
				<asp:Button ID="bt_Chat" runat="server" Text="Chat" Height="30px" Width="150px" BorderColor="#C41E2B" ForeColor="#ffffff" BackColor="#C41E2B" Style="border-radius: 5px" OnClick="bt_Chat_Click" />
				<div class="space1"></div>
			</div>

			<div class="space"></div>
			<div class="space"></div>


			<!--																													CỘT 2				 -->
			<!--Bên phải-->
			<div class="container_Fill_Post">

				<!-- Thanh Post Bài cho sinh viên -->
				<div class="Bar_Post">
					<asp:Label ID="Label2" runat="server" Text="Bạn muốn chia sẻ điều gì đó ?" Font-Bold="True"></asp:Label>

					<div class="space2"></div>

					<div class="modal-body">

						<div class="form-group">
							<label class="form-label" for="txt_PostID">Code Studnet</label>
							<asp:TextBox ID="txt_Code_User" CssClass="form-control" placeholder="Code Studnet" runat="server" />
						</div>

						<div class="form-group">
							<label class="form-label" for="txt_PostID">CMND</label>
							<asp:TextBox ID="txt_CMND" CssClass="form-control" placeholder="CMND" runat="server" />
						</div>

						<div class="form-group">
							<label class="form-label" for="txt_PostID">Post Document ID</label>
							<asp:TextBox ID="txt_PostID" CssClass="form-control" placeholder="Post ID" runat="server" />
						</div>

						<div class="form-group">
							<label class="form-label" for="txt_PostID">Document ID</label>
							<asp:TextBox ID="txt_DocumentID" CssClass="form-control" placeholder="Document ID" runat="server" />
						</div>

						<div class="form-group">
							<label class="form-label" for="txt_NameUser">Your Name</label>
							<asp:TextBox ID="txt_NameUser" CssClass="form-control" placeholder="Your Name" runat="server" />
						</div>

						<div class="form-group">
							<label class="form-label" for="txt_NameDoc">Document Name</label>
							<asp:TextBox ID="txt_NameDoc" CssClass="form-control" placeholder="Document Name" runat="server" />
						</div>

						<div class="form-group">
							<label class="form-label" for="txt_Description_Doc">Description</label>
							<asp:TextBox ID="txt_Description_Doc" CssClass="form-control" placeholder="Description about document" runat="server" />
						</div>

						<div class="form-group">
							<label class="form-label" for="bt_UpLoad">File Document</label>
							<asp:FileUpload ID="bt_UpLoad" CssClass="form-control" runat="server" />
						</div>
						<br />
						<asp:Button ID="bt_OpenModal" CssClass="post_button" runat="server" Text="Post" OnClick="bt_Modal_Click" />

					</div>
				</div>
			</div>


			<!--Format của người dùng khi đăng tài liệu-->



			<!--																								START CỘT THỨ 3 						 -->
			<div class="container_List_Post">
				<div class="new1">
					<asp:DataList ID="DataList1" runat="server">
						<ItemTemplate>
							<!-- Hidden field to store PostDocID -->
							<asp:HiddenField ID="hfPostDocID" runat="server" Value='<%# Eval("PostDocID") %>' />


							<!-- Bắt đầu bảng tin - Nhớ css -->
							<div class="Bar_new1">
								<div class="on">
									<%# Eval("PostDocID") %>
									<%# Eval("Name_UserInfo") %>
								</div>
								<div>
									<asp:Button ID="bt_meetingroom" runat="server" Text="Phòng Họp" OnClick="bt_MeetingRoom_Click" />
								</div>


								<div class="under">
									<div style="opacity: 0.5;">
										<%# Eval("TimePost_Doc") %>
									</div>
									<div>
										<%# Eval("Description_Doc") %>
									</div>

									<div class="space"></div>

									<div class="bar_file_word">
										<b><i><%# Eval("Name_Doc") %></i></b>
										<div>
											<a href='<%# "download_handler.ashx?id=" + Eval("PostDocID") %>'>Tải Tệp</a>
										</div>
									</div>
								</div>

								<div class="Like_Comment">
									<asp:Button ID="LikeButton" runat="server" CssClass="like-button" Text='<%# "Like - " + Eval("TotalLike") %>' />

									<asp:Button ID="CommentButton" runat="server" Text="Comment" CssClass="comment-button" />

								</div>

							</div>

							<div class="space2"></div>

						</ItemTemplate>
					</asp:DataList>
				</div>
			</div>



			<!--																								START CỘT CUỐI CÙNG                                      -->
			<div class="container_result_Search">
				<div class="space"></div>
				<asp:Label ID="Label3" runat="server" Text="Kết Quả Tìm Kiếm" Font-Bold="true"></asp:Label>
				
				<asp:DataList ID="DataList2" runat="server">
					<ItemTemplate>
						<div class="Bar_new2">
							<div class="on">
								<%# Eval("Name_Doc") %>
								<%# Eval("Code_User") %>
							</div>
							<br />
							<a href='<%# "Search_Handler.ashx?name=" + Eval("Name_Doc") %>'>Tải Tệp</a>
						</div>
					</ItemTemplate>
				</asp:DataList>
			</div>



		</div>
	</form>
</body>
</html>



