<%@ page language="C#" autoeventwireup="true" inherits="User_Guest_BaikeFavorite, App_Web__kfish9p" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>百科收藏</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/bidding.css"  rel="stylesheet" type="text/css"  />
</head>
<body>
    <form id="form1" runat="server"> 
<div class="us_topinfo" style="width: 98%">
<div class="us_pynews">
您现在的位置：<a title="网站首页" href="/" target="_blank"><asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a>&gt;&gt;
<a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a> &gt;&gt; 百科收藏
</div>
<div class="cleardiv"> </div>
</div>
       <div class="us_seta">
        <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
            <tr class="title">
                <td>已收藏词条</td>
                <td>收藏时间</td>
            </tr>
            <asp:Repeater ID="Repeater_baike" runat="server" OnItemDataBound="Repeater_baike_ItemDataBound">
				<ItemTemplate>
					<tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" class="tdbg">
						<td style="width:70%;line-height:22px; padding-left:10px;">
                            <%--<a href='/Guest/Baike/Details.aspx?soure=manager&tittle=<%#Server.UrlEncode(Eval("Tittle").ToString()) %>' target="_blank" ><%# Eval("Tittle")%></a><br />--%>
                            <a href='/Guest/Baike/Details.aspx?soure=manager&tittle=<%#Server.UrlEncode(getTitle(Eval("InfoID").ToString())) %>' target="_blank" ><%#getTitle(Eval("InfoID").ToString())%></a>
						</td>
						<td style="width:28%;line-height:22px; padding-left:10px;"><%#Convert.ToDateTime(Eval("FavoriteDate")).ToString("yyyy-MM-dd")%></td>
					</tr>
				</ItemTemplate>
			</asp:Repeater>
            <tr>
                <td>
                    <ul>
                        <li style="width: 98.5%; float: left; line-height: 28px; text-align: center;">
                            共
                                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                            条信息
                            <asp:LinkButton runat="server" ID="First" onclick="First_Click">首页</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="Prev" onclick="Prev_Click">上一页</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="Next" onclick="Next_Click">下一页</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="Last" onclick="Last_Click">尾页</asp:LinkButton>
                            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                                Text="" />页
                            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" CssClass="l_input" OnTextChanged="txtPage_TextChanged"
                                Width="30px">10</asp:TextBox>
                            条信息/页 转到第<asp:DropDownList ID="DropDownListPage" runat="server" 
                                AutoPostBack="True" onselectedindexchanged="DropDownListPage_SelectedIndexChanged">
                            </asp:DropDownList>
                            页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                                ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
