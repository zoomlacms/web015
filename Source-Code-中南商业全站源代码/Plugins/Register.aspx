<%@ page language="C#" autoeventwireup="true" inherits="Plugins_Register, App_Web_iwky-wjl" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>注册问卷调查系统</title>
<link href="../App_Themes/UserThem/Survey.css" rel="stylesheet" type="text/css" />
 <script>
     function isID(idcard) {
         var Errors = new Array(
             "验证通过!",
             "身份证号码位数不对!",
             "身份证号码出生日期超出范围或含有非法字符!",
             "身份证号码填写错误!", //"身份证号码校验错误!", 
             "身份证地区非法!"//"身份证地区非法!" 
         );
         var area = { 11: "北京", 12: "天津", 13: "河北", 14: "山西", 15: "内蒙古", 21: "辽宁", 22: "吉林", 23: "黑龙江", 31: "上海", 32: "江苏", 33: "浙江", 34: "安徽", 35: "福建", 36: "江西", 37: "山东", 41: "河南", 42: "湖北", 43: "湖南", 44: "广东", 45: "广西", 46: "海南", 50: "重庆", 51: "四川", 52: "贵州", 53: "云南", 54: "西藏", 61: "陕西", 62: "甘肃", 63: "青海", 64: "宁夏", 65: "新疆", 71: "台湾", 81: "香港", 82: "澳门", 91: "国外" }
         var idcard, Y, JYM;
         var S, M;
         var idcard_array = new Array();
         idcard_array = idcard.split("");
         //地区检验 
         if (area[parseInt(idcard.substr(0, 2))] == null) {
             alert(Errors[4]);
            // document.form1.id.focus();
             return false;
         }
         //身份号码位数及格式检验 
         switch (idcard.length) {
             case 15:
                 if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0 || ((parseInt(idcard.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0)) {
                     ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性 
                 } else {
                     ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性 
                 }
                 if (ereg.test(idcard)) {
                     return true;
                 }
                 else {
                     alert(Errors[2]);
                     document.form1.id.focus();
                     return false;
                 }
                 break;
             case 18:
                 //18位身份号码检测 
                 //出生日期的合法性检查 
                 //闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9])) 
                 //平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8])) 
                 if (parseInt(idcard.substr(6, 4)) % 4 == 0 || (parseInt(idcard.substr(6, 4)) % 100 == 0 && parseInt(idcard.substr(6, 4)) % 4 == 0)) {
                     ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式 
                 } else {
                     ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式 
                 }
                 if (ereg.test(idcard)) {//测试出生日期的合法性 
                     //计算校验位 
                     S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
                     + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
                     + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
                     + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
                     + (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
                     + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
                     + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
                     + parseInt(idcard_array[7]) * 1
                     + parseInt(idcard_array[8]) * 6
                     + parseInt(idcard_array[9]) * 3;
                     Y = S % 11;
                     M = "F";
                     JYM = "10X98765432";
                     M = JYM.substr(Y, 1);//判断校验位 
                     if (M == idcard_array[17]) return true; //检测ID的校验位 
                     else {
                         alert(Errors[3]);
                         //document.form1.id.focus();
                         return false;	//Errors[3];
                     }
                 }
                 else {
                     alert(Errors[2]);
                     //document.form1.id.focus();
                     return false;	//Errors[2]; 
                 }
                 break;
             default:
                 alert(Errors[1]);
                 //document.form1.id.focus();
                 return false;	//Errors[1];
                 break;
         }
     }

     function idLenChk(id) {
         var intLen = id.length;
         if (intLen != 18) {
             alert('身份证号输入位数有误，请检查');
             return false;
         }
         return true;
     }

     function chkform() {
         if (document.form1.TxtCode.value == '') {
             alert('请填写身份证号码');
             document.form1.TxtCode.focus();
             return false;
         }
         else {
             if (!isID(document.form1.TxtCode.value)) { 
                 return false;
             }
             if (idLenChk(document.form1.TxtCode.value) == false) {
                 document.form1.TxtCode.focus();
                 return false;
             }
         if (document.form1.TxtPassword.value == '') {
             alert('请填写密码');
             document.form1.TxtPassword.focus();
             return false;
         }
         else {
             if (document.form1.TxtPassword.value.length < 6) {
                 alert('密码填写位数不满足条件');
                 document.form1.TxtCode.focus();
                 return false;
             }
         }
         if (document.form1.TxtPassword1.value == '') {
             alert('请再次确认密码');
             document.form1.TxtPassword1.focus();
             return false;
         }
         if (document.form1.TxtPassword.value != document.form1.TxtPassword1.value) {
             alert('两次输入的密码不一致');
             document.form1.TxtPassword1.focus();
             return false;
         }
         }
         return true;
     }

 </script>
</head>
<body class="Survey_bg">
    <form id="form1" runat="server">
    <div id="Survey_main">
    <div class="Survey_tit"><%Call.Label("{$SiteName/}"); %></div>
        <div class="Survey_ban"><strong>问卷调查系统</strong></div>
        <div class="STit"><img src="../App_Themes/UserThem/images/Survey/star.gif" /><strong>新用户注册 </strong><a href="/">«返回首页</a></div>
        <div class="Survey_Reg">
            <table width="100%" class="border">
                <tr><td class="Td_left" width="160">请输入身份证号</td><td  class="Td_right"><asp:TextBox runat="server" ID="TxtCode" Width="260"></asp:TextBox><asp:Label runat="server" ID="LblMessage" Text="" ></asp:Label></td></tr>
                <tr><td  class="Td_left">请输入密码</td><td  class="Td_right"><asp:TextBox runat="server"   ID="TxtPassword"  Width="260" TextMode="Password"></asp:TextBox></td></tr>
                <tr><td  class="Td_left">请再次输入密码</td><td  class="Td_right"><asp:TextBox runat="server" ID="TxtPassword1"  Width="260 "  TextMode="Password"></asp:TextBox></td></tr>
                <tr><td colspan="2" style="text-align:left"><strong>注意：身份证号为18位，最后一位如果是字母，请填写大写字母X；</strong>密码最小长度为 6 位，最大长度为50位，可由字母、数字和特殊字符组成，且区分字母大小写。设定密码之前请确保大写锁定处于关闭状态。
</td></tr>
                <tr><td colspan="2"><asp:Button Text=""  runat="server"  OnClientClick="return chkform();" OnClick="Button_Click"  ID="Button1" CssClass="i_bottom" /></td></tr><!-- -->
             </table>
         </div>
    </div>
    </form>
</body>
</html>
