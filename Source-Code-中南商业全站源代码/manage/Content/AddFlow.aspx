﻿<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.AddFlow, App_Web_uouh3twy" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>添加审核状态</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
</head>
<body>
<form id="myform" runat="server">
<div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('62')" title="帮助"></a></div>
  <%} %>后台管理&gt;&gt;系统设置&gt;&gt;流程管理 &gt;&gt;<a href="SpecialManage.aspx">添加审核状态</a></div>
<div>
<table style="text-align:center; width:100%">
	<thead class="spacingtitle">
		<tr>
			<td colspan="2" align="center" >
				添加流程
			</td>
		</tr>
	</thead>
	<tbody class="tdbg">
		<tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td style="width:20%">
				流程名称
			</td>
			<td align="left">
				<input id="txtName" runat="server"  class="l_input" size="50" /><label style="color:Red">*</label>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="流程名称不能为空" ControlToValidate="txtName" ></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td style="width:20%">
				流程描述
			</td>
			<td  align="left">
				<textarea id="txtFlowDepict" class="l_input"   runat="server" cols="8" style="width:360px; height: 79px;"></textarea>
			</td>
		</tr>
		<tr><td colspan="2" align="center">
		<asp:Button ID="btnSave" runat="server"  Text="保存状态码" class="C_input"  style="width:100px;"  onclick="btnSave_Click"  /></td></tr>
	</tbody>
</table>
</div>
</form>
</body>
</html>