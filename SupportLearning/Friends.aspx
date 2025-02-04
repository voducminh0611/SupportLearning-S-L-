<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Friends.aspx.cs" Inherits="SupportLearning.Friends" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Friends Management</title>
	<style>
		.relationship-item {
			padding: 10px;
			margin-bottom: 10px;
			border: 1px solid #ccc;
		}

		.section-title {
			font-weight: bold;
			margin-top: 20px;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<asp:Label ID="lblFriends" runat="server" Text="Danh sách bạn bè" CssClass="section-title"></asp:Label>
			<asp:DataList ID="List_IsFriends" runat="server">
				<ItemTemplate>
                    <div class="relationship-item">
                        <strong><%# Eval("UserName") %></strong> - 
                        <span><%# Eval("FriendCode") %></span> - 
                        <span><%# Eval("RelationshipStatus") %></span>
                    </div>
                </ItemTemplate>
			</asp:DataList>

			<asp:Label ID="lblNotFriends" runat="server" Text="Danh sách những người chưa là bạn bè" CssClass="section-title"></asp:Label>
			<asp:DataList ID="List_NotFriends" runat="server">
				<ItemTemplate>
                    <div class="relationship-item">
                        <strong><%# Eval("UserName") %></strong> - 
                        <span><%# Eval("FriendCode") %></span> - 
                        <span><%# Eval("RelationshipStatus") %></span>
                    </div>
                </ItemTemplate>
			</asp:DataList>

		</div>
	</form>
</body>
</html>
