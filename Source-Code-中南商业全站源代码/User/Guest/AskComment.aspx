<%@ page language="C#" autoeventwireup="true" inherits="User_Guest_AskComment, App_Web__kfish9p" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>我的评论</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/bidding.css"  rel="stylesheet" type="text/css"  />
</head>
<body>
    <form id="form1" runat="server"> 
<div class="us_topinfo" style="width: 98%">
<div class="us_pynews">
您现在的位置：<a title="网站首页" href="/" target="_blank"><asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a>&gt;&gt;
<a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a> &gt;&gt; 我的评论
</div>
<div class="cleardiv"> </div>
</div>
  <div class="us_seta">
        <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
            <tr class="title" >
                <td>问题</td>
                <td>答案</td>
                <td>评论内容</td>
                <td>评论时间</td>
            </tr>
            <asp:Repeater ID="Rep_comment" runat="server" OnItemDataBound="Rep_comment_ItemDataBound">
				<ItemTemplate>
					<tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" class="tdbg">
						<td style="padding-left:10px; line-height:22px;"<label runat="server" id="lbAsk"></label></td>
						<td style="padding-left:10px; "><label runat="server" id="lbAsw"></label></td>
                        <td style="padding-left:10px; "><%#Eval("Content") %></td>
						<td style="padding-left:10px; "><%#Eval("AddTime") %></td>
					</tr>
				</ItemTemplate>
			</asp:Repeater>
            <tr>
                <td colspan="4">
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
