<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <title>选择权限</title>
  <base target="_self"></base>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <jsp:include page="../../util/import.jsp"/>
  <link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/dtree/css/dtree.css"/>
  <script type="text/javascript" src="${pageContext.request.contextPath}/dtree/js/dtree_actorPurview.js"></script>
  <script type="text/javascript">
    function save(){
<%--		var purviewIds="";--%>
<%--		$("input:checked").each(function(){--%>
<%--			purviewIds+=$(this).val()+",";--%>
<%--		});--%>
<%--		 $("#purviewIds").val(purviewIds.substring(0,purviewIds.length-1));--%>
		 $("#form1").submit();
		 location.reload();
	   window.close(); 
	}
  </script>
  </head>
  <body>
  	<form action="${pageContext.request.contextPath}/actorPurview/saveActorPurview.action" method="post" name="form1" id="form1">
  		<input type="hidden" name="actorPurview.actorId" value="<s:property value="actorId"/>"/>
  		<input id="purviewIds" type="hidden" name="purviewIds" />
	 	<div class="dtree">
			<script type="text/javascript">
				d = new dTree('d');	
				<s:iterator value="purviewList" var="purview">
			 		d.add(<s:property value="#purview.purviewId"/>,<s:property value="#purview.parentId"/>,'<s:property value="#purview.purviewName"/>','');
			 	</s:iterator>
				document.write(d);
				<s:iterator value="#request.actorPurviewList" var="actorPurview">
					$("#pu_"+<s:property value="#actorPurview.purviewId"/>).attr("checked","true");
				</s:iterator>
			</script>
			<input type="button" value="提交数据" onclick="save();"/>
		</div>
	</form>
  </body>
</html>
