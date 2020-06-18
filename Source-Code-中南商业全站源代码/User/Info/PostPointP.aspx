<%@ page language="C#" autoeventwireup="true" inherits="User_Info_PostPointP, App_Web_vvupmocy" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>佣金赠送积分</title>
 <link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link  rel="stylesheet" type="text/css" href="../../App_Themes/UserThem/bidding.css" />
</head>
<body>
    <form id="form1" runat="server">
<div class="us_topinfo">
您现在的位置：<a title="网站首页" href="#" target="_parent"><asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a>&gt;&gt; <a title="会员中心" href='<%=ResolveUrl("~/User/Default.aspx" )%>' target="_parent">会员中心</a> &gt;&gt; <a href="UserInfo.aspx">账户管理</a>&gt;&gt;<a href="PostPoint.aspx">积分赠送</a>&gt;&gt;佣金赠送积分
</div>
    <div id="manageinfo" class="us_seta" style="margin-top:10px;">
    <h1 style="text-align:center">赠送积分</h1>
    <table style="width: 100%; margin: 0 auto;line-height:30px" cellpadding="0" cellspacing="0" class="border">  
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 20%" align="right"> 会员余额：</td>
  <asp:HiddenField ID="rblExp" runat="server" Value="3" />
      <td ><asp:Label ID="lblCoin" runat="server" Text=""></asp:Label></td>
    </tr>
     <tr>
            <td align="right">赠送会员：</td>
            <td>
            <asp:TextBox ID="UserName2" AutoPostBack="True" ontextchanged="TextBox2_TextChanged" CssClass="input_out" runat="server" onfocus="this.className='input_on';this.onmouseout=''" onblur="CheckUser();this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" Style="float: left; " width="140"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserName2" ErrorMessage="请输入用户名" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">赠送姓名：</td>
            <td>
                <asp:TextBox ID="TrueName" CssClass="input_out" runat="server" onfocus="this.className='input_on';this.onmouseout=''" onblur="CheckUser();this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" Style="float: left; " width="140"></asp:TextBox>
            </td>
        </tr>
      
      <tr>
            <td align="right">赠送积分数：</td>
            <td><asp:TextBox ID="TxtScore" CssClass="input_out" runat="server"  onfocus="this.className='input_on';this.onmouseout=''"  onblur="CheckUser();this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" Style="float: left; " width="100" AutoPostBack="True" ontextchanged="TextBox4_TextChanged" ></asp:TextBox>
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ControlToValidate="TxtScore" ErrorMessage="积分赠送只能是数字" ValidationExpression="^\+?[1-9][0-9]*$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtScore" ErrorMessage="请输入赠送积分数" SetFocusOnError="True"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td align="right">应付佣金：</td>
            <td><asp:TextBox ID="Txtpurse" CssClass="input_out" runat="server" onfocus="this.className='input_on';this.onmouseout=''" onblur="CheckUser();this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" Style="float: left; " width="100" ReadOnly="True"></asp:TextBox></td>
        </tr>
    
     
     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 20%" align="right"> 支付密码 ：</td>
      <td>  <asp:TextBox ID="Second" runat="server" Value=""  TextMode="Password"></asp:TextBox> </td>
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
