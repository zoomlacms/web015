<%@ page language="C#" autoeventwireup="true" inherits="Plugins_UserVote, App_Web_iwky-wjl" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>报名系统</title>
<link href="../App_Themes/UserThem/Survey.css" rel="stylesheet" type="text/css" />
<script src="../JS/jquery.js" type="text/javascript"></script>
<script src="../js/UserDefault.js" type="text/javascript"></script>
    <script src="../JS/Verify.js"></script>   
<script src="../manage/Common/Common.js"></script>
<script type="text/javascript">
    //检查答题情况， 假定每个都是必填的
    var goto = false;
    var vflag = true;
    function CheckAns() {
        var flag = false;
        var tables = document.getElementsByTagName("table");
        preview(1);
        for (var i = 0; i < tables.length; i++) {
            var options = document.getElementsByName("vote_" + i);
            flag = false;
            if (options.length > 1) {
                for (var j = 0; j < options.length; j++) {
                    if (options[j].checked) {
                        flag = true;
                        break;
                    }
                }
            }
            else if (options.length == 1) {
                if (options.value.length > 0)
                    flag = true;
            }
            if (flag == false || vflag == false) {
                alert('问卷未完成， 请继续答题。。。');
                // document.getElementById("mao_" + i).focus();
                // GotoAnchor(i);
                return false;
            }
        }
        return true;
    }

    function preview(oper) {
        if (oper < 10) {
            bdhtml = document.getElementById("divContent").innerHTML;//获取当前页的html代码  
            sprnstr = "<!--startprint" + oper + "-->";//设置打印开始区域  
            eprnstr = "<!--endprint" + oper + "-->";//设置打印结束区域  
            prnhtml = bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html  

            prnhtmlprnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));//从结束代码向前取html  
            document.getElementById("divContent").innerHTML = prnhtml;
            window.print();
            document.getElementById("divContent").innerHTML = bdhtml;
        } else {
            window.print();
        }
    }
    //跳转到指定位置
    function GotoAnchor(pos) {
        var url = location.href;
        if (url.indexOf("#mao_") > 0) {
            url = url.substring(0, url.lastIndexOf('_') + 1);
            url = url + pos;
        }
        else {
            url = url + "&#mao_" + pos;
        }
        location.href = url;
    }
    //特殊文本的验证
    function IsLegalValue(id, type) {
        var value = document.getElementById("txt_" + id).value;
        switch (type) {
            case 0:
                vflag = CheckEmail(value);
                break;
            case 1:
                vflag = CheckMobile(value);
                break;
            case 2:
                vflag = CheckPhone(value);
                break;
            case 3:
                vflag = CheckIdCard(value);
                break;
            case 4:
                vflag = CheckSchCard(value);
                break;
        }
        if (vflag == false) {
            document.getElementById("span_" + id).style.display = '';
            //document.getElementById("txt_" + id).focus(); 
            // document.getElementById("txt_" + id).select();
        }
        else
            document.getElementById("span_" + id).style.display = 'none';
    }
    function ShowflaUp(id)
    {
        if (document.getElementById("viewid_" + id).style.display != 'none')
            document.getElementById("viewid_" + id).style.display = 'none';
        else document.getElementById("viewid_" + id).style.display = '';
    }
</script>  
<style>
.flaUpload { position:absolute;width:415px;height:250px; background:#fafafa;}
.flaUpload span{display:block;width:100%;height:20px;text-align:right;font-size:20px; }
.flaUpload a { color:#f00;}
</style>
</head>
<body style=" background:none;">
<form id="form1" runat="server">
<div id="Votetop">
<strong>网上报名与查询系统 </strong>
</div>
<div id="VoteMain">
<div id="VoteL">
<ul>
<li><a href="/Plugins/UserVote.aspx?SID=1">考试报名信息</a></li> 
<li><a href="/Plugins/VoteManage.aspx?SID=1">状态查询</a></li> 
<li><a href="/User/logout.aspx">退出</a></li>   
</ul>  
<div class="voteL_t"><strong>联系方式</strong></div> 
招生热线:<br />
 0393-4677777、4677100<br />
 E-mail:mxp@vip.163.com<br />
传真: 0393-4677222 
</div>
<div id="VoteR">
 <div id="Notice" runat="server">   
    <strong>通知   </strong> <br /> 
 欢迎使用濮阳招生网网上报名与查询系统！
 </div> 

<div id="divContent" runat="server">   
<font color="red">  目前尚未被任何院校录取，高考分数文理科在150分以上的考生，均可在线报名参加补录,专科补录征集志愿的时间是9月25日8点至26日18点,咨询电话：03934677777。</font>
<div class="disno"><strong><asp:Literal ID="ltlSurveyName" runat="server" Text="Label"></asp:Literal> </strong> (<asp:Literal ID="ltlDate" runat="server"></asp:Literal>) </div>
<div class="desp">
<p>
<asp:Literal ID="ltlDesp" runat="server" Text="Label"></asp:Literal>
</p>
</div>
<ul>
<asp:Literal ID="ltlResultHtml" runat="server"></asp:Literal>
</ul>

<div  id="regVcodeRegister" runat="server" visible="false">
<table width='100%' align='center' class='border votetab'>
    <tr><th width="18%" align="left">验证码：</th><td><div class="reg_put">
<asp:TextBox ID="SendVcode" MaxLength="6" runat="server" Style="width: 60px; border: #CCC solid 1px;"
    CssClass="input_out" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};"
    onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" ></asp:TextBox>
<asp:Image ID="Image1" runat="server" ImageUrl="~/Common/ValidateCode.aspx" Height="20px"
    ToolTip="点击刷新验证码" Style="cursor: pointer; border: 0; vertical-align: middle;"
    onclick="this.src='/Common/ValidateCode.aspx?t='+Math.random()" />
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SendVcode"
    Display="Dynamic" ErrorMessage="验证码不能为空!"></asp:RequiredFieldValidator>
<asp:Label ID="Validateinfo" runat="server" Text=""></asp:Label>
</div> </td></tr>
 </table> 
</div>
<asp:Button ID="btnEdit" runat="server" Text="编 辑" CssClass="btn" OnClick="btnEdit_Click" />&nbsp;
<asp:Button ID="btnSubmit" runat="server" Text="打印提交" CssClass="btn" OnClick="btnSubmit_Click" OnClientClick="return CheckAns();" />&nbsp; 
<asp:Button ID="Button2" runat="server" Text="保 存" OnClick="Button2_Click" CssClass="btn" />&nbsp;
<asp:Button ID="btnExport" runat="server" Text="导 出" CssClass="btn" OnClick="btnExport_Click" />
</div>
</div>  
<asp:HiddenField ID="HdnRID" runat="server" />
<asp:HiddenField ID="HdnSID" runat="server" />
</form>
     
</body>
</html>
