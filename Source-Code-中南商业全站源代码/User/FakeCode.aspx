<%@ page language="C#" autoeventwireup="true" inherits="User_FakeCode, App_Web_hhz41g8f" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>防伪码验证</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/bidding.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../JS/DatePicker/WdatePicker.js"></script> 
<style type="text/css">
.bottom{  background: url(/Images/title.gif) #CBE6FC repeat-x top;	padding:2px;color: #0E529D;	}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="us_topinfo">您现在的位置：<a title="网站首页" href="#" target="_parent"><asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a>&gt;&gt; <a title="会员中心" href='<%=ResolveUrl("~/User/Default.aspx" )%>' target="_parent">会员中心</a> &gt;&gt; <a href="UserInfo.aspx">账户管理</a>&gt;&gt;防伪码验证[<a href="/Scha.aspx" target="_blank">前置查询</a>]
</div>
    <div class="us_topinfo">
    请输入防伪码:&nbsp;<asp:TextBox ID="FakeCode" runat="server" onkeyup="value=value.replace(/[^\d\.]/g,'')"></asp:TextBox>
        <script type="text/javascript">
        </script>
        <asp:Button ID="Sub" runat="server" Text="提交验证" OnClick="sub_Click" class="i_bottom"/>
        <asp:Label ID="Remind" runat="server" Text="" style="color:red;font-size:15px;"></asp:Label>
    </div>
        <br />
        <label>从</label>
        <asp:TextBox ID="startDate"  runat="server" onclick="WdatePicker();"></asp:TextBox>
        <label>至</label>
        <asp:TextBox ID="endDate"  runat="server"  onclick="WdatePicker();"></asp:TextBox>
        <asp:Button ID="Search" runat="server" Text="查询" OnClick="Search_Click" OnClientClick="return checkIsEmpty()" class="i_bottom"/>
        <script type="text/javascript">
            function checkIsEmpty()//日期为空不上传
            {
                flag = true;
                if (document.getElementById("endDate").value == "")
                    flag = false;
                else if (document.getElementById("startDate").value == "")
                    flag = false;
                return flag;
            }
        </script>
        <asp:Label runat="server" ID="topInfo"></asp:Label>

        <asp:GridView ID="Egv" runat="server" AutoGenerateColumns="False"  border="0" cellspacing="1"  AllowSorting="False" EnableTheming="False" Width="100%" RowStyle-CssClass='tdbg' HeaderStyle-Height="28px" EnableModelValidation="True" BorderColor="White" BorderStyle="Solid">
        <HeaderStyle Height="28px"></HeaderStyle>
        <RowStyle  Height="35px"></RowStyle>
        <Columns>
        
        <asp:TemplateField HeaderText="防伪码" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="30%" >
          <ItemTemplate><%#Eval("Remark") %>  </ItemTemplate>
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%"></ItemStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="分值" ItemStyle-HorizontalAlign="Center"  ItemStyle-VerticalAlign="Middle" ItemStyle-Width="20%" >
          <ItemTemplate><%#Eval("score") %>   </ItemTemplate>
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%"></ItemStyle>
        </asp:TemplateField>
            <asp:TemplateField HeaderText="验证成功时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="30%" >
          <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "HisTime", "{0:yyyy年M月d日 HH:mm:ss}")%>  </ItemTemplate>
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%"></ItemStyle>
        </asp:TemplateField>
        </Columns>
      </asp:GridView>
      <table id="Conten" runat="server" width="100%" border="0" cellpadding="2" cellspacing="1"  style="margin: 0 auto;">
        <tr class="bottom" align="center">
          <td > 共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            条数据
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />
            /
            <asp:Label ID="PageSize" runat="server" Text="" />
            页
            <asp:TextBox ID="txtPage" runat="server"  class="l_input" Width="16px" Height="16px" OnTextChanged="txtPage_TextChanged" ReadOnly="true"></asp:TextBox>
            条数据/页 </td>
        </tr>
      </table>
    </form>
</body>
</html>