<%@ page language="C#" autoeventwireup="true" inherits="User_AddOrderSql, App_Web_dcd_josq" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>添加订单申请</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../../App_Themes/UserThem/bidding.css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script src="../JS/jquery.js" type="text/javascript"></script> 
<style type="text/css">
h1{ font-size:16px; height:28px; line-height:28px;}
</style>
</head>
<body>
 <form id="form1" runat="server">
          <div class="us_topinfo">
        您现在的位置：
        <a title="网站首页" href="/" target="_blank">
        <asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a>
        &gt;&gt;
        <a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a>
        &gt;&gt;
        <a title="账单申请" href="OrderSql.aspx"> 账单申请</a> 【<a href="AddOrderSql.aspx">添加申请账单</a>】
    </div>

    <div>
    <table id="" width="100%" style=" line-height:25px;">
                 <tr>
            <td align="right">帐单类型：</td>
            <td>
           <asp:DropDownList ID="OrderType" runat="server"><asp:ListItem Value="1">新开返利</asp:ListItem><asp:ListItem Value="2">消费上报</asp:ListItem></asp:DropDownList>
            </td>
        </tr>

        <tr><td width="15%" align="right">报价商家用户ID:</td><td><asp:Textbox ID="UserName" runat="server"  Width="195px"></asp:Textbox></td></tr>
        <tr><td width="15%" align="right">订单金额:</td><td><asp:Textbox ID="money" runat="server" Width="195px"></asp:Textbox></td></tr>
         <tr><td width="15%" align="right">再次确认返分会员ID:</td><td><asp:Textbox ID="PuserID" runat="server"  Width="195px"  AutoPostBack="True"  OnTextChanged="PuserID_Changed"></asp:Textbox>*请再次录入会员ID：<%Call.Label("{$GetRequest(UID)$}"); %> <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="PuserID" ErrorMessage="用户ID只能为数字！" ValidationExpression="^\+?[1-9][0-9]*$"></asp:RegularExpressionValidator></td></tr>
        <!--onkeyup="value=value.replace(/[^\d\.]/g,'')"  -->
        <tr><td width="15%" align="right">会员名校验：</td>  <td><asp:Textbox ID="PuserName" runat="server"  Width="195px"></asp:Textbox> <asp:Label ID="UserTip" runat="server" Style="color:#f00;">无此会员!</asp:Label></td></tr>
       <tr><td width="15%" align="right">脚本:</td><td><asp:Textbox ID="Sqlstr" runat="server" TextMode="MultiLine" Rows="20" Style=" width:200px; height:80px;" Text=" "></asp:Textbox></td></tr> 
	<tr><td width="15%" align="right">备注:</td><td><asp:Textbox ID="remark" runat="server" Width="195px"></asp:Textbox></td></tr>
	<tr><td width="15%" align="right">提示</td><td>*您可以更改源码中的SQL数据脚本提交模板。</td></tr> 

	<tr><td colspan="2"><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" class="i_bottom" /> <input type="button" ID="Button2"  value="返回" class="i_bottom" onclick="javascript: history.back();"  /> </td></tr>

</table>  

       
<!--下面的代码用于被脚本引用，默认隐藏属性-->
       <textarea name="str" rows="20" cols="20" id="str" style=" width:200px; height:80px;display:none;"> 
/*开始传钱*/

Declare @分成级别 int,@传入会员消费额 int,@传入商家会员ID int,@传入商家会员名 nvarchar(255),@传入商家应得金额 money,@程序上的实际上级商家名 nvarchar(255),@程序上的实际上级商家应得金额 money,@导购员应得金额 money,@市县代理应得金额 money,@省代分成 money,@会员ID int

set @分成级别=
(
	select rebaterate from ZL_Group
	where GroupID=
	(
	select GroupID from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserName=(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserID=<%Call.Label("{$GetRequest(UID)$}"); %>
	)
	)--查出所属商家的分成点数（有三种比例）
)
set @传入会员消费额=<%Call.Label("{$GetRequest(Money)$}"); %> --由GET传入
set @传入商家会员ID=<%Call.Label("{$GetRequest(PayNameID)$}"); %>--由GET传入
set @传入商家会员名=(Select username from ZL_User where UserID=<%Call.Label("{$GetRequest(PayNameID)$})"); %>
set @传入商家应得金额=
(
	@传入会员消费额*(select RebateRate from ZL_Group
	where GroupID=(
	select GroupID from ZL_User where  UserName=@传入商家会员ID
	))/100
)


set @程序上的实际上级商家名=
(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserID=<%Call.Label("{$GetRequest(UID)$}"); %> --查出上一级代理，三种商家
)
set @程序上的实际上级商家应得金额=
(
	@传入会员消费额*(select RebateRate from ZL_Group
	where GroupID=(
	select GroupID from ZL_User where  UserName=@程序上的实际上级商家名
	))/100
)
set @导购员应得金额=(@传入会员消费额*0.01)
set @市县代理应得金额=(@传入会员消费额*0.02)
set @省代分成=(@传入会员消费额*0.005)
set @会员ID=<%Call.Label("{$GetRequest(UID)$}"); %>

--select @分成级别 as 分成级别,@传入商家会员ID as 传入商家会员ID,@传入商家会员名 as 传入商家会员名,@传入商家应得金额 as 传入商家应得金额,@程序上的实际上级商家名 as 程序上的实际上级商家会员名,@传入会员消费额 as 传入会员消费额,@程序上的实际上级商家应得金额 as 程序上的实际上级商家应得金额,@导购员应得金额 as 导购员应得金额,@市县代理应得金额 as 市县代理应得金额,@省代分成 as 省代分成,@会员ID as 会员ID

if
 @传入商家会员名=@程序上的实际上级商家名
 begin

update zl_user set Purse=Purse+@程序上的实际上级商家应得金额 where  UserName=@程序上的实际上级商家名
--会员实际消费且按8%、12%、16%级别分成

update zl_user set Purse=Purse+@导购员应得金额 where  UserName=(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where UserName=(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserID=<%Call.Label("{$GetRequest(UID)$}"); %>
	)
)--查出三种商家上的级别,如购导员，并按1%分成

update zl_user set Purse=Purse+@市县代理应得金额 where  UserName=(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserName=(
	select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserName=
		(
		select person from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserID=<%Call.Label("{$GetRequest(UID)$})"); %>
	)
)--查出区县代理商，按2%分成

update zl_user set Purse=Purse+@省代分成 where  UserName=(
	select Username from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where GroupID=2 and Province=(
	select province from 
	ZL_User left join ZL_UserBase on ZL_User.UserID = ZL_UserBase.UserID
	where ZL_User.UserID=<%Call.Label("{$GetRequest(UID)$}"); %>
	)
)--查出唯一的省代,并按0.5%分成

end
else
begin

update zl_user set Purse=Purse+@传入商家应得金额 where  UserID=@传入商家会员ID

end     
 </textarea>
<script>
    document.getElementById("Sqlstr").value = document.getElementById("str").value;
</script>
<!--引用结束-->
      </div>

</div>
</form>
</body>
</html>
