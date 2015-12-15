<%@page import="com.dqs.office.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<title>浏览</title>
</head>
<body>
<div id="page">
<div class="wrapper">
        <div id="formdiv" >
        <h3>[<s:property value="%{model.publishInformationType.typeName}" />] : <s:property value="%{model.title}" /></h3>
		<hr />
		<table id="formtable" class="formtable" width="60%">
			<tr>	
				<td align="right">作者: </td>	
				<td align="left"><s:property value="%{model.author}" /></td>
				<td align="right">部门: </td>	
				<td align="left"><s:property value="%{model.department}" /></td>
				<td align="right">发布时间: </td>	
				<td align="left"><s:property value="%{model.publishTimeString}" /></td>
				<td align="right">点击量: </td>	
				<td align="left"><s:property value="%{model.viewHits}" /></td>
			</tr>
		</table>
		<hr/>
		<div>
		 <s:property value="%{model.content}"  escape="false"/>
	    </div>
		</div>
		</div>
		</div>
</body>
</html>
