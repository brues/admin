<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
  <div id="addOrEditWin">
    <form id="form1"  method="post" action="">
        <input id="usersId" type="hidden" name="users.usersId" value=""/>
        <input id="registerDate" type="hidden" name="users.registerDate" value=""/>
	    <table align="center" class="addOrEditTable" width="600px;">
		    <tr>
		      <td align="right" width="150px">用户名称:&nbsp;&nbsp;</td>
		      <td  align="left" width="440px">&nbsp;&nbsp;<input id="userName" type="text" name="users.userName" class="{validate:{required:true,maxlength:[20]}}"/></td>
		    </tr>
		    <tr>
		      <td align="right" width="150px">密码:&nbsp;&nbsp;</td>
		      <td  align="left">&nbsp;&nbsp;<input id="password" type="text" name="users.password" class="{validate:{required:true,maxlength:[20]}}"/></td>
		    </tr>
		    <tr>
		      <td align="right" width="150px">真实姓名:&nbsp;&nbsp;</td>
		      <td align="left">&nbsp;&nbsp;<input id="trueName" type="text" name="users.trueName" class="{validate:{required:true,maxlength:[20]}}"/></td>
		    </tr>
		    <tr>
		      <td align="right" width="150px">电子邮件:&nbsp;&nbsp;</td>
		      <td align="left">&nbsp;&nbsp;<input id="email" type="text" name="users.email" class="{validate:{required:true,email:true}}"/></td>
		    </tr>
		    <tr>
		      <td align="right" width="150px">手机号码:&nbsp;&nbsp;</td>
		      <td align="left">&nbsp;&nbsp;<input id="phone" type="text" name="users.phone" class="{validate:{required:true,mobile:true}}"/></td>
		    </tr>
		    <tr>
		      <td align="right" width="150px">备注:&nbsp;&nbsp;</td>
		      <td align="left">&nbsp;&nbsp;<input id="comments" type="text" name="users.comments" class="{validate:{required:true,maxlength:[60]}}"/></td>
		    </tr>
	    </table>
	   <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0;">
			<input type="submit" id="save" class="button_save"  value=""/>&nbsp;
			<input type="button" id="close" class="button_close" onclick="closeWin()" value=""/>&nbsp;
	   </div>
	</form>
  </div>
