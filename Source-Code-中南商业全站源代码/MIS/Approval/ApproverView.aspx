<%@ page language="C#" autoeventwireup="true" inherits="MIS_Approval_ApproverView, App_Web_qydqwwjb" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>审批详情</title>
<link href="/App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js"></script> 
<script src="/JS/MisView.js"></script>  
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
    loadPage("M_toper", "/Mis/header.aspx?hid=7");
 
</script>
</head>
<body>
    <div id="M_toper"></div>
    <div id="height"></div>
    <form id="form1" runat="server">
<div id="Meno">
    <div id="pro_left">
<div class="new_tar">
    <a href="AddApproval.aspx">新建申请单</a></div>
        <div class="pro_li">
        <ul><li><a href="Default.aspx?type=2">我的审批</a></li>
            <li><a href="Default.aspx?type=3">已归档</a></li>
            <li><a href="Default.aspx?type=8">抄送给我的</a></li>
            <li><a href="Default.aspx?type=7">审批设置</a></li>
        </ul>
          </div>
    </div>
    <div id="pro_right">
          <div class="Mis_Title">我的申请  >> 查看申请单 </div>
        <input type="hidden" id="txtPeson" runat="server" />
        <table class="ApproverTd" style="padding-left:10px; padding-top:10px;">
            <tr><td>审批结果：</td><td><asp:Label ID="TxtResults" runat="server" Text=""></asp:Label></td></tr>
            <tr><td>申请人：</td><td><asp:Label ID="TxtInputer" runat="server" Text=""></asp:Label></td></tr>
            <tr><td>申请部门：</td><td><asp:Label ID="Txtdepartment" runat="server" Text=""></asp:Label></td></tr>
            <tr><td>创建日期：</td><td><asp:Label ID="TxtTime" runat="server" Text=""></asp:Label></td></tr>
            <tr><td>申请流程：</td><td><asp:Label ID="TxtProcess" runat="server" Text=""></asp:Label></td></tr>
            <tr><td>申请内容：</td><td><asp:Label ID="TxtContent" runat="server" Text=""></asp:Label></td></tr>
            <tr><td>抄送：</td><td><asp:Label ID="TxtSend" runat="server" Text=""></asp:Label></td></tr> 
            <tr><td colspan="2"><asp:Button  runat="server" CssClass="i_bottom" Text="审批" OnClick="Button_Click" ID="ButtonID"/></td></tr>
        </table>
        <div style="text-align:center;"><asp:Button ID="Sends" Text="抄送" CssClass="i_bottom" OnClientClick="return PopupDiv2('div_share','lblChecked')" runat="server" />&nbsp;&nbsp;<asp:Button ID="btnReset" runat="server"  OnClick="btnReset_Click" CssClass="i_bottom" Text="取消"/></div>

<div id="div_share" class="pop_box">
<div class="p_head">
<div class="p_h_title">人员选择</div>
<div class="p_h_close" onclick="HideDiv('div_share')">关闭</div>
</div>
<iframe src="/Mis/SelUser.aspx?OpenerText=txtPeson" width="420" height="120" scrolling="no" frameborder="0"></iframe>
<div class="p_bottom">
<asp:Button ID="BtnSubPeson" CssClass="i_bottom" runat="server" Text="确定"  OnClick="BtnSubPeson_Click"/>
</div>
</div>
</div>
</div>
</form>
</body>
</html>
