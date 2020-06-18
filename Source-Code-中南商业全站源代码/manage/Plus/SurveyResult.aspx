<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Plus.SurveyResult, App_Web_zf-stwpc" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>问卷投票结果</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />   
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">后台管理&gt;&gt;<a href="SurveyManage.aspx">问卷投票管理</a>&gt;&gt;问卷投票结果</div>
        <table class="border" width="100%" cellpadding="2" cellspacing="1">
            <tr>
                <td class="spacingtitle" style="line-height: 26px; text-align: center; background-color: #8dc2ee; font-size: 16px; font-weight: bolder;">
                    <asp:Label ID="lblSurveyName" runat="server" Style="letter-spacing: normal"></asp:Label></td>
            </tr>
            <tr>
                <td class="tdbg" style="line-height: 25px; text-align: left;">
                    <asp:Label ID="lblDesp" runat="server" Style="word-wrap: break-word; word-break: break-all; padding-left: 30px;"> 没有添加问卷描述。。。。</asp:Label></td>
            </tr>
            <tr>
                <td class="tdbg">
                    <asp:Repeater ID="rptReuslt" runat="server" OnItemDataBound="rptReuslt_ItemDataBound">
                        <ItemTemplate>
                             <table style="width: 100%;">
                                <tr class="title">
                                    <td colspan="3"  style="line-height:25px;"> 第 <%#Container.ItemIndex +1 %>  题 : <%# Eval("QuestionTitle") %> [<%# GetQuesType(Eval("TypeID")) %>] </td>
                                </tr>
                                 <tr><td>
                                     <asp:Label ID="lblTip" Visible="true" runat="server" Text="文本内容不可查看。。。"></asp:Label></td></tr>
                            <asp:Repeater ID="rptOption" runat="server">
                                <ItemTemplate>
                                    <tr class="options">
                                        <td style="width:40%;"> ( <%# Convert.ToChar(Container.ItemIndex + 65) %> ) 、 <%# Container.DataItem %></td>
                                        <td style="width:50%;">
                                            <asp:Image ID="imgBar" runat="server" ImageUrl="~/images/redline.jpg" Height="20px"/>
                                        </td>  
                                        <td>
                                             <asp:Label ID="lblPercent" runat="server" style="padding-left:15px; color:blue; font-size:10px;"></asp:Label>
                                        </td>                                       
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                                 </table>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr class="tdbgbottom">
                <td>
                    <input name="print" type="button" id="Button1" class="C_input" value="打印" onclick="window.print();" />&nbsp;&nbsp;
        <input name="Cancel" type="button" id="Cancel" class="C_input" value="返回" onclick="window.location.href = 'SurveyManage.aspx';" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
