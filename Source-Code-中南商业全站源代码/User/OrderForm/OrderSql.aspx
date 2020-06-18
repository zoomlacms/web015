<%@ page language="C#" autoeventwireup="true" inherits="User_OrderSql, App_Web_dcd_josq" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订单申请</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../App_Themes/UserThem/bidding.css" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script src="../JS/jquery.js" type="text/javascript"></script>
    <style type="text/css">

table.MsoTableGrid
	{border:solid windowtext 1.0pt;
	font-size:10.5pt;
	font-family:"Calibri","sans-serif";
	}
p.MsoListParagraph
	{margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:21.0pt;
	font-size:10.5pt;
	font-family:"Calibri","sans-serif";
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
        .auto-style1 {
            height: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>  <div class="us_topinfo">
        您现在的位置：
        <a title="网站首页" href="/" target="_blank">
        <asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a>
        &gt;&gt;
        <a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a>
        &gt;&gt;
      <a title="账单申请" href="OrderSql.aspx"> 账单申请</a>    【<a href="AddOrderSql.aspx">添加申请账单</a>】
    </div>
        <div class="us_seta" style="margin-top: 5px;"><h1 align="center">账单申请</h1>
            
        <table width="100%" border="0" cellpadding="1" cellspacing="1" style="line-height:25px; text-align:center;"  >
            <tr class="tdbgleft">
                <td style="line-height: 25px; ">ID </td>
                 <td >帐单类型 </td>
                <td >提交金额 </td>
                <td> 返分会员名 </td>
                <td >备注 </td>
                <td >  状态</td>
                <td >提交时间 </td>
                <td >  操作</td>
            </tr>
           <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                 <ItemTemplate>
 <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
     <td style="line-height: 25px; "> <%#Eval("ID")%> </td>
      <td><a href="OrderSql.aspx?Type=<%#Eval("OrderType")%>"> <%#getOrderType(Eval("OrderType","{0}"))%></a></td>
                <td> <%#Eval("money","{0:N2}")%></td>
                <td >  <%#getUserName(Convert.ToInt32(Eval("PuserID")))%> </td>
                <td> <%#Eval("remark")%></td>
                <td> <%#getStatus(Eval("status","{0}"))%> | <%#getPayStatus(Eval("PayState","{0}"))%> | <%#getRunStatus(Eval("SqlState","{0}"))%></td> 
                <td>  <%#Eval("AddTime")%></td>
     <td><A href="AddOrderSql.aspx?ID=<%#Eval("ID")%> ">查看</A> </td>
            </tr>
                 </ItemTemplate>
           </asp:Repeater>
           
        </table> 
         <ul>
                <li style="width: 98.5%; float: left; line-height: 28px; text-align: left;">共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条记录
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：
                    <asp:Label ID="Nowpage" runat="server" Text="" />
                    /
                    <asp:Label ID="PageSize" runat="server" Text="" />
                    页
                    <asp:TextBox ID="txtPage" runat="server" Width="25px" AutoPostBack="True" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                    条记录/页 转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    页 </li>
            </ul>
    </div></div>
    </form>
</body>
</html>
