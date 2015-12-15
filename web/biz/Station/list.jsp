<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>台站 维护</title>
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
			<h1>台站</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<form id="queryForm" name="queryForm" action="<c:url value="/biz/Station/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend><span id="toggle-bar" class="toggle-down">&nbsp;</span><span>搜索</span></legend>
			<div id="param-div" class="param-div" >
			<table>
				<tr>	
					<td class="tdLabel">名称</td>		
					<td>
						<input value="${query.name}" id="name" name="name" maxlength="100"  class=""/>
					</td>
					<td class="tdLabel">编号</td>		
					<td>
						<input value="${query.code}" id="code" name="code" maxlength="10"  class=""/>
					</td>
					<td class="tdLabel">位置</td>		
					<td>
						<input value="${query.unit}" id="unit" name="unit" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel">岩性</td>		
					<td>
						<input value="${query.lithology}" id="lithology" name="lithology" maxlength="50"  class=""/>
					</td>
					<!-- 
					 <td class="tdLabel">经度</td>		
					<td>
						<input value="${query.longitude}" id="longitude" name="longitude" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel">纬度</td>		
					<td>
						<input value="${query.latitude}" id="latitude" name="latitude" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel">海拔</td>		
					<td>
						<input value="${query.hight}" id="hight" name="hight" maxlength="10"  class="digits "/>
					</td>
					<td class="tdLabel">钻孔深度</td>		
					<td>
						<input value="${query.wellDepth}" id="wellDepth" name="wellDepth" maxlength="8"  class="digits "/>
					</td>
					<td class="tdLabel">观测深度</td>		
					<td>
						<input value="${query.observateDepth}" id="observateDepth" name="observateDepth" maxlength="8"  class="digits "/>
					</td>
					-->
					</tr>
					<tr>
					<td class="tdLabel">地区</td>		
					<td>
						<s:select value="%{#request.query.regionCode}" id="regionCode" name="regionCode" maxlength="30"  class="" list="%{baseCode.region}"  listKey="regionCode"  listValue="regionName" headerKey="" headerValue="--全部--" />
					</td>
					<td class="tdLabel">台站类型</td>		
					<td>
						<s:select value="%{#request.query.stationTypeCode}" id="stationTypeCode" name="stationTypeCode" list="%{baseCode.stationType}"  listKey="code"  listValue="name" headerKey="" headerValue="--全部--" />
					</td>
					<td class="tdLabel">钻孔类型</td>		
					<td >
						<s:select value="%{#request.query.wellTypeCode}"  id="wellTypeCode" name="wellTypeCode"   list="%{baseCode.wellType}"  listKey="code"  listValue="name" headerKey="" headerValue="--全部--" />
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>	
			</table>
			</div>
		</fieldset>
		<div class="handleControl">
             <div class="buttons">
               <button type="submit" class="regular" name="query" onclick="getReferenceForm(this).action='${ctx}/biz/Station/list.do'" >
                 <img src="<c:url value="/image/form/query.gif"/>" alt="" /> 查询
               </button>
               <wylb:hasPermission name="Station:create">
               <button type="submit" class="positive" name="additem" onclick="getReferenceForm(this).action='${ctx}/biz/Station/create.do'" >
                 <img src="<c:url value="/image/form/add.gif"/>" alt="" /> 新增
               </button> 
               </wylb:hasPermission>
               <wylb:hasPermission name="Station:delete">
               <button type="button" class="negative" name="deleteitem" onclick="batchDelete('${ctx}/biz/Station/delete.do','items',document.forms.queryForm)">
                 <img src="<c:url value="/image/form/delete.gif"/>" alt="" /> 删除
               </button> 
               </wylb:hasPermission>
             </div>
		</div>
	</div>
	<div class="cl"></div>
	<div class="gridTable">
        <simpletable:pageToolbar page="${page}">
        <!-- 报表导出,可以添加权限判定 -->
	      <wylb:hasPermission name="Station:report"></wylb:hasPermission>
	       <img src="<c:url value="/image/form/icon_pdf.gif"/>" title="导出PDF" alt="导出PDF" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/Station/report.do','PDF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_excel.gif"/>" title="导出Excel" alt="导出excel" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/Station/report.do','XLS');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_rtf.gif"/>" title="导出RTF" alt="导出RTF" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/Station/report.do','RTF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_html.gif"/>" title="导出HTML" alt="导出HTML" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/Station/report.do','HTML');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_xml.gif"/>" title="导出XML" alt="导出XML" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/Station/report.do','XML');"/>
	    </simpletable:pageToolbar>
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
				<th style="width:1px;">&nbsp;</th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"/></th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="REGION_CODE" >地区</th>
				<th sortColumn="CODE" >编号</th>
				<th sortColumn="NAME" >名称</th>
				<th sortColumn="STATION_TYPE_CODE" >台站类型</th>
				<th sortColumn="LONGITUDE" >经度</th>
				<th sortColumn="LATITUDE" >纬度</th>
				<th sortColumn="HIGHT" >海拔</th>
				<th sortColumn="UNIT" >位置</th>
				<th sortColumn="WELL_TYPE_CODE" >钻孔类型</th>
				<th sortColumn="WELL_DEPTH" >钻孔深度</th>
				<th sortColumn="OBSERVATE_DEPTH" >观测深度</th>
				<th sortColumn="LITHOLOGY" >岩性</th>
				<th>操作</th>
			  </tr>
		  </thead>
		  <tbody>
		      <c:choose>
		       <c:when test="${fn:length(page.result)>0}">
		  	   <c:forEach items="${page.result}" var="item" varStatus="status">
			   <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="id=${item.id}&" /></td>
				<td><c:out value='${item.region.regionName}'/>(<c:out value='${item.region.zmCode}'/>)&nbsp;</td>
				<td><c:out value='${item.code}'/>&nbsp;</td>
				<td><c:out value='${item.name}'/>&nbsp;</td>
				<td><c:out value='${item.stationType.name}'/>&nbsp;</td>
				<td><c:out value='${item.longitude}'/>&nbsp;</td>
				<td><c:out value='${item.latitude}'/>&nbsp;</td>
				<td><c:out value='${item.hight}'/>&nbsp;</td>
				<td><c:out value='${item.unit}'/>&nbsp;</td>
				<td><c:out value='${item.wellType.name}'/>&nbsp;</td>
				<td><c:out value='${item.wellDepth}'/>&nbsp;</td>
				<td><c:out value='${item.observateDepth}'/>&nbsp;</td>
				<td><c:out value='${item.lithology}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/biz/Station/show.do?id=${item.id}&" title="查看" > <img src="<c:url value='/image/form/view.png'/>" alt="查看"  /></a>&nbsp;
					<wylb:hasPermission name="Station:edit">
					<a href="${ctx}/biz/Station/edit.do?id=${item.id}&" title="修改" > <img src="<c:url value='/image/form/edit.gif'/>" alt="修改"  /></a>
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
				<td>&nbsp;</td>
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

