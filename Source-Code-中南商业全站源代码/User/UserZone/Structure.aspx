<%@ page language="C#" autoeventwireup="true" inherits="User_UserZone_Structure, App_Web_vuwjm7de" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>企业结构</title>
<link href="../../App_Themes/UserThem/bidding.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" /> 
    <style>        .border li {
    margin-left:10px;    }
     </style>
</head>
<body>
<form id="form1" runat="server">
        <div class="us_topinfo" style="width:98%">
        <div class="us_pynews">
        您现在的位置：<span id="YourPosition"> <a title="网站首页" href="/" target="_blank">
            <asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label>
            </a> &gt;&gt;  <a title="会员中心" href='<%=ResolveUrl("~/User/Default.aspx" )%>' target="_parent"> 会员中心</a>  &gt;&gt;  企业结构 </span>
        </div>
    </div>
    
    <div id="nostruct" runat="server">您还没有加入企业结构！选择[<a href="Structure.aspx?Struct=yx">可加入的企业结构</a>] 或 [<a href="AddStructure.aspx"> 创建企业结构</a>]
    </div> 

<div id="manageinfos"  runat="server" class="us_seta" style="height:25px;"  visible="false">

 <ul style="width:100%">
         <li style="width:120px; text-align:center " ><a href="Structure.aspx?Struct=join">我加入的企业结构</a></li> 
         <li style="width:120px; text-align:center " ><a href="Structure.aspx?Struct=my">我创建的企业结构</a></li>
        <li style="width:120px; text-align:center "><a href="Structure.aspx?Struct=yx">可加入的企业结构</a></li>
        <li style="width:120px; text-align:center "><a href="AddStructure.aspx"> 创建企业结构</a> </li>
 </ul>
<div id="joinstruct" runat="server"   class="us_seta"  style="margin-top:5px;">
    <h1 align="center">我加入的企业结构</h1>
  
      <table  width="100%" cellpadding="2" cellspacing="1" class="border" >
         <tr class="tdbgleft"><th width="10%" height="28">结构名称</th><th align="left">操作</th></tr> 
    <Asp:Repeater ID="Repeater3" runat="server"  OnItemCommand="Repeater3_ItemCommand">
        <ItemTemplate>
          <tr><td  align="center"> <a href='StructView.aspx?ID=<%#Eval("IDD") %>' title="查看"> <%#Eval("Namee") %> </a></td><td><asp:LinkButton ID="Linkbtn1" Text="退出" CommandArgument='<%#Eval("IDD") %>' CommandName="joout"  runat="server"></asp:LinkButton></td></tr>
        </ItemTemplate>
    </Asp:Repeater> 
    </table> 
 </div>
 <div id="mystruct" runat="server"    class="us_seta"  style="margin-top:5px;">
    <h1 align="center">我创建的企业结构</h1>
    <table  width="100%" cellpadding="2" cellspacing="1" class="border">
    <ul>
    <Asp:Repeater ID="Repeater2" runat="server" >
        <ItemTemplate>
         <li> <a href='StructView.aspx?ID=<%#Eval("ID") %>' title="查看"> <%#Eval("Name") %> </a></li>
        </ItemTemplate>
    </Asp:Repeater> 
        </ul>
 </div>
  <div  id="yxstruct" runat="server"  visible="false"  class="us_seta"  style="margin-top:5px;">
    <h1 align="center">可加入的企业结构</h1>
  
    <table  width="100%" cellpadding="2" cellspacing="1"  border="0" class="border">
        <tr class="tdbgleft"><th width="10%"  height="28">结构名称</th><th align="left">操作</th></tr> 
    <Asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
        <ItemTemplate>
            <tr><td  align="center" height="25"><%#Eval("Name") %></td><td><asp:LinkButton ID="Linkbtn1" Text="加入" CommandArgument='<%#Eval("ID") %>' CommandName="join"  runat="server"></asp:LinkButton></td></tr>
        </ItemTemplate>
    </Asp:Repeater>
    </table>
 </div>
</div>
</form>
</body>
</html>
