<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.indexSearch, App_Web_pczhw63k" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html runat="server">
<head id="Head1">
<title>搜索结果</title>
<link href="../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function setEmpty(obj) {
if (obj.value == "全站搜索") {
obj.value = "";
}
}
function settxt(obj) {
if (obj.value == "") {
obj.value = "全站搜索";
}
}
</script>
<style>
#TxtKeyword{float:left; padding-left:4px; border:1px solid #ccc; height:18px; line-height:18px; color:#333; width:92px;}
#btnSearch{ float:left; width:24px; height:22px;  color:#fff; border:none; background:url(../Template/Nantong/style/images/ss.jpg) left no-repeat; cursor:pointer; border:none;}
</style>
</head>
<body runat="server">
<form runat="server" Aid="myform">
<div id="Div1" runat="server" style="float: left; ">
<span style="display:none">
<asp:DropDownList ID="DDLNode" runat="server" Width="100px">
</asp:DropDownList></span>
<asp:TextBox ID="TxtKeyword" runat="server"  onclick="setEmpty(this)" onblur="settxt(this)"
Text="全站搜索"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="" Width="24px" OnClick="btnSearch_Click" />
</div>
</form>
</body>
</html>