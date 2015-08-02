<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dingwei.aspx.cs" Inherits="_Default" %>

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
   <title>Document</title>
     <style type="text/css">
         .auto-style3 {
             height: 37px;
             line-height: 37px;
             background: url('images/box_top.png') repeat-x 0px 0px;
             font-size: medium;
         }
         .auto-style4 {
             text-align: left;
         }
         </style>
     <script>

     </script>
 </head>
<body>
    <form id="form1" runat="server" method ="get" >
        <div class="box_border">
        <div class="auto-style3">
                <asp:Button ID="Button_yuangongxingxi" runat="server" Font-Size="Large" Text="当前定位" BackColor="#F3F6F8" Font-Bold="True"  />
              </div></div>
      <div style="height: 248px; width:1000px; margin-left:10%;">
          
          <table>
              <tr>
                  <td>          
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="248px" ImageUrl="~/images/clicklocation.gif" OnClick="ImageButton1_Click" Width="248px"   />
                   </td>
                  <td>
                      <div style="width:300px; margin-left:25%;">
                          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <table class="form_table" border="0" cellpadding="0" cellspacing="0" style="text-align: center">
                <tr>
                     <td style="font-size:large" class="auto-style4">日期: </td>
                  <td class="auto-style4">
                      
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                          <ContentTemplate>
                              <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                              <asp:Timer ID="Timer2" runat="server" Interval="1000">
                              </asp:Timer>
                          </ContentTemplate>
                      </asp:UpdatePanel>
                    </td>
                </tr>
                   
                        <tr><td></td></tr>
                    <tr>
                  <td style="font-size:large" class="auto-style4">当前时间:</td>
                  <td>
                      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                          <ContentTemplate>
                              <asp:Label ID="Label2" runat="server" Text="Label2" Font-Size="Large"></asp:Label>
                              <asp:Timer ID="Timer3" runat="server" Interval="1000">
                              </asp:Timer>
                          </ContentTemplate>
                      </asp:UpdatePanel>
                        </td></tr>
                    <tr><td></td></tr>
                  <tr><td style="font-size:large" class="auto-style4">隧道内人数:</td>
                  <td>
                      <asp:Label ID="Label3" runat="server" Text="" Font-Size="Large"></asp:Label>
                      </td></tr>           
                
              </table>
                      </div>
                  </td>
              </tr>
          </table>        
          
      </div>
          <table class="auto-style1">
          <tr>
              
              <td> 
              <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>
    <div style="width:1224px; height:248px; border:0px solid #ddd;position:relative;background-image: url('images/tunnel.png');">
      
        <asp:Image id="span1" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
        <asp:Image id="span2" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
        <asp:Image id="span3" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
        <asp:Image id="span4" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
        <asp:Image id="span5" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
        <asp:Image id="span6" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/user.gif'); width: 12px; height: 16px;"/>
        <asp:Image id="span7" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/user.gif'); width: 12px; height: 16px;"/>
        <asp:Image id="span8" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/user.gif'); width: 12px; height: 16px;"/>
        <asp:Image id="span9" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/user.gif'); width: 12px; height: 16px;"/>     
        <asp:Image id="span10" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/user.gif'); width: 12px; height: 16px;"/>
        
        <asp:Timer ID="Timer1" runat="server"  OnTick="Timer1_Tick" Enabled="false" Interval="5000"></asp:Timer>
</div>  </ContentTemplate></asp:UpdatePanel>
              </td>
          </tr>          
          </table><div style="margin-top:2%;margin-left:30%">
        <asp:Label ID="Label4" runat="server" Text="Label" Visible="false" Font-Size="Large" ForeColor="Red"></asp:Label></div>
    </form>
</body>
</html>
