<%@page import="com.steven.cms.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<title>内容管理信息</title>
</head>

<body>
<!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>内容管理 -> 查看</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<div class="showdetail"> 
	<s:form action="/cms/CmsContent/list.do" method="post" theme="simple">
		<div id="controlbuttons" class="buttons">
               <button type="button" class="regular" name="backlist" onclick="window.location='${ctx}/cms/CmsContent/list.do'" >
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
				<td class="tdlabel">标识名称: </td>	
				<td><s:property value="%{model.uname}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">所属栏目: </td>	
				<td><s:property value="%{model.channelId}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">标题: </td>	
				<td><s:property value="%{model.title}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">简述: </td>	
				<td><s:property value="%{model.description}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">作者: </td>	
				<td><s:property value="%{model.author}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">发布日期: </td>	
				<td><s:property value="%{model.releaseDateString}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">类型: </td>	
				<td><s:property value="%{model.typeId}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">点击数: </td>	
				<td><s:property value="%{model.hitCount}" /></td>
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
