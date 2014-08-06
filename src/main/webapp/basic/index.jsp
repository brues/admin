<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>安彼教育后台管理系统</title>
<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/zxxx/css/style.css"/>
</head>
<body style="background-color: white;">
	<div id="header" style="background-color: white;">
		<div class="header_bg">
			<div class="header_left"><a href="${pageContext.request.contextPath}">
				<img src="${pageContext.request.contextPath}/common/zxxx/front/index/image/anbilogo.jpg" style="float:left;position: relative;left: -35px;top:-10px;height: 110%;"/>
				<img src="${pageContext.request.contextPath}/common/zxxx/images/pic1.jpg" style="float:left;margin-top:25px;"/>
			</a></div>
			<div class="header_right">
				<p class="p1">是独立开发</p>
				<p class="p2">${users.userName}</p>
				<p class="p3"><a href="${pageContext.request.contextPath}/users/userExit.action">退出 </a></p>
			</div>
		</div>
	</div>
	<div id="mainbody" style="">
		<div class="mainbody_left">
			<ul class="main_ul">
				<td width="260" id=frmTitle noWrap name="fmTitle" align="center" valign="top">
					<iframe name="leftFrame" height="100%" width="210" src="${pageContext.request.contextPath}/backLogin/leftPage.action" border="0" frameborder="0" scrolling="no"></iframe>
	    		</td>
			</ul>
		</div>
		<div class="mainbody_right">
			<td valign="top">
		    	<iframe style="background-color: white;"  name="mainFrame" height="570px";  width="100%" border="0" frameborder="0"  ></iframe>
		    </td>
		</div>
	</div>
	<div id="footer">
		Copyright: emoji: 2013-2033 www.9anbi.com   All Rights Reserved 京ICP备09032638号 京公网安备:1101082103 
	</div>
</body>
</html>
