<%@page import="com.steven.cms.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<title>${model.title}</title>
</head>

<body>
<!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>正文</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div class="cl"></div>
	<div id="content" class="cl wrapper">
	<div class="cl-body" style="min-height:400px;"> 
        <div class="w96" >
        <h1>${model.title}</h1>
        <div class="msgbar">
                              发布时间：<s:property value="%{model.releaseDateString}" /> &nbsp; 作者：<s:property value="%{model.author}" /> &nbsp; 浏览次数：<s:property value="%{model.hitCount}" />
        </div>
        <div class="summary"><strong>摘要：</strong><s:property value="%{model.description}" /> </div>
        <div class="content-txt">
        <s:property value="%{model.contentTxt.txt}" escapeHtml="false"/>
        </div>
		<s:hidden name="id" id="id" value="%{model.id}"/>
	</div>
	</div>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>
