<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <div id="addOrEditWin">
    <form id="form1"  method="post" action="">
        <input id="actorId" type="hidden" name="actor.actorId" value=""/>
	    <table align="center" class="addOrEditTable" width="600px;">
		    <tr>
		      <td align="right" width="150px">角色名称:&nbsp;&nbsp;</td>
		      <td  align="left" width="440px">&nbsp;&nbsp;<input id="actorName" type="text" name="actor.actorName" class="{validate:{required:true,maxlength:[60]}}"/></td>
		    </tr>
	    </table>
	   <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0;">
			<input type="submit" id="save" class="button_save"  value=""/>&nbsp;
			<input type="button" id="close" class="button_close" onclick="closeWin()" value=""/>&nbsp;
	   </div>
	</form>
  </div>
