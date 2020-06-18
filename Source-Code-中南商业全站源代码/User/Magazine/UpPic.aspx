<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.UserZone.Pic.UpPic, App_Web_gfu2bwih" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>上传相片</title>
<link href="../../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<div class="us_topinfo">
您现在的位置：<span id="YourPosition"><span><a title="网站首页" href="/" target="_blank"><asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a> &gt;&gt; <a title="会员中心" href='<%=ResolveUrl("~/User/Default.aspx")%>' target="_blank">会员中心</a> &gt;&gt; <a title="我的电子杂志" href='<%=ResolveUrl("~/User/Magazine/MagazContent.aspx")%>'>我的电子杂志</a>&gt;&gt;上传杂志图片
</div>
    <table width="760px" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2"><h2> 上传杂志<font color="red"><%=name %></font>  的图片</h2></td>
      </tr>
     <%-- <tr class='tdbg'><td align='right' class='tdbgleft'><span>图片地址</span></td>
      <td><table border='0' cellpadding='0' cellspacing='1' width='100%'>
      <tr class='tdbg'>
      <td style='width:410px;'>
      <input type="hidden" name="txt_PhotoUrl" id="txt_PhotoUrl" value="">
      <select name='sel_PhotoUrl' id='sel_PhotoUrl' style='width: 400px; height: 100px;' ondblclick="ModifyUrl(document.form1.sel_PhotoUrl,'sel_PhotoUrl','txt_PhotoUrl')" size='2'>
      <option value="图片地址1|http://www.zoomla.cn/skin/default/productshow1.jpg">图片地址1|http://www.zoomla.cn/skin/default/productshow1.jpg</option>
      <option value="图片地址2|http://www.zoomla.cn/skin/default/productshow2.jpg">图片地址2|http://www.zoomla.cn/skin/default/productshow2.jpg</option>
      <option value="图片地址3|http://www.zoomla.cn/skin/default/productshow3.jpg">图片地址3|http://www.zoomla.cn/skin/default/productshow3.jpg</option>
      <option value="图片地址4|http://www.zoomla.cn/skin/default/productshow4.jpg">图片地址4|http://www.zoomla.cn/skin/default/productshow4.jpg</option>
      <option value="图片地址5|http://www.zoomla.cn/skin/default/productshow7.jpg">图片地址5|http://www.zoomla.cn/skin/default/productshow7.jpg</option>
      </select></td><td><input type="button" class="button" onclick="SelectFiles('sel_PhotoUrl','txt_PhotoUrl')" value="从已上传文件中选择"> <br/>
      <input type="button" class="button" onclick="AddPhotoUrl('sel_PhotoUrl','txt_PhotoUrl')" value="添加外部地址"><br/>
      <input type="button" class="button" value="修改当前地址" onclick="return ModifyPhotoUrl('sel_PhotoUrl','txt_PhotoUrl');" /><br />
      <input type="button" class="button" value="删除当前地址" onclick="DelPhotoUrl('sel_PhotoUrl','txt_PhotoUrl');" />
      </td>
      <tr class='tdbg'>
      <td style='height:150px' colspan='2'>
      <iframe id='Upload_PhotoUrl' src='/Plugins/swfFileUpload/Uploadify.aspx?ModelID=3&FieldName=PhotoUrl&NodeId=97&content=MaxFileSize=100,UploadFileExt=jpg|gif|bmp|png' marginheight='0' marginwidth='0' frameborder='0' width='100%' height='100%' scrolling='no'></iframe>
      </td>
      </tr>
      </table>
      </td></tr>--%>
      <tr>
        <td colspan="2"> 
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr style="height: 40px">
              <td rowspan="2"> 你可以上传JPG，JPEG，<br />
                GIF，PNG或BMP文件，<br />
                每个文件大小可以到3M。 </td>
              <td><input id="UpPic1" type="file" runat="server" /></td>
            </tr>
            <tr style="height: 40px">
              <td><input id="UpPic2" type="file" runat="server" /></td>
            </tr>
            <tr style="height: 40px">
              <td rowspan="4"> 你需要对你上传的内容负责，<br />
                请勿上传未经授权、涉及他人<br />
                隐私、色情、暴力血腥及违反<br />
                国家法律法规的照片或图片。 </td>
              <td><input id="UpPic3" type="file" runat="server" /></td>
            </tr>
            <tr style="height: 40px">
              <td><input id="UpPic4" type="file" runat="server" /></td>
            </tr>
            <tr style="height: 40px">
              <td><input id="UpPic5" type="file" runat="server" /></td>
            </tr>
            <tr style="height: 40px">
              <td align="center"><asp:Button ID="Button1" runat="server" Text="上  传" OnClick="Button1_Click" />
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="取  消" OnClick="Button2_Click" /></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td></td>
      </tr>
    </table>
</form>
</body>
</html>