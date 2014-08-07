<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
 <div id="addOrEditWin" >
    <form id="form1"  method="post" action="">
        <input id="parentId" type="hidden" name="purview.parentId" value=""/>
        <input id="purviewId" type="hidden" name="purview.purviewId" value=""/>
	    <table align="center" class="addOrEditTable" width="600px;">
		    <tr>
		      <td align="right" width="150px">权限名称:&nbsp;&nbsp;</td>
		      <td  align="left">&nbsp;&nbsp;<input id="purviewName" type="text" name="purview.purviewName" value="" class="{validate:{required:true,maxlength:[50]}}"/></td>
		    </tr>
		    <tr>
		      <td align="right" width="150px">权限路径:&nbsp;&nbsp;</td>
		      <td align="left">&nbsp;&nbsp;<input id="url" type="text" name="purview.url" value="" class="{validate:{required:true,maxlength:[200]}}"/></td>
		    </tr>
	    </table>
	     <div region="south" border="false" style="margin-top: 10px; text-align: center; height: 30px; line-height: 30px;">
			<a id="btnSubmit" type="submit" class="easyui-linkbutton" icon="icon-ok" href="javascript:tijiao()">确定</a>
			<a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:closeWin()">取消</a>
		</div>
	</form>
 </div>
