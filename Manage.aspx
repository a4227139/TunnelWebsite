<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/common.css">
  <link rel="stylesheet" href="css/style.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
<style type="text/css">
 #menu li a{
color: #fff;
}
#menu li a:link{
color: #fff;
}
#menu li a:visited{
 color: #fff;
 }
#menu li a:hover {
   color:#000;
}
</style>
  <script type="text/javascript">
      $(function () {
          $(".sideMenu").slide({
              titCell: "h3",
              targetCell: "ul",
              defaultIndex: 1,
              effect: 'slideDown',
              delayTime: '500',
              trigger: 'click',
              triggerTime: '150',
              defaultPlay: true,
              returnDefault: false,
              easing: 'easeInQuint',
              endFun: function () {
                  scrollWW();
              }
          });
          $(window).resize(function () {
              scrollWW();
          });
      });
      function scrollWW() {
          if ($(".side").height() < $(".sideMenu").height()) {
              $(".scroll").show();
              var pos = $(".sideMenu ul:visible").position().top - 38;
              $('.sideMenu').animate({ top: -pos });
          } else {
              $(".scroll").hide();
              $('.sideMenu').animate({ top: 0 });
              n = 1;
          }
      }

      var n = 1;
      function menuScroll(num) {
          var Scroll = $('.sideMenu');
          var ScrollP = $('.sideMenu').position();
          /*alert(n);
          alert(ScrollP.top);*/
          if (num == 1) {
              Scroll.animate({ top: ScrollP.top - 38 });
              n = n + 1;
          } else {
              if (ScrollP.top > -38 && ScrollP.top != 0) { ScrollP.top = -38; }
              if (ScrollP.top < 0) {
                  Scroll.animate({ top: 38 + ScrollP.top });
              } else {
                  n = 1;
              }
              if (n > 1) {
                  n = n - 1;
              }
          }
      }
  </script>
  <title>员工管理</title>
</head>
<body>
    <div class="top">
      <div id="top_t">
        <div id="logo" class="fl"></div>
        <div id="photo_info" class="fr">
          <div id="photo" class="fl">
            <a href="#"><img src="images/a.png" alt=""></a>
          </div>          
        </div>
      </div>
      <div id="side_here">
        <div id="side_here_l" class="fl"></div>
        <div id="here_area" class="path"> 您现在的位置:员工管理>>员工信息
</div>
      </div>
    </div>
   <div class="side">
        <div class="sideMenu" style="margin:0 auto">
         <h3>人员定位</h3>
            <ul id="menu">            
            <li class="on"><a href="Position.aspx">查看当前定位</a></li>  
            <li class="on"><a href="past.aspx">查看历史定位</a></li>                      
          </ul>
          <h3>员工管理</h3>
          <ul id="menu">            
            <li class="on"><a href="Manage.aspx">员工信息</a></li>
            <li class="on"><a href="Manage2.aspx">人员考勤</a></li>
            <li class="on"><a href="Manage3.aspx">员工信息概览</a></li>           
          </ul>
          <h3>设备管理</h3>
          <ul id="menu">
            <li class="on"><a href="Device.aspx">设备信息</a></li>
            <li class="on"><a href="Device2.aspx">浏览所有设备信息</a></li>                 
          </ul>
          <h3> 退出</h3>
          <ul id="menu">
            <li class="on"><a href="Login.aspx">退出</a></li>               
          </ul>
       </div>
    </div>
    <div class="main">
       <iframe name="right" id="rightMain" src="manager.aspx" frameborder="no" scrolling="auto" width="100%" height="auto" allowtransparency="true"></iframe>
    </div>
    <div class="bottom">
      <div id="bottom_bg"> Copyright 创新项目, All Rights Reserved</div>
    </div>
    <div class="scroll">
          <a href="javascript:;" class="per" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(1);"></a>
          <a href="javascript:;" class="next" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(2);"></a>
    </div>
</body>

</html>
