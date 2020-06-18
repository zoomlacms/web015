<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.PostCoin, App_Web_vvupmocy" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>赠送银币</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link  rel="stylesheet" type="text/css" href="../../App_Themes/UserThem/bidding.css" />
</head>
<body>
    <form id="form1" runat="server">
    
<div class="us_topinfo">
您现在的位置：<a title="网站首页" href="#" target="_parent"><asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a>&gt;&gt; <a title="会员中心" href='<%=ResolveUrl("~/User/Default.aspx" )%>' target="_parent">会员中心</a> &gt;&gt; <a href="UserInfo.aspx">账户管理</a>&gt;&gt;赠送银币
</div>
    <div id="manageinfo" class="us_seta" style="margin-top:10px;">
    <h1 style="text-align:center">赠送银币</h1>
    <table style="width: 100%; margin: 0 auto;line-height:30px" cellpadding="0" cellspacing="0" class="border">  
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 20%" align="right"> 会员银币：</td>
  <asp:HiddenField ID="rblExp" runat="server" Value="3" />
      <td ><asp:Label ID="lblCoin" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 20%" align="right"> 赠送会员 ：</td>
      <td><asp:TextBox ID="UserName2" runat="server" Value="" ></asp:TextBox> </td>
    </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 20%" align="right"> 赠送会员邮箱 ：</td>
      <td ><asp:TextBox ID="UserEmail" runat="server" Value="" ></asp:TextBox> <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="UserEmail" Display="Dynamic" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">邮箱格式不正确</asp:RegularExpressionValidator> </td>
    </tr> 
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 20%" align="right"> 银币：</td>
        <td>
        <asp:TextBox ID="TxtScore" class="input1" runat="server" Text=""></asp:TextBox>
        <asp:RegularExpressionValidator runat="server" ID="Rev_1" ValidationExpression="^[1-9]\d*|0$" ControlToValidate="TxtScore" ErrorMessage="只能输入非0整数"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 20%" align="right"> 备注：</td>
      <td ><asp:TextBox ID="TxtDetail" runat="server" Rows="10" TextMode="MultiLine"  Width="200" class="l_input" Height="60px"></asp:TextBox></td>
    </tr>
    <tr class="tdbgbottom">
      <td colspan="2" align="center"><asp:HiddenField ID="Hdn_t" runat="server" />
        <asp:HiddenField ID="HdnUserID" runat="server" />
        <asp:Button ID="EBtnSubmit" Text="执 行" OnClick="EBtnSubmit_Click" runat="server" class="i_bottom"  />
        <asp:Button ID="Button1" Text="取 消" runat="server"  CausesValidation="false" onclick="Button1_Click" class="i_bottom"  /></td>
    </tr>
  </table>
  </div>
    </form>
</body>
</html>
