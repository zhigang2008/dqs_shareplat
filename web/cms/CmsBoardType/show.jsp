<%@page import="com.steven.cms.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<title>留言类型信息</title>
</head>

<body>
<!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>留言类型 -> 查看</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<div class="showdetail"> 
	<s:form action="/cms/CmsBoardType/list.do" method="post" theme="simple">
		<div id="controlbuttons" class="buttons">
               <button type="button" class="regular" name="backlist" onclick="window.location='${ctx}/cms/CmsBoardType/list.do'" >
                 <img src="<c:url value="/image/form/grid.gif"/>" alt="" /> 返回列表
               </button> 
               <button type="button" class="regular" name="backpage" onclick="history.back();">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 后退
               </button> 
        </div>
        <div class="cl"></div>
        <div id="formdiv" >
        <p>详细内容:</p>
		   <s:hidden name="code" id="code" value="%{model.code}"/>
		<table id="formtable" class="formtable">
			<tr>	
				<td class="tdlabel">类型描述: </td>	
				<td><s:property value="%{model.name}" /></td>
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
