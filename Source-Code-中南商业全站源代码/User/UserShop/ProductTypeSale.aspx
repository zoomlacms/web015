﻿<%@ page language="C#" autoeventwireup="true" inherits="User_UserShop_ProductTypeSale, App_Web_8prky8tx" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlTop2.ascx" TagName="WebUserControlTop2" TagPrefix="uc1" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>会员中心 >> 我的店铺</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function CheckAll(spanChk)//CheckBox全选
{
var oItem = spanChk.children;
var theBox=(spanChk.type=="checkbox")?spanChk:spanChk.children.item[0];
xState=theBox.checked;
elm=theBox.form.elements;
for(i=0;i<elm.length;i++)
if(elm[i].type=="checkbox" && elm[i].id!=theBox.id)
{
	if(elm[i].checked!=xState)
	elm[i].click();
}
}
</script>
<script src="/JS/calendar.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div style="width:100%">
    <uc1:WebUserControlTop2 ID="WebUserControlTop2_1" runat="server" />
    <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    <div class="us_topinfo" style="margin-top:10px; width:98%"><a href="ProductSaleList.aspx">总体销售统计</a> <a href="ProductSale.aspx">商品销售排名</a> <a href="ProductTypeSale.aspx">商品类别销售排名</a> <a href="UserOrder.aspx">会员订单排名</a> <a href="UserShopOrder.aspx">会员购物排名</a></div>
    <div class="us_topinfo" style="margin-top:10px; width:98%">
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;" id="TABLE1">
      <tr align="center">
        <td width="33%" class="title">
            分类ID</td>
        <td width="33%" class="title">
            产品分类</td>
        <td width="33%" class="title">
            总销量</td>
        
      </tr>
      
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
              <tr class="">
        <td height="22" class="tdbg" align=center>
            <%#Eval("NodeID", "{0}")%></td>
        <td height="22" class="tdbg" align=center><%#Eval("NodeName")%></td>
        <td height="22" class="tdbg" align=center><%#getnum(Eval("NodeID","{0}"))%></td>
      </tr>
      </ItemTemplate>
        </asp:Repeater>
              <tr class="tdbg">
<td height="22" colspan="10" align="center" class="tdbgleft">共 <asp:Label ID="Allnum" runat="server" Text=""></asp:Label> 条记录  <asp:Label ID="Toppage" runat="server" Text="" /> <asp:Label ID="Nextpage" runat="server" Text="" /> <asp:Label ID="Downpage" runat="server" Text="" /> <asp:Label ID="Endpage" runat="server" Text="" />  页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  <asp:Label ID="pagess" runat="server" Text="" />条记录/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
              </asp:DropDownList>页</td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
