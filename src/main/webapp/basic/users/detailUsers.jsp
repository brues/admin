<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="detailWin">
    <table align="center" class="addOrEditTable" width="400px">
	    <tr>
	      <td align="right" width="150px">用户名称:</td><td align="left">&nbsp;&nbsp;<span id="duserName"></span></td>
	    </tr>
	    <tr>
	      <td align="right" width="150px">密码:</td><td align="left">&nbsp;&nbsp;<span id="dpassword"></span></td>
	    </tr>
	    <tr>
	      <td align="right" width="150px">真实姓名:</td><td align="left">&nbsp;&nbsp;<span id="dtrueName"></span></td>
	    </tr>
	    <tr>
	      <td align="right" width="150px">电子邮件:</td><td  align="left">&nbsp;&nbsp;<span id="demail"></span></td>
	    </tr>
	    <tr>
	      <td align="right" width="150px">手机号码:</td><td  align="left">&nbsp;&nbsp;<span id="dphone"></span></td>
	    </tr>
	    <tr>
	      <td align="right" width="150px">备注:</td><td  align="left">&nbsp;&nbsp;<span id="dcomments"></span></td>
	    </tr>
	    <tr>
	      <td align="right" width="150px">注册日期:</td><td  align="left">&nbsp;&nbsp;<span id="dregisterDate"></span></td>
	    </tr>
   </table>
   <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0;">
	 <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:closeWin()">取消</a>
	</div>
 </div>