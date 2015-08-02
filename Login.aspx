<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="css/login.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
   
	<title>隧道施工人员定位系统</title>
</head>
<body>
	<div id="login_top">
		<div id="welcome">
			欢迎使用隧道施工人员定位系统
		</div>		
	</div>
	<div id="login_center">
		<div id="login_area" aria-atomic="False" aria-autocomplete="none">
			<div id="login_form">
				<form id="form1" runat="server">
					<div id="login_tip">
						用户登录&nbsp;&nbsp;UserLogin
					</div>                   
                    <div style="margin-top:3%">用户名：</div>
					<div><input type="text"   class ="username"  name="Uname"  runat="server" id="uname" style="margin-top:0%"/></div>
                    <div style="margin-top:5%">密码：</div>                     
					<div><input type="password"   class ="pwd"   runat="server" id="pword" style="margin-top:0%"/></div>                
					<div id="btn_area">	
                        
                          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="Login_Click" ImageUrl="~/images/login.png" Height="33px" Width="86px"/>					
                  	      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/zhuce.png" OnClick="ImageButton2_Click" Height="33px" Width="86px" /> 
                                                 
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="login_bottom">
		版权所有 创新项目小组
	</div>
</body>
</html>
