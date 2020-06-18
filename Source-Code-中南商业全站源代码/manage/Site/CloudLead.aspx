<%@ page language="C#" autoeventwireup="true" inherits="manage_Site_CloudLead, App_Web_1zxlesnb" masterpagefile="~/manage/Site/SiteMaster.master" title="模板云台" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/JS/jquery.js"></script>
    <style type="text/css">
                #site_nav .site03 a {
            background: url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site"><p> 站群中心 >>  模板云台</p></div>
    <div id="mainDiv" style="text-align:center;">
        <iframe id="mainFrame" onload="frameInit(this);"  src="../Template/CloudLead.aspx" style="width:98%;" frameborder=0 scrolling=no></iframe>
    </div>
   <script type="text/javascript">
       function frameInit(obj) {//设定高度，并隐藏iframe中的面包屑导航
           obj.height = document.frames['mainFrame'].document.body.scrollHeight*0.95;
           $doc = document.frames['mainFrame'].document;
           $($doc).find(".r_navigation").hide();
       }
   </script>
</asp:Content>
