<%@ page language="C#" autoeventwireup="true" inherits="manage_Site_SiteColudSetup, App_Web_1zxlesnb" masterpagefile="~/manage/Site/SiteMaster.master" title="快云安装" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<script type="text/javascript" src="../../JS/jquery.js"></script>
<style type="text/css">
        #site_nav .site04 a{ background:url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat  }
</style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site">
        <p><a href="Default.aspx">站群中心</a> >> 配置管理 >> 快云安装 </p>
    </div>
<div id="site_main" class="cswsDiv">
<ul>
    <li>
        <strong>文件来源：</strong><asp:TextBox runat="server" ID="codeSource" CssClass="site_input" style="width:315px;"></asp:TextBox><asp:Button runat="server" Text="恢复为原始地址" OnClick="ResetUrl_Click" CssClass="site_button"/>
    </li>
     <li>
        <strong>存放地址：</strong><asp:TextBox runat="server" ID="zipSavePath" CssClass="site_input" style="width:315px;" />
    </li>
    <li>
        <strong>服务器IP：</strong><asp:Label runat="server" ID="serverIP"></asp:Label>
    </li>
    <li style="display:none;"><!--暂不使用-->
        <strong>目标站点：</strong><asp:DropDownList runat="server" ID="siteDP" AutoPostBack="true" OnSelectedIndexChanged="siteDP_SelectedIndexChanged"></asp:DropDownList>
    </li>
    <li  style="display:none;">
        <strong>绑定信息：</strong>
        <label runat="server" id="sitePort" style='position: relative; bottom: 5px;'>请选择站点</label>
        <label runat="server" id="domain" style='position: relative; bottom: 5px; margin-left: 8px;'></label>
    </li>
    <li>
        <strong>安装路径：</strong><asp:TextBox runat="server" ID="setupPath" CssClass="site_input" style="width:315px;"></asp:TextBox>例:\为安装在网站根目录
        <asp:RegularExpressionValidator runat="server" ID="spValid" ControlToValidate="setupPath" ValidationExpression="^\\[\w\W]*"
             ErrorMessage="格式不正确,必须以\开头" Display="Dynamic"/>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="setupPath" ErrorMessage="安装路径不能为空，推荐为/" Display="Dynamic" />
    </li>
    <li>
        <strong>替代地址：</strong><asp:TextBox runat="server" ID="alterAddress" CssClass="site_input" style="width:315px;"></asp:TextBox>
    </li>
    <li><strong>二级密码：</strong><input type="checkbox" name="twoPassWD" checked="checked" style="margin-left:2px;"/></li>
    <li><strong>管理操作：</strong>
        <asp:Button runat="server" ID="saveBtn" Text="保存" CssClass="site_button" OnClick="saveBtn_Click"/>
        <input type="button" value="返回站点列表" onclick="location = 'Default.aspx'" class="site_button" />
    </li>
</ul>
</div><!--Main End-->
</asp:Content>
