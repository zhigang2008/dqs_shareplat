<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<title>台站信息</title>
</head>

<body>
<!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>台站 -> 查看</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<div class="showdetail"> 
	<s:form action="/biz/Station/list.do" method="post" theme="simple">
		<div id="controlbuttons" class="buttons">
               <button type="button" class="regular" name="backlist" onclick="window.location='${ctx}/biz/Station/list.do'" >
                 <img src="<c:url value="/image/form/grid.gif"/>" alt="" /> 返回列表
               </button> 
               <button type="button" class="regular" name="backpage" onclick="history.back();">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 后退
               </button> 
        </div>
        <div class="cl"></div>
        <div id="formdiv" >
        <p>详细内容:</p>
		   <s:hidden name="id" id="id" value="%{model.id}"/>
		<table id="formtable" class="formtable">
			<tr>	
				<td class="tdlabel">地区: </td>	
				<td><s:property value="%{model.regionCode}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">编号: </td>	
				<td><s:property value="%{model.code}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">名称: </td>	
				<td><s:property value="%{model.name}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">经度: </td>	
				<td><s:property value="%{model.longitude}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">纬度: </td>	
				<td><s:property value="%{model.latitude}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">海拔: </td>	
				<td><s:property value="%{model.hight}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">位置: </td>	
				<td><s:property value="%{model.unit}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">钻孔类型: </td>	
				<td><s:property value="%{model.wellTypeCode}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">钻孔深度: </td>	
				<td><s:property value="%{model.wellDepth}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">观测深度: </td>	
				<td><s:property value="%{model.observateDepth}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">岩性: </td>	
				<td><s:property value="%{model.lithology}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">温度: </td>	
				<td><s:property value="%{model.temperature}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">观测时间: </td>	
				<td><s:property value="%{model.observateTime}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">台站类型: </td>	
				<td><s:property value="%{model.stationTypeCode}" /></td>
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
