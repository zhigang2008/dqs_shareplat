<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>遥感图件信息 维护</title>
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
			<h1><a href="<c:url value="/biz/RsMapLib/list.do"/>">遥感图件库</a>-${rsMapLib.mapLibName }</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<form id="queryForm" name="queryForm" action="<c:url value="/biz/RsMaps/list.do"/>" method="post" style="display: inline;">
	<input type="hidden" value="${query.libId}" id="libId" name="libId" />
	<div class="queryPanel">
		<fieldset>
			<legend><span id="toggle-bar" class="toggle-down">&nbsp;</span><span>搜索</span></legend>
			<div id="param-div" class="param-div" >
			<table>
				<tr>	
					<td class="tdLabel">图件编码</td>		
					<td>
						<input value="${query.mapId}" id="mapId" name="mapId" maxlength="80"  class=""/>
					</td>
					<td class="tdLabel">图件名称</td>		
					<td>
						<input value="${query.mapName}" id="mapName" name="mapName" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel">上传时间</td>		
					<td>
						<input value="<fmt:formatDate value='${query.uploadTimeBegin}' pattern='<%=RsMaps.FORMAT_UPLOAD_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=RsMaps.FORMAT_UPLOAD_TIME%>'})" id="uploadTimeBegin" name="uploadTimeBegin"  class="Wdate" />
						<input value="<fmt:formatDate value='${query.uploadTimeEnd}' pattern='<%=RsMaps.FORMAT_UPLOAD_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=RsMaps.FORMAT_UPLOAD_TIME%>'})" id="uploadTimeEnd" name="uploadTimeEnd"   class="Wdate"/>
					</td>
				</tr>	
			</table>
			</div>
		</fieldset>
		<div class="handleControl">
             <div class="buttons">
               <button type="submit" class="regular" name="query" onclick="getReferenceForm(this).action='${ctx}/biz/RsMaps/list.do'" >
                 <img src="<c:url value="/image/form/query.gif"/>" alt="" /> 查询
               </button>
               <wylb:hasPermission name="RsMaps:create">
               <button type="submit" class="positive" name="additem" onclick="getReferenceForm(this).action='${ctx}/biz/RsMaps/create.do'" >
                 <img src="<c:url value="/image/form/add.gif"/>" alt="" /> 添加图件
               </button> 
               </wylb:hasPermission>
               <wylb:hasPermission name="RsMaps:delete">
               <button type="button" class="negative" name="deleteitem" onclick="batchDelete('${ctx}/biz/RsMaps/delete.do','items',document.forms.queryForm)">
                 <img src="<c:url value="/image/form/delete.gif"/>" alt="" /> 删除
               </button> 
               </wylb:hasPermission>
             </div>
		</div>
	</div>
	<div class="cl"></div>
	<div class="gridTable">
        <simpletable:pageToolbar page="${page}">
        <!-- 报表导出,可以添加权限判定 
	      <wylb:hasPermission name="RsMaps:report">
	       <img src="<c:url value="/image/form/icon_pdf.gif"/>" title="导出PDF" alt="导出PDF" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/RsMaps/report.do','PDF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_excel.gif"/>" title="导出Excel" alt="导出excel" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/RsMaps/report.do','XLS');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_rtf.gif"/>" title="导出RTF" alt="导出RTF" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/RsMaps/report.do','RTF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_html.gif"/>" title="导出HTML" alt="导出HTML" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/RsMaps/report.do','HTML');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_xml.gif"/>" title="导出XML" alt="导出XML" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/RsMaps/report.do','XML');"/>
	    </wylb:hasPermission>
	    -->
	    <wylb:lacksPermission name="RsMaps:download">
	     <div class="label label-warning"><a href="<c:url value="/logout.do"/>">[注册会员登录后可下载数据]</a></div>
	    </wylb:lacksPermission>
	    </simpletable:pageToolbar>
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
				<th style="width:1px;">&nbsp;</th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"/></th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<!--<th sortColumn="LIB_ID" >图件库编号</th>  -->
				<th sortColumn="MAP_ID" >图件编码</th>
				<th sortColumn="MAP_NAME" >图件名称</th>
				<th sortColumn="UPLOAD_TIME" >上传时间</th>
				<th>操作</th>
			  </tr>
		  </thead>
		  <tbody>
		      <c:choose>
		       <c:when test="${fn:length(page.result)>0}">
		  	   <c:forEach items="${page.result}" var="item" varStatus="status">
			   <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="seqno=${item.seqno}&" /></td>
				<!-- <td><c:out value='${item.libId}'/>&nbsp;</td> -->
				<td><c:out value='${item.mapId}'/>&nbsp;</td>
				<td><c:out value='${item.mapName}'/>&nbsp;</td>
				<!-- <td><c:out value='${item.mapLocation}'/>&nbsp;</td> -->
				<td><c:out value='${item.uploadTimeString}'/>&nbsp;</td>
				<td>
					<!-- 
					 <a href="${ctx}/biz/RsMaps/show.do?seqno=${item.seqno}&" title="查看" > <img src="<c:url value='/image/form/view.png'/>" alt="查看"  /></a>&nbsp;
					 -->
					<wylb:hasPermission name="RsMaps:download">
					<a href="${ctx}/support/authdownload.do?fileCatalog=遥感图库-${rsMapLib.mapLibName }&fileName=${item.mapName}&filePath=${item.mapLocation}" title="下载" > <img src="<c:url value='/image/form/download.gif'/>" alt="下载"  /></a>
					</wylb:hasPermission>
					<wylb:hasPermission name="RsMaps:edit">
					<a href="${ctx}/biz/RsMaps/edit.do?seqno=${item.seqno}&" title="修改" > <img src="<c:url value='/image/form/edit.gif'/>" alt="修改"  /></a>
					</wylb:hasPermission>
				</td>
			  </tr>
		  	  </c:forEach>
		  	  </c:when>
		  	  <c:otherwise>
		  	  <!-- 空表格 -->
		  	  <c:forEach var="nullitem" begin="1" end="4" step="1"  varStatus="nullstatus">
		  	   <tr class="${(nullstatus.count+1) % 2 == 0 ? 'even' : 'odd'}">
				<td>&nbsp;</td>
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
		<simpletable:pageToolbar page="${page}"></simpletable:pageToolbar>
	</div>
	</form>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>

