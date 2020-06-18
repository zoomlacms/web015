<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.indexSearch, App_Web_pczhw63k" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html runat="server">
<head id="Head1">
<title>搜索结果</title>
<link href="../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function setEmpty(obj) {
if (obj.value == "请输入关键字") {
obj.value = "";
}
}
function settxt(obj) {
if (obj.value == "") {
obj.value = "请输入关键字";
}
}
</script>
<style>
#TxtKeyword{float:left; border:1px solid #ccc; height:18px; line-height:18px;color:#C8C7C7;}
#btnSearch{ float:left; width:40px; height:22px;  color:#fff; border:none; background:#d4d4d4; cursor:pointer; border:none;}
</style>
</head>
<body runat="server">
<form runat="server" Aid="myform">
<div id="Div1" runat="server" style="float: left; ">
<span style="display:none">
<asp:DropDownList ID="DDLNode" runat="server" Width="100px">
</asp:DropDownList></span>
<asp:TextBox ID="TxtKeyword" runat="server" width="100px" onclick="setEmpty(this)" onblur="settxt(this)"
Text="请输入关键字"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="搜索" Width="40px" OnClick="btnSearch_Click" />
</div>
</form>
</body>
</html>