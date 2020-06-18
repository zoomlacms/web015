<%@ page language="C#" autoeventwireup="true" inherits="User_Content_AddMap, App_Web_iqfodgts" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<title>标注地图</title>
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=" type="text/javascript"></script>
<script type="text/javascript" src="http://fw.qq.com/ipaddress" charset="gb2312"></script> 
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="/JS/GoogleMap.js" type="text/javascript"></script>
<script type="text/javascript"> 
    window.onload = function () {
         ShowMap(<%=uid %>,'',<%=mid %>);
          $.get('GoogleMap.ashx?mt=' + new Date().getTime() + "&v2=select&mid=<%=mid %>", function (data) {
               var tr=data.split(',');
               $("#hlngy").val(tr[0]);
               $("#hlngx").val(tr[1]);
               $("#hlngz").val(tr[2]);
               $("#haddtxt").val(tr[3]);
          }); 
    } 
</script>
</head>
<body onload="ShowMap(<%=uid %>,'',<%=mid %>);"> <%--onunload="GUnload()"--%>
<form id="form1" runat="server">
<div>
    <div style="margin: auto; margin-top: 20px; width: 80%; height: 30px; line-height: 30px; text-align: left;">
        地区选择：<input value="放大" id="maxmap" type="button" /><input id="minmap" type="button"
            value="缩小" />
        <asp:DropDownList runat="server" ID="drop">
        </asp:DropDownList>
        <asp:DropDownList runat="server" ID="drop1">
            <asp:ListItem Value="" Text="请选择"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div id="map" style="height: 400px">
    </div>
    <br />
    <p class="tips">
        提示：鼠标在地图区拖动可以创建您的标注</p>
    <div style="margin: auto; margin-top: 20px; width: 90%; height: 50px; line-height: 50px; text-align: center;">
           <asp:Button Text="保存地图" ID="Save" runat="server" onclick="Save_Click" />
    </div>
</div>
<input type="hidden" id="hlngx" name="hlngx"/>
<input type="hidden" id="hlngy" name="hlngy"/>
<input type="hidden" id="hlngz" name="hlngz"/>
<input type="hidden" id="hmid" name="hmid"/>
<input type="hidden" runat="server" id="haddtxt" name="haddtxt" value="您的位置" />
</form>
</body>
</html>
<script type="text/javascript"> 
   function Getvs() {
    $("#hmid").val($("#addtxt").val());
}
    $("#drop").change(function () {
        ShowMap(<%=uid %>,$("#drop").val(),<%=mid %>);
          $.get('GoogleMap.ashx?mt=' + new Date().getTime() + "&v2=xml&Xname=" + escape($("#drop").val()), function (data) {
               var tr=data.split(',');
              var gm;
               for(var i=0;i<tr.length;i++)
               {
                  gm +="<option value=\""+tr[i]+"\" >"+tr[i]+"</option>";
               }
                $("#drop1").html(gm);
          });
    });
     $("#drop1").change(function () {
         if($("#drop1").val().replace(" ","").length>0)
         {
         ShowMap(<%=mid %>,$("#drop1").val());  
         }
     });  
</script>