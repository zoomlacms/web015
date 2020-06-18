<%@ page language="C#" autoeventwireup="true" inherits="MIS_Mis, App_Web_kgyeb_n0" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>企业面版</title>
<link href="/App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js"></script> 
<script type="text/javascript">
function loadPage(id, url) {
    $("#" + id).addClass("loader");
    $("#" + id).append("Loading......");
    $.ajax({
        type: "get",
        url: url,
        cache: false,
        error: function () { alert('加载页面' + url + '时出错！'); },
        success: function (msg) {
            $("#" + id).empty().append(msg);
            $("#" + id).removeClass("loader");
        }
    });
}

function show2() {
    var divs = document.getElementById("DateDiv");
    var Digital = new Date();
    var year = Digital.getFullYear();
    var months = Digital.getMonth() + 1;
    var Days = Digital.getDate();
    var hours = Digital.getHours();
    var minutes = Digital.getMinutes();
    var seconds = Digital.getSeconds();
    var dn = "AM"
    if (hours >= 12) {
        dn = "PM";
        hours = hours - 12;
    }
    if (hours == 0)
        hours = 12;
    if (minutes <= 9)
        minutes = "0" + minutes;
    if (seconds <= 9)
        seconds = "0" + seconds;
    var ctime = year + "年" + months + "月" + Days + "日 " + hours + ":" + minutes + ":" + seconds + " " + dn;
    divs.innerHTML = ctime;
    setTimeout("show2()", 1000);
}

//隐藏DIV
function HideDiv(div_id) {
    $("#" + div_id).animate({ opacity: "hide" }, 300);
}

function ShowDiv(div_id) {
    var div_obj = $("#" + div_id);
    div_obj.animate({opacity: "show", left: 300, top: 660, width: div_obj.width, height: div_obj.height }, 300);
}
setTimeout("ShowDiv('TimeDiv')", 3000);

window.onload = function () {
    loadPage("M_toper", "/Mis/header.aspx");
    show2();
}

</script>
</head>
<body>
<form id="form1" runat="server">
<div id="M_toper"> </div>
<div id="height"></div>

<div id="Meno">
<div id="M_left"> 
    <div class="User_Info">
<div class="User_Name">
<asp:Image ID="imgUserPic" runat="server" Width="55" Height="55" />
<asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label><br />
<a href="javascript:void(0)" onclick="loadPage('Meno', '/User/Info/UserBase.aspx')" >个性设置</a>
<div class="clear"></div>
</div>
<div class="login_li">
<ul>
<li> 今天是：<%Call.Label("{ZL:DateAndTime()/}"); %></li>
<li>上次登录：<asp:Label ID="LoginTime" runat="server" Text="Label"></asp:Label> </li></ul></div>
</div>
<div class="MyMis"><span><a href="#">更多</a></span>我的关注
</div>
</div> 
<div class="wid"></div>
<div id="M_center">
<div class="M_tit"><strong>企业看板</strong></div> 
<div class="M_title"><span><a href="#">更多</a></span>目标</div>
<div class="Meno_list">
<ul>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<li>
<a href="#"><%#Eval("Title") %></a> -  创建于  <%#Eval("CreateTime") %>
<p><%#Eval("Content") %> </p>
</li>
    </ItemTemplate>
</asp:Repeater>
</ul>
</div>
<div class="M_title"><span><a href="#">更多</a></span>系统提醒</div>
<div class="Meno_list">
    <ul><li></li></ul>
    </div>
<div class="M_title"><span><a href="#">更多</a></span>工作历程</div>
<div class="Meno_list">
    <ul><li></li></ul>
    </div>
<div class="M_title"><span><a href="#">更多</a></span>延期的任务</div>
<div class="Meno_list">
    <ul><li></li></ul>
    </div>
<div class="M_title"><span><a href="#">更多</a></span>重要且紧急</div>
<div class="Meno_list">
    <ul><li></li></ul>
    </div>
</div> 
<div id="M_right">
    <div class="M_File">
<div class="M_title"><span><a href="#">更多</a></span>公告栏</div>
        <ul>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
        </ul>
</div>
    <div class="M_File">
<div class="M_title"><span><a href="#">更多</a></span>最新帖子</div>
        <ul>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
        </ul>
</div>
    <div class="M_File">
<div class="M_title"><span><a href="#">更多</a></span>系统文档</div>
        <ul>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
        </ul>
</div>
    <div class="M_File">
<div class="M_title"><span><a href="#">更多</a></span>最近邮件</div>
        <ul>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
            <li><a href="#">今目标 企业社区 2.2 发布</a></li>
        </ul>
</div>
</div>

<div id="TimeDiv" class="pop_box" style=" height:200px; margin-left:298px; margin-top:-30px;">
<div id="TimeHead" style="text-align:right; font-size:14px;" class="p_head">
<div class="p_h_title" style=" text-align:left;">打卡提示</div>
<div class="p_h_close" onclick="HideDiv('TimeDiv')">关闭</div>
</div>
<div id="TimeInfo">
<div id="DateDiv" style="font-size:20px; color:#278139;font-weight:bold;text-align:left;"></div>
    <div><a href="MisAttendance.aspx">进入考勤页面</a></div>
<div id="warnContent" style="height:100px; margin-top:30px; padding-left:40px;">
<div style="float:left; margin-right:20px; height:40px;">上班：<asp:Label ID="lblBegin" runat="server"></asp:Label><asp:Button ID="BtnBegin" Text="签到" OnClick="BtnBegin_Click" CssClass="i_bottom" runat="server" /></div>
<div style="float:left; height:40px;">下班：<asp:Label ID="lblEnd" runat="server"></asp:Label> <asp:Button ID="BtnEnd" Text="签退" OnClick="BtnEnd_Click" CssClass="i_bottom" runat="server" /></div>
</div>
</div>
</div>

<div class="clear"></div>
</div>

</form>
</body>
</html>
