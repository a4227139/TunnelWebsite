<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="/js/jquery-1.11.3.js"></script>
     <script runat="server">
        public string Hello()
        {
            Response.Write("Hello!");
            return "Hello!!!";
        }
    </script>
<script>
    $(document).ready(function () {
        $("button").click(function () {
            $("#p1").hide();
        });
        
        $("#p1").text("First Paragraph");
    });
</script>
   <script >
       //var t = setTimeout("Show()", 1000);
       var c = <%=num%>
        //s=<%=behideMethod()%>
       function Show() {
           document.getElementById("p3").innerHTML = c;
           t = setTimeout("Show()", 1000);
           c -= 1;
           if (c <0) clearTimeout(t);
       }
     </script>
</head>
<body>

<h2>这是标题</h2>
<p id="p1">这是一个段落。</p>
<p id="p2">这是另一个段落。</p>
<p id="p3">前台用< %= %>调用后台方法 <%= behideMethod() %></p>
    <br />
    <form runat="server">
 <asp:TextBox ID="TextBox1" runat="server" Text="<%=name%>" ></asp:TextBox> 
        <input  value="<%=behideMethod()%>"/>
        <label><%=name%></label>
        </form>
<button onclick="Show()">点击这里</button>
    <br />利用“< %Response.Write("Hello World!");%> ”输出固定文本<br />
<%Response.Write("Hello World!");%> 
    <br />利用< %Hello();%>调用定义在前台javascript中服务器端脚本中的函数Hello()<br />
<%Hello();%>
</body>
</html>
