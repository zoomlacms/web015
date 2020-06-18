<%@ page language="C#" autoeventwireup="true" inherits="manage_Site_AdminLogin, App_Web_1zxlesnb" masterpagefile="~/manage/Site/SiteMaster.master" title="全局配置" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
     #site_nav .site08 a{ background:url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat  }
        </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
<div id="m_site">
        <p><a href="Default.aspx">站群中心</a> >> 全局配置   </p>
    </div>
<div id="site_main">
     <span runat="server" id="remind" style="color:red;"></span>
         <div id="CSWSDiv" style="margin-top:20px;">
             <ul>
           <li> Windows管理员用户: <asp:TextBox runat="server" ID="adminName" CssClass="site_input"></asp:TextBox><br /><br /></li>
           <li> Windows管理员密码: <asp:TextBox runat="server" ID="adminPasswd" CssClass="site_input" TextMode="Password"></asp:TextBox></li>
           <li style="margin-top:5px;"><asp:Button runat="server" ID="Btn1" Text="登录" OnClick="Btn1_Click" CssClass="site_button" style="margin-left:150px;"/>
                <asp:Button runat="server" ID="Btn2" Text="清除"  OnClick="Btn2_Click" CssClass="site_button" style="margin-left:30px;" ToolTip="清除已存储的密码"/></li>
             </ul>
        </div>
    </div>
</asp:Content>