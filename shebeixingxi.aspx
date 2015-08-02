<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shebeixingxi.aspx.cs" Inherits="manage2" %>

<!DOCTYPE html>

<html lang="zh-CN">
 <head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="css/common.css">
   <link rel="stylesheet" href="css/main.css">
   <script type="text/javascript" src="js/jquery.min.js"></script>
   <script type="text/javascript" src="js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="js/common.js"></script>
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
         .auto-style1 {
             width: 69px;
         }
         .auto-style2 {
             width: 116px;
         }
         .auto-style3 {
             height: 37px;
             line-height: 37px;
             background: url('images/box_top.png') repeat-x 0px 0px;
             font-size: medium;
         }
     </style>
 </head>
 <body>
    
     <form id="form1" runat="server">
  <div class="container">
    <div id="search_bar" class="mt10">
       <div class="box" >
          <div class="box_border">
            <div class="auto-style3"><asp:Button ID="Button_device0" runat="server" Font-Size="Large" OnClick="Button_device0_Click" Text="设备信息" BackColor="#F3F6F8" Width="87px" Font-Bold="True"   />
              </div>
            <div class="box_center pt10 pb10" runat="server" id="div1" style="display:normal">
                <tr>
                  <td>&nbsp;请输入设备地址</td>
                  <td><input maxlength=6  onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeypress="if (event.keyCode<48 || event.keyCode>57) event.returnValue=false;" type="text" name="name" runat="server" class="input-text lh25" size="10" id="syname">
                      <script>
                          $('#syname').on('click', function () {
                              layer.tips('请输入正确的设备地址（数字）例如：24167', '#syname', { tips: [1, "#3595CC"], time: 6000 });
                          });
                          </script>
                  </td>
                  
                        <asp:Button ID="Bt_search" runat="server" Text="查询"  class="btn btn82 btn_search" OnClick="Bt_search_Click" Width="84px"/>  </tr>
           <table class="form_table" border="0" cellpadding="0" cellspacing="0" style="text-align: center">
                <tr>
                  <td>设备地址</td>
                  <td><input  maxlength=6  onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeypress="if (event.keyCode<48 || event.keyCode>57) event.returnValue=false;" type="text" name="net" runat="server" class="input-text lh25" size="10" id="net">
                       <script>
                           $('#net').on('click', function () {
                               layer.tips('请输入正确的设备地址（数字）例如：24167', '#net', { tips: [1, "#3595CC"], time: 6000 });
                           });
                          </script>
                  </td>
                  
                  <td>电压</td>
                  <td class="auto-style1">
                      <input  maxlength=4   onkeypress="if ((event.keyCode<48 || event.keyCode>57)&&event.keyCode!=46 )event.returnValue=false;" type="text" name="voltage" runat="server" class="input-text lh25" size="10" id="voltage">
                       <script>
                           $('#voltage').on('click', function () {
                               layer.tips('请输入正确的电压值（含小数）', '#voltage', { tips: [1, "#3595CC"], time: 6000 });
                           });
                          </script>
                  </td>   
                    <td>类型</td>
                      <td>
                          <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="select" >
                          </asp:DropDownList>
                    </td>
                </tr></table><div style="float:right;position:relative; top: -68px; left: -163px;">
                  <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="注意：（1）该网页中，若要新增、修改或删除设备信息请先输入<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 相关信息，再点击按钮。<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （2）清空按钮：将输入在文本框中的相关信息清空。<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （3）当类型选择为定位基点时，还需输入基点坐标。<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （4）各标题栏可点击进行收缩或展开。"></asp:Label></div>
                <div class="box_center pt10 pb10" runat="server" id="div3" style="display:none">
               <tr>
                   <td>基点坐标X
                   </td>
                  <td class="auto-style1">
                      <input onkeypress="if ((event.keyCode<48 || event.keyCode>57)&&event.keyCode!=46 )event.returnValue=false;" type="text" name="maodianx" runat="server" class="input-text lh25" size="10" id="maodianx" >
                      <script>
                          $('#maodianx').on('click', function () {
                              layer.tips('坐标为纯数字（含小数）', '#maodianx', { tips: [1, "#3595CC"], time: 6000 });
                          });
                          </script>
                  </td>  
                   <td>基点坐标Y</td>
                  <td class="auto-style1">
                      <input onkeypress="if ((event.keyCode<48 || event.keyCode>57)&&event.keyCode!=46 )event.returnValue=false;" type="text" name="maodiany" runat="server" class="input-text lh25" size="10" id="maodiany" >
                      <script>
                          $('#maodiany').on('click', function () {
                              layer.tips('坐标为纯数字（含小数）', '#maodiany', { tips: [1, "#3595CC"], time: 6000 });
                          });
                          </script>
                  </td>
               </tr>
              </div>
                <div class="search_bar_btn" style="text-align:left;">
                    <div id="button" class="mt10" >
                        &nbsp;&nbsp;
                        <asp:Button ID="Bt_new" runat="server" Text="新增"  class="btn btn82 btn_add" OnClick="Bt_new_Click" Width="84px"/> 
                        <asp:Button ID="Bt_change" runat="server" Text="修改"  class="btn btn82 btn_config" OnClick="Bt_change_Click" Width="84px"/>  
                        <asp:Button ID="Bt_delete" runat="server" Text="删除"  class="btn btn82 btn_del" OnClick="Bt_delete_Click" Width="84px"/>                   
                        <asp:Button ID="Bt_clean" runat="server" Text="清空"  class="btn btn82 btn_recycle" OnClick="Bt_clean_Click" Width="84px"/>  
                        </div>
                    &nbsp;</div>
            </div>
          </div>
        </div>
        <div class="box">
          <div class="box_border">
            <div class="auto-style3"><asp:Button ID="Button_device" runat="server" Font-Size="Large" OnClick="Bt_browse_Click" Text="浏览所有设备信息" BackColor="#F3F6F8" Width="160px" Font-Bold="True"  />
              </div>
            <div class="box_center pt10 pb10" runat="server" id="div2" style="display:none">
                <div class="search_bar_btn" style="text-align:left;">
                    <div id="button1" class="mt10" >

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowSorting="true" BackColor="White" BorderColor="#F3F6F8" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource3" Width="652px" >
                           <RowStyle  Height="45px" Width="116"  HorizontalAlign="Center" ForeColor="#000066"/>
                     
                     <FooterStyle BackColor="White" ForeColor="#000066" />
                             <HeaderStyle Height="40px" HorizontalAlign="Center" BackColor="#F3F6F8" Font-Bold="True" ForeColor="Black"/> 
                            <Columns>
                                <asp:BoundField DataField="Net" HeaderText="节点地址" SortExpression="Net" />
                                <asp:BoundField DataField="Type" HeaderText="类型" SortExpression="Type" />
                                <asp:BoundField DataField="Voltage" HeaderText="电压" SortExpression="Voltage" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#F3F6F8" Font-Bold="True" ForeColor="Black" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ContikiConnectionString4 %>" SelectCommand="SELECT * FROM [Device]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                        
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        </div>
                    &nbsp;</div>
          
            </div>
          </div>
        </div>
    </div>
   </div> 
        
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ContikiConnectionString3 %>" SelectCommand="SELECT * FROM [Eminformation]"></asp:SqlDataSource>
     </form>
 </body>
 </html>
   