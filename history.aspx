<%@ Page Language="C#" AutoEventWireup="true" CodeFile="history.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>


<html lang="zh-CN">
 <head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="css/common.css">
   <link rel="stylesheet" href="css/main.css">
   <script type="text/javascript" src="js/jquery.min.js"></script>
   <script type="text/javascript" src="js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="js/common.js"></script>
     <script type ="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
   <script type="text/javascript" src="layer/layer.js"></script>
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
     </style>
     <script >
         //var t = setTimeout("Show()", 1000);
         var c = 1;
         function Show() {
             var s = "span" + c;
             var span = document.getElementById(s);
             var left, right;
             var count;
             count=<%=countpan%>
             span.style.display = "";
             t = setTimeout("Show()", 1000);
             c += 1;
             if (c > count) clearTimeout(t);
         }
     </script>
 </head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style3">
                <asp:Button ID="Button_yuangongxingxi" runat="server" Font-Size="Large"  Text="历史轨迹查询" BackColor="#F3F6F8" Font-Bold="True" />
              </div>
        <div>
    
          <table class="form_table">
            <tr>
                  <td>
                    <table class="form_table">
                        <tr>
                            <td ></td>
                            <td >请输入员工编号：</td>
                            <td><input type="text" name="name" runat="server" class="input-text lh25" size="10" id="TextBox_ID">
                                
                                    <script>
                                        $('#TextBox_ID').on('click', function () {
                                            layer.tips('示例：24167或242248或241228', '#TextBox_ID', { tips: [1, "#3595CC"], time: 5000 });
                                    });
                                </script>
                                
                            </td>
                            <td  colspan="6"></td>
                        </tr>
                        
                        <tr>
                            <td >&nbsp;</td>
                            <td >请输入查询时间：</td>
                            <td><input type="text" name="name" runat="server" class="input-text lh25" size="10" id="TextBox_date" value ="2015-03-17" onclick="WdatePicker()"/>
                                <script>
                                    $('#TextBox_date').on('click', function () {
                                        layer.tips('时间', '#TextBox_date', { tips: [1, "#3595CC"], time: 5000 });
                                    });
                                </script>
                            </td>
                            <td >
                    <asp:Button ID="Button_OK" runat="server" Text="查询"  class="btn btn82 btn_search" OnClick="Button_OK_Click" Width="84px"/> 
                            </td>
                            <td  colspan="2">
                                &nbsp;</td>
                            <td >
                            <td >
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        
                                &nbsp;</td>
                        
                    </table>
                 </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" Height="212px" Width="688px">
                    </asp:GridView>
                    
                    <table class="form_table">
                        <tr>
                            <td>
                                <div style="width:1224px; id=tunnel_picture; height:248px; border:0px solid #ddd;position:relative; top: -3px; left: -1px; background-image: url('images/tunnel.png');">     
                                    <asp:Image id="span1" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span2" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span3" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span4" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span5" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span6" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span7" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span8" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span9" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span10" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span11" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span12" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span13" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span14" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span15" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span16" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span17" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span18" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span19" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span20" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span21" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span22" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span23" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span24" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span25" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span26" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span27" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span28" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span29" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span30" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span31" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span32" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span33" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span34" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span35" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span36" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px;background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span37" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span38" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span39" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span40" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span41" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span42" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span43" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span44" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span45" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span46" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span47" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span48" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px;background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span49" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:Image id="span50" runat="server" tooltip="" style="display:none; position:absolute;top:0px; left:0px; background-image: url('images/worker.jpg'); width: 14px; height: 26px;"/>
                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                    <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="1000" OnTick="Timer1_Tick">
                                    </asp:Timer>
                                </div>
                            </td>
                        </tr>
                    </table><div style="margin-left:30%">
        <asp:Label ID="Label4" runat="server" Text="Label" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label></div>
                </td>
            </tr>
        </table>
    <div class="auto-style3">
                <asp:Button ID="Button1" runat="server" Font-Size="Large"  Text="该员工信息" BackColor="#F3F6F8" Font-Bold="True" />
              </div>

    </div>
    </form>
           <table class="form_table" border="0" cellpadding="0" cellspacing="0" style="text-align: center">
                <tr><td></td>
                  <td>&nbsp; 姓名&nbsp; </td>
                  <td><input type="text" name="name6" runat="server" class="input-text lh25" size="10" id="name" readonly="readonly"></td>
                  <td>年龄</td>
                  <td class="auto-style2">
                      <input type="text" name="name0" runat="server" class="input-text lh25" size="10" id="age" readonly="readonly"></td>
                                                         
              </tr>
                <tr><td></td>
                  <td>性别</td>
                  <td><input type="text" name="name7" runat="server"  class="input-text lh25" size="10" id="sex" readonly="readonly"></td>
                  <td>工种</td>
                  <td class="auto-style2">                    
                      <input type="text" name="name1" runat="server"  class="input-text lh25" size="10" id="gongzhong" readonly="readonly"></td>
                                 
                </tr>
              </table>
                </body>
</html>
