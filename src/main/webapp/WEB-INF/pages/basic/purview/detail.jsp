<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="detailWin">
    <table align="center" class="addOrEditTable" width="400px">
    <tr>
      <td align="right" width="150px">权限名称:</td><td  align="left">&nbsp;&nbsp;<span id="dpurviewName"></span></td>
    </tr>
    <tr>
      <td align="right" width="150px">权限路径:</td><td  align="left">&nbsp;&nbsp;<span id="durl"></span></td>
    </tr>
   </table>
	<div style="text-align:center;padding:5px 0;">
		<input type="button" id="close" class="button_close" onclick="closeWin()"/>&nbsp;
	</div>
 </div>  
