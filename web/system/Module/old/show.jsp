<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<title>Module信息</title>
</head>

<body>
<!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>Module -> 编辑</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<div class="showdetail"> 
	<s:form action="/system/Module/list.do" method="post" theme="simple">
		<div id="controlbuttons" class="buttons">
               <button type="button" class="regular" name="backlist" onclick="window.location='${ctx}/system/Module/list.do'" >
                 <img src="<c:url value="/image/form/grid.gif"/>" alt="" /> 返回列表
               </button> 
               <button type="button" class="regular" name="backpage" onclick="history.back();">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 后退
               </button> 
        </div>
        <div class="cl"></div>
        <div id="formdiv" >
        <p>详细内容:</p>
		   <s:hidden name="moduleId" id="moduleId" value="%{model.moduleId}"/>
		<table id="formtable" class="formtable">
			<tr>	
				<td class="tdlabel">模块名称: </td>	
				<td><s:property value="%{model.moduleName}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">模块地址: </td>	
				<td><s:property value="%{model.url}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">上级模块: </td>	
				<td><s:property value="%{model.parent}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">状态: </td>	
				<td><s:property value="%{model.status}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">描述: </td>	
				<td><s:property value="%{model.description}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">排序字段: </td>	
				<td><s:property value="%{model.sortOrder}" /></td>
			</tr>
		</table>
		</div>
	</s:form>
	</div>
	</div> <!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>
