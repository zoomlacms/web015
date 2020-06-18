<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="ZoomLa.WebSite.User.Content.EditContent, App_Web_iwlfzaij" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>更新内容</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<script src="../../Common/Common.js" type="text/javascript"></script>
<script src="../../Common/RiQi.js" type="text/javascript"></script>
<script type="text/javascript" src="../../Plugins/Ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="../../Plugins/Ueditor/ueditor.config.js"></script>
<script src="/Plugins/Ckeditor/EditFile/sample.js" type="text/javascript"></script>
<link href="/Plugins/Ckeditor/EditFile/sample.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf-8" src="/Plugins/kindeditor/kindeditor.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="us_seta">
	<span><asp:Label ID="lblNodeName" runat="server" Text="Label"></asp:Label></span><span> &gt;&gt; </span><span>修改内容：<asp:Label ID="lblAddContent" runat="server" Text="Label"></asp:Label></span></div>
		  <ul class="us_seta" style="margin-top:10px;">
			  <h1 style="text-align:center"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h1>
              
              <li style="width:100%; line-height:30px; text-align:left;">
                <span style="margin-left:270px;">所属节点：<asp:Label ID="Label3" runat="server" Text="Label" /></span>
              </li>
             
              <li style="width:100%;line-height:30px; text-align:left;">
               <span style="margin-left:270px;"> 内容标题：<asp:TextBox ID="txtTitle" runat="server" Text='' Width="240" MaxLength="30" />
                <font color="red">*</font><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtTitle">内容标题必填</asp:RequiredFieldValidator></span>
              </li>
            
              	
            
               <li style="width:100%;">
                <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
              </li>
               <li style="width:70%; float:left;line-height:30px; text-align:right">
                 <asp:HiddenField ID="HdnItem" runat="server" />
                <asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" Style="display: none"></asp:TextBox>
                <asp:Button ID="EBtnSubmit" Text="更新项目" OnClick="EBtnSubmit_Click" runat="server" />
                &nbsp;                
                <asp:Button ID="BtnBack" runat="server" Text="返　回" OnClick="BtnBack_Click" UseSubmitBehavior="False"  CausesValidation="False" />
              </li>
              <li style="width:20%;line-height:30px">
              </li>
             </ul>
    </form>
</body>
</html>