<%@ page language="C#" autoeventwireup="true" inherits="MIS_header, App_Web_kgyeb_n0" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>头部</title>
</head>
<body>
<div id="M_top" style=" position:relative;">
<div class="M_top_t"><div id="Mlogo"><%--<img src="" alt="" />--%> <%Call.Label("{$SiteName/}"); %>  </div>
<div class="M_top_r_t"><a href="/manage/login.aspx" traget="_blank">系统管理</a>
<a href="#">购买帮助</a>
<a href="/user/logout.aspx?url=/Mis/">退出</a>
</div> 
</div> 

<div style="">
<div id="M_top_r"> 
<div class="M_top_r_b">
<ul>
<li><a href="/Mis/" id="hd" ><img src="/App_Themes/UserThem/images/Mis/j_ico_home.fw.png" alt="面板" /><br />面板</a></li>
<li><a href="/user/Usertalk/TalkIndex.aspx" id="hd0" ><img src="/App_Themes/UserThem/images/Mis/j_ico_comm.png" alt="沟通" /><br />沟通</a></li>
<li><a href="/Mis/Target/"  id="hd1"><img src="/App_Themes/UserThem/images/Mis/j_ico_pline.png" alt="目标" /><br />目标</a></li>
<li><a href="/Mis/Daily/" id="hd2"><img src="/App_Themes/UserThem/images/Mis/j_ico_log.png" alt="日志" /><br />日志</a></li>
<li><a href="/Mis/Memo/" id="hd3"><img src="/App_Themes/UserThem/images/Mis/j_ico_memo.png" alt="备忘" /><br />备忘</a></li>
<li><a href="/Mis/Plan/" id="hd4"><img src="/App_Themes/UserThem/images/Mis/j_ico_plan.png" alt="计划" /><br />计划</a></li>
<li><a href="/Mis/Task/" id="hd5"><img src="/App_Themes/UserThem/images/Mis/j_ico_task.png" alt="任务" /><br />任务</a></li>
<li><a href="/Mis/Project/" id="hd6"><img src="/App_Themes/UserThem/images/Mis/j_ico_project.png" alt="项目" /><br />项目</a></li>
<li><a href="/Mis/Approval/" id="hd7"><img src="/App_Themes/UserThem/images/Mis/j_ico_approve.png" alt="审批" /><br />审批</a></li>
<li><a href="/Mis/Mail/" id="hd8"><img src="/App_Themes/UserThem/images/Mis/j_ico_email.png" alt="邮件" /><br />邮件</a></li>
<li><a href="javascript:void(0)" onClick="showd('t_pop_navli')"><img src="/App_Themes/UserThem/images/Mis/j_ico_more.png" alt="更多" /><br />更多</a></li>
</ul>
</div> 
    
<div class="t_pop_navli" id="t_pop_navli" style="display:none;"> 
<div class="bgt"></div>
<div class="bgm">
<ul> 
<li class="j_ico_docu"><a  href="javascript:void(0)" onClick="loadPage('Meno', '/Mis/File/')"  ><img src="/App_Themes/UserThem/images/Mis/j_ico_docu.png" alt="文档" /><br />文档</a></li>
<li class="j_ico_know"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_konw.png" alt="知识" /><br />知识</a></li>
<li class="j_ico_discuss"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_discuss.png" alt="讨论" /><br />讨论</a></li>
<li class="j_ico_attent"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_attent.png" alt="关注" /><br />关注</a></li>
<li class="j_ico_attend"><a href="/Mis/MisAttendance.aspx"><img src="/App_Themes/UserThem/images/Mis/j_ico_attend.png" alt="考勤" /><br />考勤</a></li>
<li class="j_ico_twitter"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_twitter.png" alt="微博" /><br />微博</a></li> 
<li class="j_ico_bbs"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_bbs.png" alt="论坛" /><br />论坛</a></li> 
<li class="j_ico_notice"><a href="javascript:void(0)" onClick="loadPage('Meno', '/Class_76/NodePage.aspx')"><img src="/App_Themes/UserThem/images/Mis/j_ico_notice.png" alt="公告" /><br />公告</a></li> 
<li class="j_ico_address"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_address.png" alt="通讯录" /><br />通讯录</a></li> 
<!--<li class="j_ico_exprience"><a href="">工作历程</a></li> -->
<li class="j_ico_sysremd"><a href="javascript:void(0)" onClick="loadPage('Meno', '/user/Message/Message.aspx')"><img src="/App_Themes/UserThem/images/Mis/j_ico_sysremd.png" alt="系统提醒" /><br />系统提醒</a></li> 
<li class="j_ico_relacomp"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_relacomp.png" alt="日志" /><br />友好企业</a></li> 
<li class="j_ico_online"><a href="javascript:window.open('/OnlineService/ShowForm.aspx','','width=640,height=550,top=200,left=300,resizable=yes');void(0);"><img src="/App_Themes/UserThem/images/Mis/j_ico_online.png" alt="在线客服" /><br />在线客服</a></li>   
<li class="j_ico_site"><a href="/manage/Template/CloudLead.aspx" target="_Blank"><img src="/App_Themes/UserThem/images/Mis/j_ico_site.png" alt="建站通" /><br />建站通</a></li> 
<li class="j_ico_cloud"><a  href="javascript:void(0)" onClick="loadPage('Meno', '/Class_105/NodePage.aspx')"  ><img src="/App_Themes/UserThem/images/Mis/j_ico_cloud.png" alt="云盘" /><br />云盘</a></li>  

</ul><div style="clear:both;display:block;"> </div>
</div>
<div class="bgb"></div>
</div>  
<div class="clear"></div>
</div>
</div>
</div>
<script>
function showd(obj) {
    var dr = document.getElementById(obj).style.display;
    if (dr == "none") {
        document.getElementById(obj).style.display = "block";
    }
    else {
        document.getElementById(obj).style.display = "none";
    }
}
var a = "<%=Request["hid"]%>"; 
document.getElementById("hd" + a).className = "HidName";
</script>
</body>
</html>
