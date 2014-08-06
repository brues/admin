<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/zxxx/back/css/style.css" />
</head>

<body>
	<div id="header">
		<div class="logo">
			<img src="${pageContext.request.contextPath}/common/zxxx/back/images/ht_logo.jpg" />
		</div>
		<div class="center">
			<img src="${pageContext.request.contextPath}/common/zxxx/back/images/ht_top.jpg" />
		</div>
		<div class="font">
			<img src="${pageContext.request.contextPath}/common/zxxx/back/images/ht_font.jpg" />
		</div>
	</div>
	<div id="mainbody">
		<form id="loginForm" action="${pageContext.request.contextPath}/backLogin/userLogin.action" method="post">
			<table width="438" border="0" class="table"
				style="margin-top:166px;margin-left:266px;">
				<tr>
					<td width="53" style="font-size:16px;color:#2273E9;font-size:16px; font-family:'微软雅黑', '黑体'">用户名</td>
					<td height="50" colspan="2" valign="middle">
					<label for="textfield"></label> 
						<input type="text" name="userName" id="textfield"  class="ht_text1" />
					</td>
				</tr>
				<tr>
					<td style="font-size:16px;color:#2273E9;font-family:'微软雅黑','黑体';">密码</td>
					<td height="50" colspan="2" valign="middle">
					<label for="textfield2"></label> 
						<input type="password" name="password" id="textfield2"  class="ht_text1" />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td width="259" height="35" valign="middle">
						<input type="checkbox" name="checkbox" id="checkbox" />
							<label for="checkbox" style="color:#2273E9; font-size:14px;">记住密码&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="checkbox2" id="checkbox2" /> 自动登录 </label>
					</td>
					<td width="112" height="35" valign="middle">&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<input type="submit" name="button" id="button" value="" class="anniu1" />
					</td>
					<td>
						<input type="submit" name="button2" id="button2" value="" class="anniu2" />
					</td>
				</tr>
			</table>
		</form>

	</div>
	<div id="footer">
		<p>Copyright © 2013-2033 安彼教育 版权所有</p>
	</div>
</body>
</html>
