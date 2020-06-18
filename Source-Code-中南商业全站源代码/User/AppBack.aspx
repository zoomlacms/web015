﻿<%@ page language="C#" autoeventwireup="true" inherits="AppBack, App_Web_hhz41g8f" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>APP登录</title>
<script src="/JS/jquery.js" type="text/javascript"></script>
<link href="../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   
<script type="text/javascript">

   
    function GetInfo() {
        var obj = new Object();
        obj.InfoHid = $("#InfoHid").val();
        obj.Uid = $("#Uid");
        obj.birthday = $("#birthday");
        obj.marriage = $("#marriage");
        obj.blood = $("#blood");
        obj.sex = $("#sex");
        obj.Username = $("#Username");

        var data = obj.InfoHid;
        var json = eval('(' + data + ')');
        obj.Uid.val(json.userid);
        obj.Username.val(json.username);
        obj.birthday.val(json.birthday);
        obj.marriage.val(json.marriage);
        obj.blood.val(json.blood);
        obj.sex.val(json.sex);

    }
</script>
</head>
<body>
<div id="main" style="position:relative;">
    <form id="form1" runat="server">
        <script type="text/javascript">
            //给新浪页面传accessToken
            if (location.hash.slice(1) != "") {
                $.post("Sina.aspx", { actionUrl: location.hash.slice(1) }, function (data) { location.href = data; });
            }

    </script>       
        <input id="InfoHid" type="hidden" value="" runat="server" />
        <input id="Uid" type="hidden" value="" runat="server" />
        <input id="birthday" type="hidden" value="" runat="server" />
        <input id="marriage" type="hidden" value="" runat="server" />
        <input id="blood" type="hidden" value="" runat="server" />
        <input id="sex" type="hidden" value="" runat="server" />
    <div id="main_l">
<ul>
<li>
<h1>恭喜您从[<asp:Label ID="Apptype" ForeColor="Red" Text="" runat="server" />]登陆[<asp:Label ID="Sitename" ForeColor="Red" Text="" runat="server" />]</h1></li>  
<li><h1>
请[<asp:Label ID="nickName" ForeColor="Red" runat="server" Text=""></asp:Label>]在这里完成注册</h1></li>  
<li>用户名：　<asp:TextBox ID="Username"   style="width:140px; margin-left:20px; border:#CCC solid 1px;"  CssClass="input_out"  runat="server"></asp:TextBox>
</li>
<li>
密　码：　<asp:TextBox ID="pass" runat="server" style="width:140px; margin-left:20px ;border:#CCC solid 1px;"  CssClass="input_out"  
            TextMode="Password"></asp:TextBox></li>
            
<li>
确定密码：<asp:TextBox ID="cpass" runat="server"  style="width:140px; margin-left:20px; border:#CCC solid 1px;"  CssClass="input_out"  
            TextMode="Password"></asp:TextBox>
</li>
<li><asp:Button ID="Register" CssClass="i_bottom"  runat="server" Text="提交"  onclick="Register_Click"/></li>
</ul>
</div>

<div id="main_s" style="display:none">
<ul>
<li style="color:green; font-size:14px; font-weight:bold">欢迎您！登陆成功</li>
<li style="margin-top:25px;">系统将在 <span id="sec">3</span> 秒后自动跳转到<a href="Default.aspx">会员首页</a></li>
</ul>
</div>

</form>
<div id="main_r">
<h2>登陆会员中心您将获得：</h2>
<ul>
<li>自由发布信息</li>
<li>查看积分与管理空间</li>
<li>设定您的个性化空间</li>
<li>提交您的需求为您服务</li>
<li>购物支付多彩商务体验</li>
<li>专业的用户中心引领E时代！</li>
</ul>
</div><div class="clear"></div>
</div><!--main end -->

<div id="bottom">
<a href="/"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
</div>


</body>
</html>
