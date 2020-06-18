<%@ page language="C#" autoeventwireup="true" inherits="IISMain, App_Web_1zxlesnb" masterpagefile="~/manage/Site/SiteMaster.master" title="站点列表" enableviewstate="True" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<style>
#site_nav .site01 a {background: url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
<script src="../../JS/Common.js"></script>
<script src="../../JS/jquery.js"></script>
<div id="m_site"><p> 站群中心 >> 站点列表</p></div>
    <div id="site_main">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="mainPanel"><ContentTemplate>
        <div id="tab3">
        <ZL:ExGridView ID="EGV" runat="server" DataSourceID="WSData" AllowPaging="True" RowStyle-CssClass="tdbg" AutoGenerateColumns="false"
                    MouseOverCssClass="tdbgmouseover" CellPadding="2" CellSpacing="1"  Width="100%"  OnRowDataBound="EGV_RowDataBound"
                    GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！" OnRowCommand="EGV_RowCommand" AllowSorting="true">
         <Columns>
             <asp:TemplateField HeaderText="ID">
                 <ItemTemplate>
                     <input type="checkbox" name="chk" value="<%#Eval("SiteName") %>" style="margin-right:10px;" />
                     <%#Eval("SiteID") %>
                 </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="网站名称"  ItemStyle-CssClass="site_ico"  SortExpression="SiteState">
                 <ItemTemplate>
                   <a href="javascript:;" title="运行状态" style="position:relative; bottom:-2px; right:5px;">
                       <%#(Eval("SiteState") as string) == "Started" ? "<img src='../../App_Themes/AdminDefaultTheme/images/site/site_ico.gif' style='cursor:default;' />" 
                       : "<img src='../../App_Themes/AdminDefaultTheme/images/site/site_ico_stop.gif' style='cursor:default;'/>" %>                     
                   </a>
                   <a href="SiteFileManage.aspx?siteName=<%# Server.UrlEncode(Eval("SiteName")as string) %>&index=0" title="浏览文件" style="position:relative;bottom:-5px;">
                   <img src="../../App_Themes/AdminDefaultTheme/images/Folder/folderopen.gif" /> </a>
                   <a href="SiteDetail.aspx?siteName=<%# Server.UrlEncode(Eval("SiteName")as string) %>" title="查看网站详情"><%# Eval("SiteName") %></a>
                     <a href="javascript:;" title="<%# "版本："+Eval("ZoomlaVersion") %>" style="position:relative; bottom:-2px; right:5px;margin-left:10px;">
                       <%#Eval("ZoomlaVersion").ToString().Length==0 ? "" 
                       : "<img src='../../favicon.ico' style='cursor:default;width:14px;height:14px;'/>" %>                 
                   </a>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="EditSiteName" runat="server" Text='<%#Eval("SiteName") %>' Width="90%" style="text-align:center;"/>
                 </EditItemTemplate>

<ItemStyle CssClass="site_ico"></ItemStyle>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="状态" SortExpression="SiteState">
                 <ItemTemplate>
                     <%#(Eval("SiteState") as string) == "Started" ? "<span style='color:green;'>运行中</span>" : "<span style='color:red;'>已停止</span>" %>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="端口" SortExpression="SitePort">
                 <ItemTemplate>
                       <a href="Default.aspx?siteName=<%# Server.UrlEncode(Eval("SiteName")as string) %>" title="点击浏览绑定信息"><%#Eval("SitePort") %></a>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox runat="server" ID="EditPort" Text='<%#Eval("SitePort") %>' Width="30%" style="text-align:center;"/>
                 </EditItemTemplate>
             </asp:TemplateField>
            
             <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="site_a">
                 <ItemTemplate>
                     <a href="javascript:;" title="浏览网站" onclick="testF(this,'getDomain', '<%#Eval("SiteName") %>');">浏览 </a>
                     <asp:LinkButton  runat="server" CommandName="Edit2" CommandArgument='<%# Container.DisplayIndex %>' >修改 </asp:LinkButton>
                     <a href="javascript:if(confirm('你确定要删除吗!')){ postToCS('del','<%#Eval("SiteName") %>')}">删除 </a>
                     <a href="javascript:postToCS('stop','<%#Eval("SiteName") %>')">停止 </a>
                     <a href="javascript:postToCS('start','<%#Eval("SiteName") %>')">启动 </a>
                     <a href="javascript:postToCS('restart','<%#Eval("SiteName") %>')">重启</a>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:LinkButton ID="Save" runat="server" CommandName="Save" CommandArgument='<%# Container.DisplayIndex+":"+Eval("SiteID") %>'>更新</asp:LinkButton>
                     <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" CommandArgument='<%# Container.DisplayIndex %>'>取消</asp:LinkButton>
                 </EditItemTemplate>

<ItemStyle CssClass="site_a"></ItemStyle>
             </asp:TemplateField>       
         </Columns>
            <PagerStyle   HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView><br />
               <script type="text/javascript">
                   function testF(obj,a, name) {
                       postToCS2(a,name,obj);
                   }
                   function postToCS2(a, name,obj) {
                       $.ajax({
                           type: "Post",
                           url: "Default.aspx",
                           data: { action: a, siteName: name },
                           success: function (data)
                           {
                               var result="";
                               var arr = data.split(',');
                               if (data == "") {
                                   alert("尚未绑定域名");
                                   return false;
                                   //result += "<li class='tdbg'>尚未绑定域名</li>";
                               }
                               //else if (arr.length == 1) { window.open("http://" + arr[0]); return; }
                               for (i = 0; i < arr.length && data != "";i++)
                               {
                                   //  result+="<li class='tdbg'><a href='http://"+arr[i]+"'>"+arr[i]+"</a></li>";

                                   result=arr[i]
                               }
                              
                               window.open("http://" + result, "_blank");
                              // $("#hrefBox").html(result);

                               easyDialog.open({
                                   container: 'hrefBox',
                                   follow: obj,
                                   followX: -60,
                                   followY: 15
                               });
                           },
                           error: function (data) { alert(data); }
                       });
                   }
                   
        </script>
        <asp:ObjectDataSource runat="server" ID="WSData" OldValuesParameterFormatString="original_{0}" SelectMethod="GetWSData" TypeName="GetDSData" ></asp:ObjectDataSource>
        <input type="button" id="btn1" value="创建新站点" class="site_button"/>
        <asp:Button runat="server" ID="batStart" Text="批量启动" class="site_button" OnClick="batStart_Click"/>
       <%-- <asp:Button runat="server" ID="batStop"  Text="批量停止" class="site_button" OnClick="batStop_Click"/>--%>
        <div style="display:none;">
        <input type="button" id="btn2" value="批量创建网站"/>
        <input type="button" id="btn3" value="批量删除"/>
        <input type="button" id="btn4" value="批量重启"/>
         </div>
            </div><!--tab3 end-->
       </ContentTemplate></asp:UpdatePanel>
          <%--  <asp:ObjectDataSource  runat="server" ID="AppPoolData" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAppPool" TypeName="GetDSData" ></asp:ObjectDataSource>--%>
            </div>
    <div id="SiteDataDiv" runat="server" visible="false">
            <!--目标站点的详细数据-->
            <div>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr style="text-align: center;">
                        <td class="titlemouseover" onclick="ShowTabs(this,0)">绑定信息</td>
                        <td class="tabtitle" onclick="ShowTabs(this,1)">虚拟目录 </td>
                    </tr>
                </table>
            </div>
            <div>
            <div id="tab0">
            <ZL:ExGridView runat="server" ID="EGV2" DataSourceID="SiteData" AllowPaging="True" RowStyle-CssClass="tdbg" AutoGenerateColumns="false"
                MouseOverCssClass="tdbgmouseover" CellPadding="2" CellSpacing="1"  CssClass="border" Width="100%"
                GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！" OnRowCommand="EGV2_RowCommand" Visible="false">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                 <ItemTemplate>
                     <input type="checkbox" name="chk2" value="<%#Eval("ID") %>" style="float:left;"/>
                     <%#Eval("ID") %>
                 </ItemTemplate>
             </asp:TemplateField>
                    <asp:TemplateField HeaderText="网站名称">
                        <ItemTemplate>
                            <a href="javascript:openSite(<%#Eval("SitePort") %>,<%#Eval("SitePort") %>)" title="点击浏览"><%# Eval("SiteName") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="协议类型">
                 <ItemTemplate>
                       Http
                 </ItemTemplate>
             </asp:TemplateField>
                    <asp:TemplateField HeaderText="状态">
                        <ItemTemplate>
                            <%#(Eval("SiteState") as string) == "Started" ? "<span style='color:green;'>运行中</span>" : "<span style='color:red;'>已停止</span>" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="端口">
                        <ItemTemplate>
                            <%#Eval("SitePort") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditPort" Text='<%#Eval("SitePort") %>' Width="30%" Style="text-align: center;" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="绑定域名">
                        <ItemTemplate>
                            <%#Eval("Domain") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="EditDomain" Text='<%#Eval("Domain") %>' Width="90%" Style="text-align: left;" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit2" CommandArgument='<%# Container.DisplayIndex %>'>修改|</asp:LinkButton>
                            <a href="javascript:if(confirm('你确定要删除吗!')){ postToCS('del2','<%#Eval("SiteName")+":"+ Eval("ID")+":"+Eval("SitePort") %>')}">删除</a>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="Save" runat="server" CommandName="Save" CommandArgument='<%# Container.DisplayIndex+":"+Eval("SiteName")+":"+Eval("ID") %>'>更新|</asp:LinkButton>
                            <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" CommandArgument='<%# Container.DisplayIndex %>'>取消</asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
           <asp:ObjectDataSource runat="server" ID="SiteData" OldValuesParameterFormatString="original_{0}" SelectMethod="GetSiteData" TypeName="GetDSData">
               <SelectParameters>
                   <asp:QueryStringParameter Name="siteName" QueryStringField="siteName" Type="String" />
               </SelectParameters>
            </asp:ObjectDataSource>
                <input type="button" value="返回上级页面" class="C_input" onclick="location = 'Default.aspx';" />
             <input type="button" id="addBindBtn" value="新增绑定" class="C_input" onclick="$('#addBindDiv').toggle();"/>  
             <asp:Button runat="server" Text="批量删除" CssClass="C_input" OnClick="batDel2_Click" />
            <div id="addBindDiv" style="display:none;">
                <table>
                <tr><td><label>绑定协议：</label></td><td><asp:TextBox runat="server" ID="BindProtocol" Text="Http"/><span style="color:red">*</span></td></tr>
                <tr><td><label>绑定I  P：</label></td><td><asp:TextBox runat="server" ID="BindIP" Text="*" /><span style="color:red">*(默认绑定全部IP)</span></td></tr>
                <tr><td><label>绑定端口：</label></td><td><asp:TextBox runat="server" ID="BindPort" /><span style="color:red">*</span></td></tr>
                <tr><td><label>绑定域名：</label></td><td><asp:TextBox runat="server" ID="BindDomain"  /><span style="color:red">*</span></td></tr>
                    <tr><td colspan="2"><asp:Button runat="server" ID="BindBtn1" OnClick="BindBtn1_Click" class="C_input" Text="添加绑定"/></td></tr>
                </table>
                <asp:HiddenField runat="server" ID="BindSiteName" Value=""/>
                </div>
                </div>
                <div id="tab1" style="display:none;">
                <asp:UpdatePanel runat="server" ID="update1"><ContentTemplate>
                    <ZL:ExGridView runat="server" ID="EGV3" DataSourceID="SiteData2" AllowPaging="True" RowStyle-CssClass="tdbg" AutoGenerateColumns="false"
                        MouseOverCssClass="tdbgmouseover" CellPadding="2" CellSpacing="1"  CssClass="border" Width="100%"
                        GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！" OnRowCommand="EGV3_RowCommand"  Visible="false">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <input type="checkbox" name="chk3" value="<%#Eval("Index") %>" style="float: left;" />
                                    <%#Eval("Index") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="网站名称">
                                <ItemTemplate>
                                    <%# Eval("SiteName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="虚拟路径">
                                <ItemTemplate>
                                    <%#Eval("Path") %>
                                </ItemTemplate>
                              <%--  <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="EditPath" Text='<%#Eval("Path") %>' Width="90%" Style="text-align: center;" />
                                </EditItemTemplate>--%>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="物理路径">
                                <ItemTemplate>
                                     <a href="<%# "SiteFileManage.aspx?siteName="+Server.UrlEncode(Eval("SiteName") as string)+"&index="+ 
                                     (Convert.ToInt32(Eval("Index"))-1) %>" title="点击浏览目录"> <%#Eval("PhysicalPath") %></a>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="EditPhySicalPath" Text='<%#Eval("PhysicalPath") %>' Width="90%" Style="text-align: center;" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit2" CommandArgument='<%# Container.DisplayIndex %>'>修改|</asp:LinkButton>
                                    <a href="javascript:" onclick="if (confirm('你确定要删除吗!')) 
                                        {postToCS('del3','<%#Eval("SiteName")+":"+ Eval("Index") %>');$(this).parent().parent().hide(); }">删除</a>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="Save" runat="server" CommandName="Save" CommandArgument='<%# Container.DisplayIndex+":"+Eval("SiteName")+":"+Eval("Index") %>'>
                                        更新|</asp:LinkButton>
                                    <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" CommandArgument='<%# Container.DisplayIndex %>'>取消</asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                        <RowStyle Height="24px" HorizontalAlign="Center" />
                    </ZL:ExGridView>
                    <asp:ObjectDataSource runat="server" ID="SiteData2" OldValuesParameterFormatString="original_{0}" SelectMethod="GetSitePaths" TypeName="GetDSData">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="siteName" QueryStringField="siteName" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <input type="button" value="返回上级页面" class="C_input" onclick="location = 'Default.aspx';" />
                    <asp:Button runat="server" ID="AddPathBtn" class="C_input" OnClick="AddPathBtn_Click" Text="添加"/>
                    <asp:Button runat="server" ID="baba" class="C_input" Text="批量删除" OnClick="batDel3_Click" OnClientClick="return confirm('你确定要执行删除吗');"/>
                     <table>
                        <tr><td><label>虚拟目录路径：</label></td><td><asp:TextBox runat="server" ID="VPath" /><span style="color:red">*</span></td></tr>
                        <tr><td><label>物理目录路径：</label></td><td><asp:TextBox runat="server" ID="PPath" /><span style="color:red">*</span></td></tr>
                     </table>
                    </ContentTemplate></asp:UpdatePanel>
                </div>
                </div>
        </div>
    <script type="text/javascript">

            $(function () {
                $("#btn1,#rBtn1").click(function () {
                    location = "CreateSite.aspx";
                });//btn1 end;

                $("#btn2,#rBtn2").click(function () {
                    $("#BCWSDiv").toggle();
                    $("#CSWSDiv").hide();
                });//btn2 end;
             
                $("#<%=EGV.ClientID%>  tr>th:eq(0)").html("<input type=checkbox id='chkAll' style='margin-right:10px;'/>ID");//EGV顶部
                //$("#EGV2 tr>th:eq(0)").html("<input type=checkbox id='chkAll2' style='float:left;'/>ID");
                //$("#EGV3 tr>th:eq(0)").html("<input type=checkbox id='chkAll3' style='float:left;'/>ID");
                //$("#EGV4 tr>th:eq(0)").html("<input type=checkbox id='chkAll4' style='float:left;'/>ID");

                $("#chkAll").click(function () {//EGV 全选
                    selectAll(this,"chk");
                });
                //$("#chkAll2").click(function () {//EGV2 全选
                //    selectAll(this, "chk2");
                //});
                //$("#chkAll3").click(function () {
                //    selectAll(this, "chk3");
                //});
                //$("#chkAll4").click(function () {
                //    selectAll(this, "chk4");
                //});
                
                //bindInfo("例:www.baidu.com", "BindDomain");
                //bindInfo('例:/test/test', 'VPath');
                //bindInfo('例:C:\\test\\', 'PPath')

                $("table tr").mousemove(function () { this.className = 'tdbgmouseover'; }).mouseout(function () { this.className = 'tdbg'; });
            });//ready End;

            function bindInfo(s, id)
            {
               $("#"+id).val(s).css('color', '#666')
                    .focus(function () { if (this.value == s) { this.value = ''; } })
                    .blur(function () { if (this.value == '') { this.value = s; this.style.color = '#666'; } });
            }
            function postToCS(a,name)
            {
                $.ajax({
                    type: "Post",
                    url:"Default.aspx",
                    data: { action: a, siteName: name },
                    success: function (data) { if (a != "del3") { location = location; } else { alert(data);}; },
                    error: function (data) { alert(data);}
                });
            }

            function selectAll(obj,name) {
                var allInput = document.getElementsByName(name);
                var loopTime = allInput.length;
                for (i = 0; i < loopTime; i++) {
                    if (allInput[i].type == "checkbox") {
                        allInput[i].checked = obj.checked;
                    }
                }
            }
            function openSite(domain,port)
            {
                if (domain == "") domain = "localhost";
                open("http://"+domain+":"+port);
            }
            function ShowTabs(obj, id) {//Div切换
                $(obj).addClass("titlemouseover").siblings().removeClass("titlemouseover").addClass("tabtitle");
                $("#tab" + id).show("fast").siblings().hide();
            }
        </script>
</asp:Content>