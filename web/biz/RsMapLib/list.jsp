<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>遥感图件库 维护</title>
<%@ include file="/commons/meta.jsp" %>
<link href="<c:url value="/style/bootstrap.min.css"/>" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<c:url value="/script/bootstrap.min.js"/>"></script>
</head>

<body>
    <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>遥感图件库</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	    <wylb:hasPermission name="RsMapLib:create">
	      <p class="text-right"><a class="btn btn-success" href="${ctx}/biz/RsMapLib/create.do" role="button">新增图件库</a></p>
		</wylb:hasPermission>
		<table  class="table table-bordered">
		  <thead>
			  <tr>
				<th>序号</th>
				<th>图库名称</th>
				<th>说明文件</th>
				<th>图件数量</th>
				<th>创建时间</th>
				<th>备注</th>
				<th>操作</th>
			  </tr>
		  </thead>
		  <tbody>
		      <c:choose>
		       <c:when test="${fn:length(page.result)>0}">
		  	   <c:forEach items="${page.result}" var="item" varStatus="status">
			   <tr>
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><a href="${ctx}/biz/RsMaps/list.do?libId=${item.seqno}" title="浏览该库下所有图件"><c:out value='${item.mapLibName}'/></a></td>
				<td><a href="${ctx}/support/download.do?fileCatalog=遥感图库-${item.mapLibName}&fileName=${item.descFileName}&filePath=${item.descFileLocation}"><c:out value='${item.descFileName}'/>&nbsp;</a></td>
				<td><c:out value='${item.mapCount}'/>&nbsp;</td>
				<td><c:out value='${item.createTimeString}'/>&nbsp;</td>
				<td><c:out value='${item.remark}'/>&nbsp;</td>
				<td>
				    <a href="${ctx}/biz/RsMaps/list.do?libId=${item.seqno}" class="glyphicon glyphicon-list-alt" title="浏览图件"></a>
				    &nbsp;
					<wylb:hasPermission name="RsMapLib:edit">
					<a href="${ctx}/biz/RsMapLib/edit.do?seqno=${item.seqno}&" class="glyphicon glyphicon-edit" title="编辑图件库" ></a>
					</wylb:hasPermission>
					&nbsp;
					<c:if test="${item.mapCount==0}">
					 <wylb:hasPermission name="RsMapLib:delete">
					  <a href="${ctx}/biz/RsMapLib/deleteById.do?seqno=${item.seqno}&" class="glyphicon glyphicon-trash" title="删除图件库" ></a>
					  </wylb:hasPermission>
					</c:if>
				</td>
			  </tr>
		  	  </c:forEach>
		  	  </c:when>
		  	  <c:otherwise>
		  	  <!-- 空表格 -->
		  	  <c:forEach var="nullitem" begin="1" end="4" step="1"  varStatus="nullstatus">
		  	   <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			  </tr>
		  	  </c:forEach>
		  	  </c:otherwise>
		  	  </c:choose>
		  </tbody>
		</table>
	</div>

	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>

