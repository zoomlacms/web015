<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.SearchList, App_Web_pczhw63k" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<head id="Head1" runat="server">
<title>搜索结果</title>
<link href="../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="<%Call.Label("{$CssDir/}"); %>global.css" rel="stylesheet" type="text/css" />
<%Call.Label("{ZL:HTML5()/} "); %>
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
#s_title,#s_top,#s_main,.mainbox_li{margin:auto; width:1000px; clear:both;}/*全局外框*/
.topbox,nav,footer{display:block;}
#s_main_l{padding-bottom:16px;}
#s_title{ margin-top:10px; font-family:"宋体";height:33px; line-height:30px;background:url(<%Call.Label("{$CssDir/}"); %>images/topbg.jpg)  bottom repeat-x; color:#555; border-top:1px solid #ccc;border-left:1px solid #ccc;border-right:1px solid #ccc;}
#s_title a{ color:#555;}
#s_title a:hover{ color:#A2162C;}
#search{ margin-right:0px; width:290px;}
nav li a{ font-family:"微软雅黑"; color:#5E3080;}
#s_main_l li{ line-height:22px; border-bottom:1px dashed #ccc;}
#s_main_l li strong a{ text-decoration:none}
</style>
</head>
<body id="Body1" runat="server">
<%Call.Label("{ZL.Label id=\"全站头部\" /}"); %>
<form runat="server" id="myform">
<div id="s_nav" style="display:none"><a href="../">网站首页</a><a href="/guest/">留言咨询</a></div>
<div id="s_top" runat="server" style="display:none">
<a href="<%Call.Label("{$SiteURL/}"); %>" target="_blank"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
<div id="Div1" runat="server" style="float: left; width: 500px; margin-top: 40px;">
站内搜索
<asp:DropDownList ID="DDLNode" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLNode_SelectedIndexChanged">
</asp:DropDownList>
<asp:TextBox ID="TxtKeyword" runat="server" Text="请输入关键字"></asp:TextBox>
<asp:Button ID="Button1" runat="server" Text="搜  索" OnClick="Button1_Click" />
</div>
</div>

<div id="s_title">
<%--<span>一共为您找到标题为[<%=GetKeyWord() %>]关键词的信息共<%=GetCommModelCount() %>篇</span> --%>
<%--<span>一共为您找到标题为<label runat="server" id="lbr"></label>的信息<%=GetCommModelCount() %>篇</span> --%>
<span>一共为您找到标题为<%=getkeys() %>的信息<%=GetCommModelCount() %>篇</span> 
您的位置：<a href="/"><asp:Literal ID="sitename" runat="server"></asp:Literal></a>>><a  href="../../Search/indexsearch.aspx">信息搜索</a>
</div>

<div id="s_main">
<div id="s_main_l" style="min-height:500px; width:100%;">
<ul>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<li><strong> <a href="<%# GetUrl(Eval("GeneralID","{0}")) %>" style=" font-size:18px;" target="_blank" alt="<%#toRed(Eval("Title").ToString()) %>"><%#toRed(Eval("Title").ToString()) %></a></strong>
<%--<p><%#Eval("TagKey") %></p>--%>
<p><%#toRed(Eval("TagKey").ToString())%></p>
<span>发表时间：<%#Eval("CreateTime") %>
<a href="<%# GetUrl(Eval("GeneralID","{0}")) %>" target="_blank">访问详情>></a></span>
</li>
</ItemTemplate>
</asp:Repeater>
<div style="clear:both"></div>
</ul>

<div id="PShow" runat="server" visible="false">
<pre><%--<span style="color:Blue"><%=key%></span>--%>
抱歉，没有找到与<%=getkeys() %>相关的内容，
搜索建议您： 看看输入的文字是否有误! 
去掉可能不必要的字词:如"的","什么"等
</pre>
</div>
<div id="nonemsg" runat="server" visible="false" style=" text-align:center">
<h3>没有输入查询关键字</h3>
</div>
<div style="clear:both"></div>
</div>

<div id="s_main_r" style="display:none">
<span>按栏目搜索:</span>

<script language="javascript">
function searchList(nodeid) {
var keyWord = document.getElementsByName("TxtKeyword").item(0).value;
if (keyWord == "请输入关键字") {
keyWord = "";
}
parent.location = "SearchList.aspx?node=" + nodeid + "&keyWord=" + keyWord;
}
</script>

<asp:Repeater ID="nodeList" runat="server">
<ItemTemplate>
<ul>
<li><a href="javascript:searchList(<%#Eval("nodeid") %>)">
<%#Eval("NodeName") %>
</a></li>
</ul>
</ItemTemplate>
</asp:Repeater>
</div>
<div class="cleardiv"></div>
</div>


<div id="Pager1" runat="server"></div>

<div id="s_bottom" style="display:none">
站内搜索
<asp:DropDownList ID="DDLNode1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLNode1_SelectedIndexChanged">
</asp:DropDownList>
<input id="keyWord" name="keyWord" runat="server" onclick="setEmpty(this)" onblur="settxt(this)"
value="请输入关键字" />
<asp:Button ID="btnSearch" runat="server" Text="搜  索" OnClick="btnSearch_Click" />
</div>

 
</form>
<%Call.Label("{ZL.Label id=\"全站底部\" /}"); %>

</body>
</html>