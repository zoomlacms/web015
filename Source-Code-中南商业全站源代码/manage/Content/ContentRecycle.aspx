<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ContentRecycle, App_Web_hy2ojcfu" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%=lang.Get("M_ContentRecycle_recyleContent")%></title>
<link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/main.css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<style type="text/css">
#Egv td, #Egv th {  border: 1px solid #fff;  width: auto;  padding-left: 10px; }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">
            <%if (GetOpenHelp.IsopenHelp() == "1")
              { %>
            <div id="help"><a onclick="help_show('93')" title="帮助"></a></div>
            <%} %><span><%=lang.Get("M_SpecContent_manage") %></span> &gt;&gt; <span><%=lang.Get("M_CommentManage_system") %></span> &gt;&gt; <span><a href="ContentManage.aspx"><%=lang.Get("M_SpecContent_content")%></a></span> &gt;&gt;<span><%=lang.Get("m_recycle")%></span>
        </div>
        <div class="clearbox">
        </div>
            <asp:GridView ID="Egv" CssClass="border" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="GeneralID" PageSize="100" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" Width="100%">
                <EmptyDataTemplate>无相关数据</EmptyDataTemplate>
                <EmptyDataRowStyle BackColor="#e8f4ff" Height="45px" BorderColor="#4197e2" HorizontalAlign="Center" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSel" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle Width="5%" />
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox_CheckedChanged" ToolTip="全选" />
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="GeneralID" HeaderText="ID">
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="标题">
                        <HeaderStyle Width="50%" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="所属栏目">
                        <HeaderStyle Width="10%" />
                        <ItemTemplate>
                            <%# GetNodeName(Eval("NodeID", "{0}")) %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="内容模型">
                        <HeaderStyle Width="10%" />
                        <ItemTemplate>
                            <%# GetModelName(Eval("ModelID", "{0}")) %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Inputer" HeaderText="输入人">
                        <HeaderStyle Width="10%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据彻底删除吗？')">删除</asp:LinkButton>
                            &nbsp;|&nbsp;
				<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Reset" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据还原吗？')">还原</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
                <PagerSettings Visible="false"/>
            </asp:GridView>
            <div id="divPager" runat="server">
            <table style="width:100%;">
                <tr>
                    <td class="tdbg">
                        <div style="text-align: center">
                            <span style="text-align: center">
                                <%=lang.Get("m_ContentPager_total")%>
                                <asp:Label ID="lblTotalCnts" runat="server" Text=""></asp:Label>
                                <%=lang.Get("m_ContentPager_data")%>&nbsp;&nbsp;
                                <asp:LinkButton ID="lbtnFirstPage" CommandName="First" OnClick="LbtnAlterPage_Click" runat="server">首页</asp:LinkButton> &nbsp;
                                <asp:LinkButton ID="lbtnPrePage" CommandName="Previous" OnClick="LbtnAlterPage_Click" runat="server">上一页</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="lbtnNextPage" CommandName="Next" OnClick="LbtnAlterPage_Click" runat="server">下一页</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="lbtnLastPage" CommandName="Last" OnClick="LbtnAlterPage_Click" runat="server">尾页</asp:LinkButton>&nbsp; &nbsp;
                                <%=lang.Get("m_ContentPager_pages")%>：
                        <asp:Label ID="lblCurntPageNum" runat="server"/>/
                        <asp:Label ID="lblPageCnts" runat="server"/>
                                <%=lang.Get("m_ContentPager_page")%>&nbsp; &nbsp;
                                <asp:Label ID="lblPages" runat="server" Text="" />
                                <%=lang.Get("m_ContentPager_tip")%>
                                <asp:TextBox ID="txtPageSize" runat="server" AutoPostBack="true" class="l_input" Width="30px" ToolTip="所输入的数据小于100" OnTextChanged="txtPageSize_TextChanged"></asp:TextBox> 
                                <%=lang.Get("m_ContentPager_data")%> &nbsp; &nbsp;
                                <%=lang.Get("m_ContentPager_turn")%>
                                <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
                                </asp:DropDownList>
                                <%=lang.Get("m_ContentPager_page")%>
                               &nbsp; &nbsp; <asp:RangeValidator ID="RangeValidator1" runat="server"  ControlToValidate="txtPageSize" ErrorMessage="数据不合法！" Type="Integer" MaximumValue="100" MinimumValue="1"></asp:RangeValidator></span>
                        </div>
                    </td>
                </tr>
            </table>
                </div>
            <div class="clearbox" />        
        <div id="divBtns" runat="server">
        <asp:Button ID="btnRevert" Style="width: 110px;" class="C_input" runat="server" Text="还原选中内容" OnClick="btnRevert_Click" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定要还原所选中的内容? \n\t还原后请进入内容对信息进行审核！')}" />&nbsp;
        <asp:Button ID="btnRevertAll" Style="width: 110px;" class="C_input" runat="server" Text="还原所有内容" OnClientClick="return confirm('确定要还原所有内容?\n\t还原后请进入内容对信息进行审核！')" OnClick="btnRevertAll_Click" />
        &nbsp;
        <asp:Button ID="btnClear" Style="width: 110px;" class="C_input" runat="server" Text="清除选中内容" OnClick="btnClear_Click" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('数据删除后不可恢复，确认要删除选中项？')}" UseSubmitBehavior="true" />&nbsp;
        <asp:Button ID="btnClearAll" Style="width: 110px;" class="C_input" runat="server" Text="清空回收站" OnClick="btnClearAll_Click" OnClientClick="return confirm('数据删除后不可恢复，确认清空？')" />
            </div>
    </form>
</body>
</html>
