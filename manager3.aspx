<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manager.aspx.cs" Inherits="manage2" %>

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
       <div class="box">
          <div class="box_border">
            <div class="auto-style3">
                <asp:Button ID="Button_yuangongxingxi" runat="server" Font-Size="Large" OnClick="Button_yuangongxingxi_Click" Text="员工信息" BackColor="#F3F6F8" Font-Bold="True"  />
              </div>
            <div class="box_center pt10 pb10" runat="server" id="div1" style="display:none">
            <tr>
                  <td>&nbsp;按姓名查询</td>
                  <td><input onkeyup="value=value.replace(/[ -~]/g,'')" onkeydown="if(event.keyCode==13)event.keyCode=9" type="text" name="syname" runat="server" class="input-text lh25" size="10" id="syname">
                      <script>
                          $('#syname').on('click', function () {
                              layer.tips('仅可输入中文，实例：张三', '#syname', { tips: [1, "#3595CC"], time: 6000 });
                          });
                                </script>
                  </td>
                  <td>&nbsp;&nbsp;&nbsp;</td>
                  <td>按佩戴节点查询</td>
                      <input  maxlength=6  onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeypress="if (event.keyCode<48 || event.keyCode>57) event.returnValue=false;" type="text" name="synet"  runat="server" class ="input-text lh25" size="10" id="synet">
                <script>
                    $('#synet').on('click', function () {
                        layer.tips('仅可输入数字，实例：24167', '#synet', { tips: [1, "#3595CC"], time: 6000 });
                    });
                                </script>
                </td>                                         
           </tr>
                        <asp:Button ID="Bt_search" runat="server" Text="查询"  class="btn btn82 btn_search" OnClick="Bt_search_Click" Width="84px"/>  
           <table class="form_table" border="0" cellpadding="0" cellspacing="0" style="text-align: center">
                <tr>
                  <td>&nbsp; 姓名&nbsp; </td>
                  <td><input onkeyup="value=value.replace(/[ -~]/g,'')" onkeydown="if(event.keyCode==13)event.keyCode=9" type="text" name="name" runat="server" class="input-text lh25" size="10" id="name">
                      <script>
                          $('#name').on('click', function () {
                              layer.tips('请输入姓名（中文）', '#name', { tips: [1, "#3595CC"], time: 6000 });
                          });
                                </script>
                  </td>
                  <td>年龄</td>
                  <td class="auto-style2">
                      <input maxlength=2  onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeypress="if (event.keyCode<48 || event.keyCode>57) event.returnValue=false;" type="text" name="name0" runat="server" class="input-text lh25" size="10" id="age">
                      <script>
                          $('#age').on('click', function () {
                              layer.tips('请输入年龄（数字）', '#age', { tips: [1, "#3595CC"], time: 6000 });
                          });
                                </script>
                  </td>
                  <td>籍贯</td>
                  <td class="auto-style1">
                      <input onkeyup="value=value.replace(/[ -~]/g,'')" onkeydown="if(event.keyCode==13)event.keyCode=9" type="text" name="name4" runat="server" class="input-text lh25" size="10" id="address">
                      <script>
                          $('#address').on('click', function () {
                              layer.tips('请输入籍贯（中文）', '#address', { tips: [1, "#3595CC"], time: 6000 });
                          });
                                </script>
                  </td>
                  <td>佩戴节点</td>
                  <td>
                      <input  maxlength=6  onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeypress="if (event.keyCode<48 || event.keyCode>57) event.returnValue=false;" type="text" name="name2"  runat="server" class ="input-text lh25" size="10" id="node">
                      <script>
                          $('#node').on('click', function () {
                              layer.tips('请设备地址（数字）', '#node', { tips: [1, "#3595CC"], time: 6000 });
                          });
                                </script>
                  </td>                                         
              </tr>
                <tr>
                  <td>性别</td>
                  <td>
                      <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="select">
                      </asp:DropDownList>
                    </td>
                  <td>工种</td>
                  <td class="auto-style2">                    
                      <input type="text" name="name1" runat="server"  class="input-text lh25" size="10" id="gongzhong">
                      <script>
                          $('#gongzhong').on('click', function () {
                              layer.tips('请输入工种名称', '#gongzhong', { tips: [1, "#3595CC"], time: 6000 });
                          });
                                </script>

                  </td>
                  <td>手机</td>
                  <td class="auto-style1"><input maxlength=11  onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeypress="if (event.keyCode<48 || event.keyCode>57) event.returnValue=false;" type="text" runat="server"  name="name5" class="input-text lh25" size="10" id="phone">
                      <script>
                          $('#phone').on('click', function () {
                              layer.tips('请输入正确的手机格式（11位数字）', '#phone', { tips: [1, "#3595CC"], time: 6000 });
                          });
                                </script>
                  </td>
                  <td>身份证号</td>
                  <td>
                      <input maxlength=18  onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeypress="if (event.keyCode<48 || event.keyCode>57) event.returnValue=false;" type="text" name="name3" runat="server"  class="input-text lh25" size="10" id="idcard">
                      <script>
                          $('#idcard').on('click', function () {
                              layer.tips('请输入正确的身份证格式（18位数字）', '#idcard', { tips: [1, "#3595CC"], time: 6000 });
                          });
                                </script>
                  </td>                 
                </tr>
              </table><div style="float:right;position:relative; top: -95px; left: -164px;">
                  <asp:Label ID="Label1" runat="server" Text="注意：（1）查询分按姓名查询和按佩戴节点查询两种，只需输入<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;员工的一种信息便可进行查询<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （2）该网页中，若要新增、修改或删除员工信息请先输入<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 相关信息，再点击按钮。<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （3）清空按钮：将输入在文本框中的相关信息清空。<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; （4）各标题栏可点击进行收缩或展开。"></asp:Label></div>
                <div class="search_bar_btn" style="text-align:left;">
                    <div id="button" class="mt10" >
                        &nbsp;&nbsp;
                        <asp:Button ID="Bt_new" runat="server" Text="新增"  class="btn btn82 btn_add" OnClick="Bt_new_Click" Width="84px"/> 
                        <asp:Button ID="Bt_change" runat="server" Text="修改"  class="btn btn82 btn_config" OnClick="Bt_change_Click" Width="84px"/>  
                        <asp:Button ID="Bt_delete" runat="server" Text="删除"  class="btn btn82 btn_del" OnClick="Bt_delete_Click" Width="84px"/>                   
                        <asp:Button ID="Bt_clean" runat="server" Text="清空"  class="btn btn82 btn_recycle" OnClick="Bt_clean_Click" Width="84px"/>  
                        </div>
                   </div>
            </div>
          
              <div class="auto-style3">
                  <asp:Button ID="Button1" runat="server" Font-Size="Large" OnClick="Button1_Click" Text="人员考勤" BackColor="#F3F6F8" Font-Bold="True"  />

              </div>
              <div class="box_center pt10 pb10" runat="server" id="div2" style="display:none" >

                  <asp:GridView ID="GridView2" runat="server" AllowSorting="true" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"  BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" Width="1018px">
                      <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" Font-Size="X-Large" />
             <RowStyle  Height="45px" Width="116"  HorizontalAlign="Center" ForeColor="#000066" Font-Size="Larger"/>
                     
                     <FooterStyle BackColor="White" ForeColor="#000066" />
                     
             <HeaderStyle Height="40px" HorizontalAlign="Center" BackColor="#F3F6F8" Font-Bold="True" BorderColor="#CCCCCC" ForeColor="Black" Font-Size="Medium"/>
                      <Columns>
                          <asp:BoundField DataField="Net" HeaderText="佩戴节点" SortExpression="Net" />
                          <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                          <asp:BoundField DataField="Gongzhong" HeaderText="工种" SortExpression="Gongzhong" />
                          <asp:BoundField DataField="Date" HeaderText="日期" SortExpression="Date" />
                          <asp:BoundField DataField="Intime" HeaderText="进入时间" SortExpression="Intime" />
                          <asp:BoundField DataField="Outtime" HeaderText="离开时间" SortExpression="Outtime" />
                          
                      </Columns>
                      <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#007DBB" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#00547E" />
                  </asp:GridView>
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ContikiConnectionString5 %>" SelectCommand="SELECT * FROM [View_1]"></asp:SqlDataSource>

              </div>
              
              </div>
        </div>
        <div class="box">
          <div class="box_border">
            <div class="auto-style3"> 
                <asp:Button ID="Button2" runat="server"  OnClick="Bt_browse_Click" Text="员工信息概览"  Font-Size="Large" Width="112px" BackColor="#F3F6F8" Font-Bold="True"  />
                 </div>
            <div class="box_center pt10 pb10" runat="server" id="div3"  >
                <div class="search_bar_btn" style="text-align:left;">
                    <div id="button" class="mt10" >
                <asp:GridView ID="GridView1" runat="server" AllowSorting="true"  AutoGenerateColumns ="False" DataSourceID="SqlDataSource1" HorizontalAlign="Left" Width="1018px" UseAccessibleHeader="False" class ="auto-style3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" >
                     <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
             <RowStyle  Height="45px" Width="116"  HorizontalAlign="Center" ForeColor="#000066"/>
                     
                     <FooterStyle BackColor="White" ForeColor="#000066" />
                     
             <HeaderStyle Height="40px" HorizontalAlign="Center" BackColor="#F3F6F8" Font-Bold="True" ForeColor="Black"/> 
             <Columns>
                 <asp:BoundField DataField="Node" HeaderText="佩戴节点" SortExpression="Node" />
                 <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                 <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex" />
                 <asp:BoundField DataField="Age" HeaderText="年龄" SortExpression="Age" />
                 <asp:BoundField DataField="Gongzhong" HeaderText="工种" SortExpression="Gongzhong" />
                 <asp:BoundField DataField="Phone" HeaderText="电话" SortExpression="Phone" />
                 <asp:BoundField DataField="Address" HeaderText="籍贯" SortExpression="Address" />
                 <asp:BoundField DataField="IdCard" HeaderText="身份证号" SortExpression="IdCard" />
             </Columns>
                     <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                     <SortedAscendingHeaderStyle BackColor="#007DBB" />
                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                     <SortedDescendingHeaderStyle BackColor="#00547E" />
         </asp:GridView>
                        
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
   