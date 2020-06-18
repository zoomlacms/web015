<%@ page language="C#" autoeventwireup="true" inherits="User_Content_Recyle, App_Web_iwlfzaij" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>黄页回收站</title>
<link href="../../../App_Themes/UserThem/bidding.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<script  type="text/javascript" src="/js/SelectCheckBox.js"></script>
</head>
<body>
    <div>
<span><a href="MyContent.aspx" style="color:blue;">返回黄页管理</a></span><span> &gt;&gt; </span><span>回收站</asp:Label></span></div>
    <form id="form1" runat="server">
    <div>
    <div class="us_seta">
        <asp:GridView ID="Egv" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="GeneralID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
               <Columns>
                <asp:TemplateField HeaderText="选择">
                  <ItemTemplate>
                      <asp:CheckBox ID="chkSel" runat="server" />
                  </ItemTemplate>
                  <ItemStyle HorizontalAlign="Center" />                
                </asp:TemplateField>
                <asp:BoundField DataField="GeneralID" HeaderText="ID">
                <HeaderStyle Width="6%" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="标题">
                <HeaderStyle Width="50%" />
                <ItemTemplate>  
                    <a href="<%# GetUrl(Eval("GeneralID", "{0}"))%>" target="_blank"><%# GetModel(Eval("GeneralID", "{0}"))%><%# Eval("Title")%></a>     
                </ItemTemplate>            
                </asp:TemplateField>
                <asp:TemplateField HeaderText="状态">
                <ItemTemplate>  
                    <%# GetStatus(Eval("Status", "{0}")) %>       
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="已生成">
                <ItemTemplate>  
                    <%# GetCteate(Eval("IsCreate", "{0}"))%>     
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>            
                <asp:TemplateField HeaderText="操作" >
                <ItemTemplate>   
                    <asp:LinkButton  ID="Btn_Rec" runat="server" CommandName="Rec" CommandArgument='<%# Eval("GeneralID") %>'>还原</asp:LinkButton>
                     <asp:LinkButton ID="Btn_Del" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据彻底删除吗？')">彻底删除</asp:LinkButton>
                  </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" Height="25px" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
        </asp:GridView>
       <li style="width:100%; float:left;line-height:30px">
                        <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="选中本页显示的所有项目" />
                        <asp:Button ID="Button1" runat="server"   Text="批量还原" OnClick="btnRecAll_Click"
            OnClientClick="if(!IsSelectedId()){alert('请选择还原项');return false;}else{return confirm('你确定要将所选中的项还原吗？')}"
            CssClass="i_bottom" UseSubmitBehavior="true" />
           &nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:Button ID="Bat_Del" Text="批量删除" runat="server" OnClick="Bat_Del_Click" onClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所选中的项删除吗？')}"
            CssClass="i_bottom"/>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%--<asp:TextBox ID="TxtSearchTitle" runat="server" Style="color:#666;" ></asp:TextBox>--%>
           <input  type="text"  runat="server" ID="TxtSearchTitle" style="color:#666;" value="请输入标题" onclick="if (this.value == '请输入标题') { this.value = ''; this.style.color = 'black';}"
               onblur="if(this.value==''){this.value='请输入标题';this.style.color='#666';}">

<asp:Button ID="Btn_Search" runat="server" Text="搜索" CssClass="i_bottom" OnClick="Btn_Search_Click" 
    />

           <script>
               document.getElementById("TxtSearchTitle").value.trim();
               
           </script>
           <asp:HiddenField ID="HiddenField1" runat="server" />
           <asp:HiddenField ID="HiddenField2" runat="server" />
           <asp:HiddenField ID="HiddenField3" runat="server" />
           <asp:HiddenField ID="HiddenField4" runat="server" />
               </li>
               <li style="width:100%; float:left;line-height:30px"></li>
              </div>
    </div>
           <asp:HiddenField ID="hdid" runat="server" />
           <asp:HiddenField ID="hdflag" runat="server" />
           <asp:HiddenField ID="hdnoid" runat="server" />
           <asp:HiddenField ID="hdmdid" runat="server" />
    </form>
</body>
</html>
