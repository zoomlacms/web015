<%@ page language="C#" autoeventwireup="true" inherits="Plugins_login, App_Web_iwky-wjl" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>登录问卷调查系统</title>
<link href="../App_Themes/UserThem/Survey.css" rel="stylesheet" type="text/css" />
</head>
<body class="Survey_bg">
    <form id="form1" runat="server">
  <div id="Survey_main">
    <div class="Survey_tit"><%Call.Label("{$SiteName/}"); %></div>
        <div class="Survey_ban">
            <div class="Survey_banL"> <strong>登录问卷调查系统</strong></div>
            <div class="Survey_banR"></div>
           </div>
      <div class="Survey_m">
          <div class="Survey_ml">
              <div class="Sur_tit"><img src="../App_Themes/UserThem/images/Survey/icon-notice.gif" /><strong>使用说明</strong></div>
              <div class="Sur_t"><strong>系统使用说明</strong></div>
              <div class="Sur_con">
                  <p> 1、为保证您使用本系统的方便性，请使用微软IE或谷歌Chrome浏览器登录本系统。</p>
                  <p>2、本系统用于问卷调查管理和结果查询。</p>
                  <p>3、考生身份证号和密码将是用户在本系统申请和查询申请结果等信息的依据，请注意保密。</p>
                  <p>4、第一次使用本系统时，请先注册，同一身份证号只允许注册一次。</p>
                  <p>6、打印问卷时请使用A4纸打印。</p>
              </div>

          </div>
          <div class="Survey_mr">
              <div class="Survey_login">
                <table>
                    <tr><td colspan="2"><img src="../App_Themes/UserThem/images/Survey/icon-signin.gif" /><strong>用户登录</strong><a href="Register.aspx">新用户在此注册»</a></td></tr>
                    <tr><td class="lefts">用户类别:</td><td><asp:DropDownList runat="server" Width="200"><asp:ListItem Value="0">默认类别</asp:ListItem></asp:DropDownList></td></tr>
                      <tr><td  class="lefts">身份证号:</td><td><asp:TextBox Text="" runat="server"  ID="TxtCode" Width="200"></asp:TextBox></td></tr>
                    <tr><td  class="lefts">登录密码:</td><td><asp:TextBox Text="" runat="server"  ID="TxtPassWord" TextMode="Password" Width="200"></asp:TextBox></td></tr>
                    <tr><td  class="lefts">验 证 码:</td>
                        <td> <asp:TextBox ID="TxtValidateCode" MaxLength="6" runat="server" style="width:100px; float:left" CssClass="input_out"  onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" Text=""></asp:TextBox>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/ValidateCode.aspx"  ToolTip="点击刷新验证码" Style="cursor: pointer; margin-left:20px; border: 0; vertical-align: middle;" onclick="this.src='../Common/ValidateCode.aspx?t='+Math.random()" /></td></tr>
                    <tr><td><asp:Button  runat="server" ID="Button" OnClick="Button_Click" CssClass="l_bottom"/></td>
                        <td><a href="Register.aspx"><img src="../App_Themes/UserThem/images/Survey/register-index.gif" /></a></td></tr>
                    <tr><td colspan="2">
                        <p><strong>注意事项：</strong> </p>
                        <p>1. 本系统必须注册才能使用，注册时需要使用本人身份证号实名注册；</p>
                        <p>3. 在本系统中进行的一切操作均视为用户本人操作；</p>
                        <p>4. 如遇到问题请通过下方的联系方式及时与我们联系。</p>
                        </td></tr>
                </table>
               </div>
                <div class="Sur_tit" style="margin-top:10px;"><img src="../App_Themes/UserThem/images/Survey/icon-contact.gif" style="margin-top:4px;" /><strong>联系方式</strong></div>
              <div class="contact">
                  <p>地址：江西省南昌市</p>
                  <p>邮编：332300</p>
                  <p>技术支持电话：  0791-88888888</p>
                  <p>传真： 0791-88888888</p>
                  <p>技术支持邮箱：<a href="mail:to<%Call.Label("{$WebmasterEmail/}"); %>"> <%Call.Label("{$SiteName/}"); %></a></p>
              </div>
           </div>
       </div>
      <div class="clear"></div>
    <div id="CopyRight">
       <%Call.Label("{$Copyright/}"); %>
        </div>
    </div>
    </form>
</body>
</html>
