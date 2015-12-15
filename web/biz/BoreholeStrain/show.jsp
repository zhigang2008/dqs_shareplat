<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<title>钻孔应变数据信息</title>
</head>

<body>
<!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>钻孔应变数据 -> 查看</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<div class="showdetail"> 
	<s:form action="/biz/BoreholeStrain/list.do" method="post" theme="simple">
		<div id="controlbuttons" class="buttons">
               <button type="button" class="regular" name="backlist" onclick="window.location='${ctx}/biz/BoreholeStrain/list.do'" >
                 <img src="<c:url value="/image/form/grid.gif"/>" alt="" /> 返回列表
               </button> 
               <button type="button" class="regular" name="backpage" onclick="history.back();">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 后退
               </button> 
        </div>
        <div class="cl"></div>
        <div id="formdiv" >
        <p>详细内容:</p>
		   <s:hidden name="observeTime" id="observeTime" value="%{model.observeTime}"/>
		<table id="formtable" class="formtable">
			<tr>	
				<td class="tdlabel">台站编号: </td>	
				<td><s:property value="%{model.stationId}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">观测值: </td>	
				<td><s:property value="%{model.observeValue}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">年度: </td>	
				<td><s:property value="%{model.colYear}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">数据表名: </td>	
				<td><s:property value="%{model.tableName}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">数据字段名: </td>	
				<td><s:property value="%{model.columnName}" /></td>
			</tr>
		</table>
		</div>
	</s:form>
	</div>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>
