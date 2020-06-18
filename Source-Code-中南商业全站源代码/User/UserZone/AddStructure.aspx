<%@ page language="C#" autoeventwireup="true" inherits="User_UserZone_AddStructure, App_Web_vuwjm7de" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>创建企业结构</title>
<link href="../../App_Themes/UserThem/bidding.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="us_topinfo" style="width:98%">
        <div class="us_pynews">
        您现在的位置：<span id="YourPosition"> <a title="网站首页" href="/" target="_blank">
            <asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label>
            </a> &gt;&gt;  <a title="会员中心" href='<%=ResolveUrl("~/User/Default.aspx" )%>' target="_parent"> 会员中心</a>  &gt;&gt;  <a href="Structure.aspx">企业结构</a> &gt;&gt; 创建组织结构</span>
        </div>
    </div> 
    <div class="clearbox"></div>
            <div class="us_seta"  style="margin-top:5px;">
    <h1 align="center"><asp:Label ID="lblText" runat="server">创建组织结构</asp:Label></h1>

    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;line-height:28px;">
        <tbody id="Tabs0">
            
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td style="width: 288px" align="right"><strong>结构名：</strong></td>
                <td>
                    <asp:TextBox ID="TxtProjectName" class="l_input" runat="server" />
                    <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label>
                </td>
            </tr>   
             
            
        </table>
        <div class="clearbox"></div>
        <div style=" text-align:center; width:800px; margin-top:10px;"><asp:Button ID="BtnCommit" runat="server" Text="提交"  class="i_bottom" onclick="Button1_Click"/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Btn" runat="server" Text="返回" class="i_bottom" onclick="Button2_Click" />
        </div>
                <div class="clear"></div>
          </div>
    </form>
</body>
</html>
