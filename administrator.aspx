<%@ Page Language="C#" AutoEventWireup="true" CodeFile="administrator.aspx.cs" Inherits="administrator" %>

<!DOCTYPE html>
 <html lang="zh-CN">
 <head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="css/common.css">
   <link rel="stylesheet" href="css/main.css">
   <script type="text/javascript" src="js/jquery.min.js"></script>
   <script type="text/javascript" src="js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="js/common.js"></script>
   
   <script type="text/javascript">
       $(function () {
           $(".list_table").colResizable({
               liveDrag: true,
               gripInnerHtml: "<div class='grip'></div>",
               draggingClass: "dragging",
               minWidth: 30
           });

       });
   </script>
   <title>用户注册</title>
     <style type="text/css">
         .auto-style1 {
             height: 48px;
             line-height: 37px;
             background: url('images/box_top2.png') repeat-x 0px 0px;
             font-size: xx-large;
         }
         .pagepic {
             background: url('images/login/logoBg.gif');
             background-position:center;
         }
         .auto-style4 {
             height: 60px;
         }
         .auto-style5 {
             width: 110px;
             font-size: x-large;
             height: 60px;
         }
         .auto-style6 {
             width: 110px;
         }
         .auto-style10 {
             height: 27px;
             width: 128px;
         }
         .auto-style12 {
             height: 57px;
             width: 128px;
         }
         .auto-style13 {
             width: 128px;
         }
         </style>
 </head>
 <body >
     
     <form id="form1" runat="server">
         <asp:Image  runat="server" ImageUrl="~/images/zhucetop.png" Height="90px" Width="100%" />
  <div class="container pagepic" style="height:900px">    
    <div id="search_bar" style="width:600px; height:500px; margin-left:35%; margin-top:5%; border:7px solid #f7f2f2">
       
          
            <div class="auto-style1">用户注册</div>
            <div style="background:#ffffff">
                <table class="form_table" border="0" cellpadding="0" cellspacing="0" style="text-align: center; background:#ffffff; width: 600px; height: 365px;">
                    <tr><td class="auto-style12"></td></tr>
                    <tr>
                        <td class="auto-style13"></td>
                        <td class="auto-style5">用户名 </td>
                         
                        <td class="auto-style4" >
                            <input class="input-text lh25" id="gly1" runat="server" name="name1" size="10" type="text"  /> </td>
                        <td></td>
                    </tr>
                    <tr><td class="auto-style10"></td></tr>
                    <tr>
                        <td class="auto-style13"></td>
                        <td class="auto-style5">密码 </td>
                        <td class="auto-style6"><input type="password" name="net" runat="server" class="input-text lh25" size="10" id="Password1"></td>
                    </tr>
                    <tr><td class="auto-style10"></td></tr>
                    <tr>
                        <td class="auto-style13"></td>
                        <td class="auto-style5">确认密码 </td>
                       <td class="auto-style6"><input type="password" name="net" runat="server" class="input-text lh25" size="10" id="Password2"></td>
                    </tr>
                    <tr>
                        <td class="auto-style13"></td>
                    </tr>                     
                </table>
            </div>
            <div style="border-top:1px solid #dadada; background:#ffffff; height: 84px;">            
     <div id="button" class="mt10" style="background:#ffffff; height: 77px;">
           <table>
               <tr>
                   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>                   
                   <td>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/zhuce3.png" Height="49px" OnClick="ImageButton1_Click"/>
           </td>
                   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td>
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/back.png" Height="49px"  OnClick="ImageButton2_Click"/>
           </td>
                       </tr>
                   </table>
            </div>
        </div>
    </div>                  
 <div class="bottom" style="margin-top:5%">
      <div id="bottom_bg" style="text-align:center"> Copyright 创新项目, All Rights Reserved</div>
    </div>     

      </div>    
    </form>

 </body>
 </html>
