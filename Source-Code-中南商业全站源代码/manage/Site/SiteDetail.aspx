<%@ page language="C#" autoeventwireup="true" inherits="manage_Site_SiteDetail, App_Web_1zxlesnb" masterpagefile="~/manage/Site/SiteMaster.master" title="站点详情" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head" >
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/Guide.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/index.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/main.css" />
<script type="text/javascript" src="../../JS/Common.js"></script>  
<script src="../../JS/jquery-1.9.1.min.js"></script>
<script src="/manage/Charts/Js/highcharts.js" type="text/javascript"></script>
<script src="/manage/Charts/Js/exporting.js" type="text/javascript" charset="gb2312"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>站点详情</title>
    <style>
        #site_nav .site01 a {
            background: url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site">
        <p><a href="Default.aspx">站群中心</a> >> 配置管理 >> 网站详情 <a href="SiteFileManage.aspx?siteName=<%=Server.UrlEncode(siteName)+"&index=0" %>" title="" style="color:red;">[浏览文件]</a> </p>
    </div>
    <div id="site_main">
        <div id="CSWSDiv" class="cswsDiv border" style="width:25%;display:none;">
        <table>
           <tr><td>站点名称：</td><td><asp:TextBox runat="server" ID="Name" MaxLength="20" CssClass="site_input" style="width:315px;" /></td></tr>
           <tr><td>管 理 员：</td><td><asp:DropDownList runat="server" ID="manageDL"></asp:DropDownList></td></tr>
           <tr><td>操作系统：</td><td><asp:Label runat="server" ID="opSystem"></asp:Label></td></tr>
           <tr><td>IIS 版本：</td><td><asp:Label runat="server" ID="iisVersion"></asp:Label></td></tr>
           <tr><td>Net 版本：</td><td>
               <asp:DropDownList runat="server" ID="netVersion">
                   <asp:ListItem Value="v2.0">v2.0</asp:ListItem>
                   <asp:ListItem Value="v4.0">v4.0</asp:ListItem>
               </asp:DropDownList>
               </td></tr>
            <tr><td>运行模式：</td><td>
                    <asp:DropDownList runat="server" ID="runMode">
                        <asp:ListItem Value="Integrated">集成模式</asp:ListItem>
                        <asp:ListItem Value="Classic">经典模式</asp:ListItem>
                    </asp:DropDownList></td></tr>
           <tr><td>I P 地址：</td><td><asp:Label runat="server" ID="serverIP"></asp:Label></td></tr>
           <tr><td>站点状态：</td><td><asp:Label runat="server" ID="siteState"></asp:Label>
                   <asp:Button runat="server" ID="ssBtn1" OnClick="SSSite_Click" Text="启动" CssClass="site_button" style="margin-left:10px;"/></td></tr>
           <asp:Literal runat="server" ID="literalPath"></asp:Literal>
           <asp:Literal runat="server" ID="literalBind"></asp:Literal><!--协议，端口，域名-->
           <tr><td>错误页(禁止访问)：</td><td><asp:TextBox runat="server" ID="errorPage1" MaxLength="40" CssClass="site_input" Text="无法读取配置文件" style="width:315px;"></asp:TextBox></td></tr>
           <tr><td>错误页(未 找 到)：</td><td><asp:TextBox runat="server" ID="errorPage2" MaxLength="40" CssClass="site_input" Text="无法读取配置文件" style="width:315px;"></asp:TextBox></td></tr>
           <tr><td>错误页(内部错误)：</td><td><asp:TextBox runat="server" ID="errorPage3" MaxLength="40" CssClass="site_input" Text="无法读取配置文件" style="width:315px;"></asp:TextBox></td></tr>
           <tr><td>错误页(服务不可用)：</td><td><asp:TextBox runat="server" ID="errorPage4" MaxLength="40" CssClass="site_input" Text="无法读取配置文件" style="width:315px;"></asp:TextBox></td></tr>
           <tr><td>应用程序池：</td><td><asp:Label runat="server" ID="siteAppPool"></asp:Label> </td></tr>
           <tr><td>操    作：</td>
               <td> <asp:Button runat="server" ID="CSWSBtn" Text="保存"  CssClass="site_button" OnClick="CSWSBtn_Click" OnClientClick="return localCheck(this)"/>
                    <input type="button" id="reset" onclick="location=location;"  class="site_button" value="重置"/>
                    <input type="button"  value="返回只读模式" class="site_button" onclick="disDiv()"/>
               </td></tr>
        </table>
        </div>
        <div id="readOnlyDiv" class="cswsDiv border" style="width:25%">
         <table>
           <tr id="adminTR" runat="server"><td>站点名称：</td><td><asp:Label runat="server" ID="lName" /></td></tr>
            <tr id="userTR" runat="server" visible="false"><td>站点名称：</td><td><asp:DropDownList runat="server" ID="siteList" 
                  ToolTip="切换站点" AutoPostBack="true" OnSelectedIndexChanged="siteList_SelectedIndexChanged" /></td></tr>
           <tr><td>管 理 员：</td><td><asp:Label runat="server" ID="lManager"></asp:Label></td></tr>
           <tr><td>操作系统：</td><td><asp:Label runat="server" ID="lOPSystem"></asp:Label></td></tr>
           <tr><td>IIS 版本：</td><td><asp:Label runat="server" ID="lIISVersion"></asp:Label></td></tr>
           <tr><td>Net 版本：</td><td><asp:Label runat="server" ID="lNetVersion"></asp:Label></td></tr>
           <tr><td>运行模式：</td><td><asp:Label runat="server" ID="lRunMode"></asp:Label></td></tr>
           <tr><td>I P 地址：</td><td><asp:Label runat="server" ID="lServerIP"></asp:Label></td></tr>
           <tr><td>站点状态：</td><td><asp:Label runat="server" ID="lSiteState"></asp:Label>
                   <asp:Button runat="server" ID="ssBtn2" OnClick="SSSite_Click" Text="启动" CssClass="site_button" style="margin-left:10px;"/></td></tr>
           <asp:Literal runat="server" ID="labelPath"></asp:Literal>
           <asp:Literal runat="server" ID="labelBind"></asp:Literal><!--协议，端口，域名-->
           <tr><td>错误页(禁止访问)：</td><td><asp:Label runat="server" ID="lErrorPage1" Text="无法读取配置文件"></asp:Label></td></tr>
           <tr><td>错误页(未 找 到)：</td><td><asp:Label runat="server" ID="lErrorPage2" Text="无法读取配置文件"></asp:Label></td></tr>
           <tr><td>错误页(内部错误)：</td><td><asp:Label runat="server" ID="lErrorPage3" Text="无法读取配置文件"></asp:Label></td></tr>
           <tr><td>错误页(服务不可用)：</td><td><asp:Label runat="server" ID="lErrorPage4" Text="无法读取配置文件"></asp:Label></td></tr>
           <tr><td>应用程序池：</td><td><asp:Label runat="server" ID="lSitePool"></asp:Label> </td></tr>
           <tr><td>操    作：</td>
               <td> <input type="button" id="editMode" value="进入修改模式" class="site_button" onclick="disDiv()"/>
                    <input  runat="server" id="rBtn" type="button" value="返回管理界面" class="site_button" onclick="location = 'Default.aspx'"/>
               </td></tr>
        </table>
        </div><!--readOnlyDiv End;-->
         <div id="container" style="width:360px; height:200px; margin:10px;"></div>
    </div><!--mainDiv-->
<script type="text/javascript">
    //保留小数点后一位
    function Decimal(x) {
        var f_x = parseFloat(x);
        if (isNaN(f_x)) {
            alert('参数为非数字，无法转换！');
            return false;
        }
        var f_x = Math.round(x * 10) / 10;

        return f_x;
    }


    var chart;
    $(document).ready(function () {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '<%=siteName%>'
            },
            tooltip: {
                formatter: function () {
                    return '<b>' + this.point.name + '</b>: ' +Decimal(this.percentage) + ' %';
                }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'default',
                    dataLabels: {
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        formatter: function () {
                            return '<b>' + this.point.name + '</b>: ' + Decimal(this.percentage) + ' %';
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: [<%=piePercent%>]
            }]
        });
        });

</script>
<script type="text/javascript">
        function localCheck(obj)
        {
            if(checkinfo('sitePort','Domain','PPath'))
            {
                if(confirm("更改设置,目标网站必须重启，你确定要重启目标网站吗！！"))
                {
                    setTimeout(function () { obj.disabled = true;},50);
                    return true;
                }
                else return false;
            }
            else{
                return false;
            }
        }

        function disDiv()
        {
            $("#CSWSDiv").toggle();
            $("#readOnlyDiv").toggle();
        }
        $(document).ready(function(){
            $("#readOnlyDiv tr").attr("height","30px");
        });
    </script>
</asp:Content> 
