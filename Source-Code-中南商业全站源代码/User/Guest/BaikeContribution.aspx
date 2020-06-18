<%@ page language="C#" autoeventwireup="true" inherits="User_Guest_BaikeContribution, App_Web__kfish9p" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>我的词条贡献</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/bidding.css"  rel="stylesheet" type="text/css"  />
<script type="text/javascript">
    window.onload = function () {
        var type = location.href.split("type=")[1];
        if (type == 0 || type == 1 || type == 2 || type == 3) {
            document.getElementById("switch").value = type;
        }
    }
    function switchChange(obj) {
        location.href = "?type=" + obj.value;
    }
</script>
</head>
<body>
    <form id="form1" runat="server"> 
<div class="us_topinfo" style="width: 98%">
<div class="us_pynews">
您现在的位置：<a title="网站首页" href="/" target="_blank"><asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a>&gt;&gt;
<a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a> &gt;&gt; 词条贡献
</div>
<div class="cleardiv"> </div>
</div>
    <div class="us_seta">
        <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
            <tr class="title">
                <td>基本情况</td>
            </tr>
            <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" class="tdbg" >
                <td>
                    <ul>
                        <li style="float:left; text-align:center; margin-left:20px;">提交版本<br /><%=GetBasic("1") %></li>

                        <li style="float:left; text-align:center; margin-left:20px;">通过版本<br /><%=GetBasic("2") %></li>

                        <li style="float:left; text-align:center; margin-left:20px;">通过率<br /><%=GetBasic("3") %></li>
                    </ul>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
            <tr class="title">
                <td style="width:70%;">我的词条信息</td>
                <td style="width:30%;"><select id="switch" onchange="switchChange(this)" style="width:100px;">
                    <option value="0">已通过版本</option>
                    <option value="1">待审核版本</option>
                    <option value="2">未通过版本</option>
                </select></td>
            </tr>
            <asp:Repeater ID="Repeater_baike" runat="server" OnItemDataBound="Repeater_baike_ItemDataBound">
				<ItemTemplate>
					<tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" class="tdbg">
						<td style="width:70%; padding-left:10px; line-height:22px;">
                            <a href='/Guest/Baike/Details.aspx?soure=manager&tittle=<%#Server.UrlEncode(Eval("Tittle").ToString()) %>' target="_blank" ><%# Eval("Tittle")%></a><br />
                             [<%#Convert.ToDateTime(Eval("AddTime")).ToString("yyyy-MM-dd")%>]
						</td>
						<td style="width:30%;"><label runat="server" id="lbstatus"></label></td>
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
