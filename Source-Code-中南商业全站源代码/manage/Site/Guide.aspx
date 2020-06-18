<%@ page language="C#" autoeventwireup="true" inherits="manage_Site_Guide, App_Web_rhqdlbvz" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>站群引导-<%Call.Label("{$SiteName/}");%></title>
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/main.css" />
<script type="text/javascript" src="../../JS/jquery.js"></script>
<script type="text/javascript" src="../../js/site.js" charset="utf-8"></script>
<script type="text/javascript" src="../../js/sitebg.js" ></script>
<script type="text/javascript" >
    var jq = jQuery.noConflict()
    var liks = ['about', 'cool', 'carnival']
    var aboutNumT = 0, aboutNumL = 0
    var contNumT = 0, contNumL = 0
    var wanzNumL = 0, wanzNumT = 0
    var HomeFun = function (a) {
        return b = a == 0 ? HomeAbout : a == 1 ? HomeCont : HomeWanZ
    }
    var HomeAbout = function () {
        aboutNumL++
        if (aboutNumL > 9) {
            aboutNumT++
            if (aboutNumT > 9) {
                aboutNumT = 0
            }
            aboutNumL = 0
        }
        jq('.t0').css({ 'background-position': -aboutNumL * 210 + 'px ' + -aboutNumT * 210 + 'px' })
    }
    var HomeCont = function () {
        contNumL++
        if (contNumL > 9) {
            contNumT++
            if (contNumT > 9) {
                contNumT = 0
            }
            contNumL = 0
        }
        jq('.t1').css({ 'background-position': -contNumL * 210 + 'px ' + -contNumT * 210 + 'px' })
    }
    var HomeWanZ = function () {
        wanzNumL++
        if (wanzNumL > 9) {
            wanzNumT++
            if (wanzNumT > 9) {
                wanzNumT = 0
            }
            wanzNumL = 0
        }
        jq('.t2').css({ 'background-position': -wanzNumL * 210 + 'px ' + -wanzNumT * 210 + 'px' })
    }
    jq(document).ready(function () {
        for (var i = 0; i < jq('.main-index-dow li').length; i++) {
            //jq('.do'+i).delay(500).animate({marginLeft:100})
            TweenMax.from(jq('.do' + i), .5, { delay: .2 * i + 1, css: { opacity: 0 } })
        }

        jq('.logo').bind('click', function (e) {

        })
        for (var i = 0; i < jq('#J-Nav li').length; i++) {
            jq('.n' + i).css({ 'cursor': 'pointer' })
            jq('.n' + i).bind('click', function (e) {
                var id = jq(this).attr('class').replace('n', '')
                if (id == 2)
                    location.href = '#'
                else
                    location.href = '#'
            })
            jq('.t' + i).bind('click', function (e) {
                var id = jq(this).attr('class').replace('t', '')
                clearInterval(timer)
                if (id == 2)
                    location.href = '#'
                else
                    location.href = '#'
            })
            jq('.t' + i).bind('mouseover', function (e) {
                tid = Number(jq(this).attr('class').replace('t', ''))
                timer = setInterval(HomeFun(tid), 1000 / 24)
            })
            jq('.t' + i).bind('mouseout', function (e) {
                clearInterval(timer)
            })
        }
    })
</script> 
</head>
<body class="site_bg">
<div class="site_main"> 
 <div id="J-Bg" class="bg"></div> <div class="main-body" > <div class="main-index-nav" id='J-Nav'> <ul >
  <li id='Nav0'><span class="t0" seed="abc_home_about"></span></li> <li id='Nav1'><span class="t1" seed="abc_home_basic"></span></li> 
  <li id='Nav2'><span class="t2" seed="abc_home_cool" onclick="location='siteConfig.aspx';"></span></li> </ul> </div> 
  <div class="main-index" id="J-Main">
   <div class="main-index-nav-name"> <ul> 
  <li class='n0' seed="abc_home_about_txt">
<a href="#" title="了解站群">了解站群</a> 
   </li> 
  <li class='n1' seed="abc_home_basic_txt">
  <a href="#">快速入门</a>
  </li>
   <li class='n2' seed="abc_home_cool_txt";">
    <a href="siteConfig.aspx">配置启动</a></li> </ul> </div> 
 
   </div> 
    <div class="clear"></div>
   <div class="site_bg1">
    <input type="checkbox" style="position:relative;top:3px;" onclick="if(this.checked)location='../default.aspx'"><label> 我不要站群回归个人网站管理</label>
</div>
    </div> 
    </div> 
</body>
</html>

