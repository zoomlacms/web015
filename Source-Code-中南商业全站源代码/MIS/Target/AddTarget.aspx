<%@ page language="C#" autoeventwireup="true" inherits="MIS_AddMis, App_Web_yuw1lllm" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>添加目标</title>
<link href="/App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>  
<script src="/JS/MisView.js"></script> 
<script type="text/javascript">
    function loadPage(id, url) {
        $("#" + id).addClass("loader");
        $("#" + id).append("Loading......");
        $.ajax({
            type: "get",
            url: url,
            cache: false,
            error: function () { alert('加载页面' + url + '时出错！'); },
            success: function (msg) {
                $("#" + id).empty().append(msg);
                $("#" + id).removeClass("loader");
            }
        });
    }
    loadPage("M_toper", "/Mis/header.aspx?hid=1");
    function setEmpty(obj) {
        if (obj.value == "请输入关键字") {
            obj.value = "";
        }
    }
    function settxt(obj) {
        if (obj.value == "") {
            obj.value = "请输入关键字";
        }
    }
    
  </script>
</head>
<body>
    <div id="M_toper"></div>
  <form id="form1" runat="server"> 
<div id="height"></div>
       <div id="Meno">
      <div id="pro_left">
          <div class="new_tar"><a href="AddTarget.aspx">新建目标</a></div>
          <div class="search">
              <asp:DropDownList ID="drType" CssClass="b_input" runat="server">
                <asp:ListItem Value="">全部</asp:ListItem>
                <asp:ListItem Value="0">事业</asp:ListItem>
                <asp:ListItem Value="1">财富</asp:ListItem>
                <asp:ListItem Value="2">家庭</asp:ListItem>
                <asp:ListItem Value="3">休闲</asp:ListItem>
                <asp:ListItem Value="4">学习</asp:ListItem>
             </asp:DropDownList>
              <asp:TextBox ID="TxtKey" CssClass="b_input" runat="server"  Text="请输入关键字" Width="120" onclick="setEmpty(this)" onblur="settxt(this)"></asp:TextBox>
              <asp:Button ID="Button1" runat="server" CssClass="bottom_bg"  Text="" OnClick="Button1_Click" /> 
              <div class="clear"></div>
          </div>
          <div class="Target_list"> 
              <ul>
             <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
            <li><a href="Default.aspx?ID=<%#Eval("ID") %>"> <%#Eval("Title")%></a></li>
            </ItemTemplate>
            </asp:Repeater>
            </ul>  
          </div> 
      </div>
               <div id="pro_right">
       <div class="Mis_pad">
     <table width="100%"  class="border"  >
     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td style="width: 150px" class="tdbgleft"><strong> 目标名称<b>*</b>：</strong></td>
        <td><asp:TextBox ID="TextTitle" class="M_input" MaxLength="20" runat="server" />
            <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label>  
   
          </td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td   class="tdbgleft"><strong>当前状态：</strong></td>
        <td>
          <asp:RadioButtonList ID="TextStatus" runat="server" RepeatDirection="Horizontal" >
              
               <asp:listitem Value="0">未启动</asp:listitem>
                <asp:listitem Value="1" selected>进行中</asp:listitem>
             <asp:listitem Value="2">已完成</asp:listitem>
                    </asp:RadioButtonList>
             
          </td>
      </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td   class="tdbgleft"><strong>选择分类：</strong></td>
        <td>
            <asp:RadioButtonList ID="TextType" runat="server" RepeatDirection="Horizontal" >
               <asp:listitem value="0">事业</asp:listitem>
                <asp:listitem value="1" selected>财富</asp:listitem>
             <asp:listitem value="2">家庭</asp:listitem>
                 <asp:listitem value="3" selected>休闲</asp:listitem>
             <asp:listitem value="4">学习</asp:listitem>
                    </asp:RadioButtonList>
           </td>
      </tr>
          <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td style="width: 150px" class="tdbgleft"><strong> 参与人：</strong></td>
        <td><asp:TextBox ID="TextJoiner" class="M_input" runat="server" /> <a href="javascript:void(0)" onclick="PopupDiv('div_share','lblChecked')">选择</a> 
           
          </td>
      </tr>
          <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td  class="tdbgleft"><strong>开始时间<b>*</b>：</strong></td>
        <td><asp:TextBox ID="StarDate"  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="M_input" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StarDate" SetFocusOnError="false" ErrorMessage="开始时间不能为空" ></asp:RequiredFieldValidator>
         </td>
      </tr>
         <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td  class="tdbgleft"><strong>完成时间<b>*</b>：</strong></td>
        <td><asp:TextBox ID="EndDate" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="M_input" runat="server" />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EndDate" SetFocusOnError="false" ErrorMessage="完成时间不能为空" ></asp:RequiredFieldValidator>
         </td>
      </tr>
              <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" id="ScheduleID">
        <td   class="tdbgleft"><strong>当前进度：</strong></td>
        <td>
            <asp:TextBox ID="TxtSchedule" runat="server"  class="M_input"/><b><asp:Label runat="server" ID="Label" Text="100%"></asp:Label></b>
           </td>
      </tr>
          <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
           <td class="tdbgleft">
                <strong>梦想图<b>*</b>：</strong>
            </td>
            <td>         
               <asp:TextBox ID="TxtPic" runat="server" class="M_input"  /> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtPic" SetFocusOnError="false" ErrorMessage="梦想图不能为空" ></asp:RequiredFieldValidator>
                <iframe id="bigimgs" style="top: 2px" src="/user/fileupload.aspx?menu=TxtPic"   width="100%" height="25px" frameborder="0"  marginheight="0" marginwidth="0" scrolling="no"></iframe>
            </td>
        </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td  class="tdbgleft"><strong>详细<b>*</b>：</strong></td>
        <td> <asp:TextBox id="TxtContent1" name="TxtContent1" width="580px" height="200px" TextMode="MultiLine"   runat="server"></asp:TextBox>
         </td>
      </tr>
          <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td colspan="2"><asp:Button Text="确定"  runat="server" ID="BtnCommit" CssClass="i_bottom"  OnClick="Button_Click"/></td>
        
      </tr>
         <asp:HiddenField ID="ParentID" runat="server" />
          <asp:HiddenField ID="TxtInputer" runat="server" />
             </table>

<div id="div_share" class="pop_box" style="width:500px;">
<div class="p_head">
<div class="p_h_title">人员选择</div>
<div class="p_h_close" onclick="HideDiv('div_share')">关闭</div>
</div>
<iframe src="/Mis/SelUser.aspx?OpenerText=TextJoiner" width="480" height="180" scrolling="no" frameborder="0"></iframe>
<div class="p_bottom">
<input type="button" value="确定" onclick="HideDiv('div_share')" />
</div>
</div> 
</div></div>
</form>
<script>
var a = '<%Call.Label("{$GetRequest(ParentID)$}"); %>';
if (a == '') {
    document.getElementById("ScheduleID").style.display = "none";
} 
</script>
<script  type="text/javascript">
//<![CDATA[
CKEDITOR.replace('TxtContent1',
{
    toolbar : [['Source', '-', 'Bold', 'Italic', 'Underline', 'Strike'], ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote','JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'], ['Link', 'Unlink', 'Anchor', 'Image', 'SpecialChar'], ['TextColor', 'BGColor', 'Smiley', 'ShowBlocks', 'Maximize', 'About'], '/', ['Styles', 'Format', 'Font', 'FontSize']]
});
//]]>
</script>

</body>
</html>
