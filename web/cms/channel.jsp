<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>${channel.moduleName}</title>
<%@ include file="/commons/meta.jsp" %>
<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
			//搜索栏收起
			$("#toggle-bar").click(function(oEvent) {
				$("#param-div").toggle("slow");
				$(this).toggleClass("toggle-up");
			});
		});
	</script>
</head>

<body>
    <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>${channel.moduleName}</h1>
		</div>
	</div>
	<!-- End of Page title -->
    <div class="cl" ></div>
	<div id="content" class="wrapper">
	<form id="queryForm" name="queryForm" action="<c:url value="/cms/channel/${channelId}.do"/>" method="post" style="display: inline;">
	<div>
<div class="cl-body">
<c:choose>
	<c:when test="${fn:length(page.result)>0}">
		<c:forEach items="${page.result}" var="item" varStatus="status">
			<div class="c1-bline">
			<div class="f-left">
			<img class="img-vm" border="0" align="middle" src="<c:url value="/image/layout/head-mark4.gif"/>"></img>
			<a target="_blank" title="${item.description}" href="<c:url value="/cms/content/${item.uname}.do"/>"><wylb:textCut length="60">${item.title}</wylb:textCut> </a>
			</div>
			<div class="f_right">${item.releaseDateString}</div>
			<div class="cl"></div>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
	本栏目暂无内容.
	</c:otherwise>
</c:choose>
</div>
<simpletable:pageToolbar page="${page}"></simpletable:pageToolbar>
	</div>
	</form>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>

