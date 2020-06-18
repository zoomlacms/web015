<%@ page language="C#" autoeventwireup="true" inherits="manage_IISManage_CreateSite, App_Web_injnyj3b" masterpagefile="~/manage/Site/SiteMaster.master" title="创建新站点" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content runat="server" ContentPlaceHolderID="head">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/Guide.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/index.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/main.css" />
<script type="text/javascript" src="../../JS/chinese.js"></script>
<script src="../../JS/jquery.js"></script>
<script type="text/javascript">
    function setEmpty(obj) {
        if (obj.value == "输入想要搜索的关键字") {
            obj.value = "";
        }
    }
    function settxt(obj) {
        if (obj.value == "") {
            obj.value = "输入想要搜索的关键字";
        }
    }
</script>
<style>
#site_nav .site01 a{ background:url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat  }
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
<div id="m_site"><p> 站群中心 >> 配置管理</p></div>  
<div id="site_main">
      <div id="CSWSDiv" class="cswsDiv"><!--Create Single Web Site-->
            <ul><li><strong>站点名称：</strong><asp:TextBox runat="server" ID="CSWebName" CssClass="site_input" 
                 onblur="checkValue(this,'R1',1)"/><span style="color:red" id="R1">*</span></li>
             <li><strong>物理路径：</strong><asp:TextBox runat="server" CssClass="site_input" ID="CSPhysicalPath" 
                 onblur="checkValue(this,'R2',2)"/><span style="color:red" id="R2">*例:D:\WebSite\</span></li>
                 <li><strong>网站端口：</strong><asp:TextBox runat="server" ID="CSPort" CssClass="site_input"  MaxLength="6" txt="端口" 
                 onblur="checkValue(this,'R3',3)"/><span style="color:red" id="R3">*最多6位</span></li>
                 <li><strong>动态域名：</strong><asp:TextBox runat="server" ID="CSDomain" CssClass="site_input"  txt="域名"/><span style="color:red">*例:www.zoomla.cn,需要绑定的域名</span></li>
                 <li id="batTr" style=" padding-left:240px;"><label for="newa">批量绑定</label>
                 <a href="javascript:" onclick="newadd()" title="添列一列" id="newa"><img src="../../App_Themes/AdminDefaultTheme/images/padd.jpg" /></a> </li>
           <li>应用程序池：<asp:TextBox runat="server" ID="CSAppPool" CssClass="site_input"  /><span style="color:red"></span></li>
           <li>立即启动网站： <input type="checkbox" name="chk" checked="checked"/> </li>
           <li>操作： <asp:Button runat="server" ID="CSWSBtn" Text="确定"  CssClass="site_button" OnClick="CSWSBtn_Click"  OnClientClick="return checkinfo('sitePort', 'Domain');"/>
                    <input type="button" id="rBtn1" value="返回管理界面" class="site_button" onclick="location = 'Default.aspx'"/></li></ul>
        <%-- <div id="batDiv">
             <table id="batTable" cellspacing="1" cellpadding="0" class="border">
                 <tr ><td colspan="3" style="text-align:center;color:green;">批量添加绑定</td></tr>
                 <tr ><td><label>端口：</label><input type="text" name="sitePort" style="width:40px;"  maxlength="6" txt="端口"/></td>
                     <td><label>域名：</label><input type="text" name="Domain" txt="域名"/></td><td><a href="javascript:" onclick="add()" title="添加一列">
                         <img src="../../App_Themes/AdminDefaultTheme/images/padd.jpg" /></a></td></tr>
                  </table>
         </div>--%>
          <script type="text/javascript">
              $().ready(function () {
                  $("#<%=CSWebName.ClientID%>").keyup(function () { Getpy('<%=CSWebName.ClientID%>', '<%=CSAppPool.ClientID%>') });
              });
              function oldadd() {//Disuse
                  var tr = "<tr class='tdbg'><td><label>端口：</label><input type='text' name='sitePort'  txt='端口' style='width:40px;'/>" +
                      "</td><td><label>域名：</label><input type='text' name='Domain' txt='域名'/></td><td><a href='javascript:' onclick='remove(this)' title='移除'>" +
                      "<img src='../../App_Themes/AdminDefaultTheme/images/error.gif' /></a></td></tr>";
                  $("#batTable").append(tr);
              }
              function newadd() {
                  var tr = "<li><label>批量绑定：</label></td><td><label>端口：</label><input type='text' name='sitePort'  class='site_input' style='width:40px;'  maxlength='6' txt='端口'/>" +
                     "<label> 域名：</label><input type='text' name='Domain' class='site_input' txt='域名'/><a href='javascript:' onclick='remove(this)' title='移除'>" +
                     "<img src='../../App_Themes/AdminDefaultTheme/images/error.gif' /></a></li>";
                  $("#batTr").after(tr);
              }
              function remove(obj) {
                  $(obj).parent().remove();
              }
              function checkinfo()//Detect whether the domains and ports is empty;
              {
                  for (i = 0; i < arguments.length; i++) {
                      var arr = document.getElementsByName(arguments[i]);
                      for (j = 0; j < arr.length; j++) {
                          if (arr[j].value == "") { alert(arr[j].txt + "未填写"); arr[j].focus(); return false; }
                      }
                  }
                  return true;
              }
              function checkValue(obj, t, Mark)//要检测的控件对象,显示提示信息用的span,标识自身，以便后台调用相应方法处理
              {
                  //为空也不前台判断，全交于后台判断，避免伪造信息
                  $.ajax({
                      type: "post",
                      url: "CreateSite.aspx",
                      data: { data: obj.value, mark: Mark },
                      success: function (data) { $("#" + t).html(data); },
                      error: {}
                  });//ajax end;
              }
          </script>
          
          
        </div>
    </div>
</asp:Content>
