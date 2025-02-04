<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="SupportLearning.Chat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Chat</title>
	<style>
	    .chat_container {
	        display: flex;
	        flex-direction: column;
	        height: 80vh;
	        width: 60vw;
	        margin: 0 auto;
	        border: 1px solid #ccc;
	        padding: 10px;
	        background-color: #f9f9f9;
	    }

	    .chat_messages {
	        flex-grow: 1;
	        overflow-y: auto;
	        padding: 10px;
	        border-bottom: 1px solid #ccc;
	    }

	    .chat-input {
	        display: flex;
	        flex-direction: column;
	        margin-top: 10px;
	    }

	        .chat-input input {
	            padding: 10px;
	            border: 1px solid #ccc;
	            border-radius: 4px;
	            margin-bottom: 10px;
	        }

	        .chat-input button {
	            padding: 10px;
	            border: 1px solid #ccc;
	            border-radius: 4px;
	            background-color: #007bff;
	            color: white;
	            cursor: pointer;
	        }
	</style>
</head>
<body>
	<form id="form1" runat="server">
		<div class="chat_container">
			<div class="chat_messages" id="chatMessage">
				<asp:Repeater ID="rpt_Message" runat="server">
					<ItemTemplate>
						<div>
							<span><%# Eval("SenderCode_User") %>:</span>
							<span><%# Eval("Content_Mess") %></span>
						</div>
					</ItemTemplate>
				</asp:Repeater>
			</div>

			<div class="chat-input">
				<input type="text" id="txt_ReceiverCode" runat="server" placeholder="Enter the User code you want to Chat.." />
				<input id="ip_mess" runat="server" type="text" placeholder="Type a message ..." />
				<asp:Button ID="bt_send" runat="server" Text="Send" OnClick="bt_send_Click" />
			</div>
		</div>


	</form>
</body>
</html>
