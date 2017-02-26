<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>钻孔应变台站信息 维护</title>
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
		
		function showItems(stationcode){
			$.getJSON("<c:url value="/biz/BoreholeStation/getItemInfo.do"/>",{stationCode:stationcode},function(myJSON){ 
				 var myOptions2=""; 
				 for(var i=0;i<myJSON.length;i++){ 
				      myOptions2 +=   myJSON[i].itemCname + ';</br>'; 
				   }                          
				   $("#"+stationcode).empty();         
				   $("#"+stationcode).html(myOptions2); 
				 });
		}
	</script>
</head>

<body>
    <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>钻孔应变台站信息</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<form id="queryForm" name="queryForm" action="<c:url value="/biz/BoreholeStation/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend><span id="toggle-bar" class="toggle-down">&nbsp;</span><span>搜索</span></legend>
			<div id="param-div" class="param-div" >
			<table>
				<tr>	
					<td class="tdLabel">省份代码</td>		
					<td>
						<input value="${query.provinceCode}" id="provinceCode" name="provinceCode" maxlength="20"  class=""/>
					</td>
					<td class="tdLabel">省份</td>		
					<td>
						<input value="${query.provinceCname}" id="provinceCname" name="provinceCname" maxlength="20"  class=""/>
					</td>
					<td class="tdLabel">台站代码</td>		
					<td>
						<input value="${query.stationCode}" id="stationCode" name="stationCode" maxlength="20"  class=""/>
					</td>
					<td class="tdLabel">台站名称</td>		
					<td>
						<input value="${query.stationCname}" id="stationCname" name="stationCname" maxlength="20"  class=""/>
					</td>
				</tr>	
				<!-- <tr>	
					<td class="tdLabel">观测项代码</td>		
					<td>
						<input value="${query.itemCode}" id="itemCode" name="itemCode" maxlength="20"  class=""/>
					</td>
					<td class="tdLabel">观测项</td>		
					<td>
						<input value="${query.itemCname}" id="itemCname" name="itemCname" maxlength="20"  class=""/>
					</td>
				</tr>	
				 -->
			</table>
			</div>
		</fieldset>
		<div class="handleControl">
             <div class="buttons">
               <button type="submit" class="regular" name="query" onclick="getReferenceForm(this).action='${ctx}/biz/BoreholeStation/list.do'" >
                 <img src="<c:url value="/image/form/query.gif"/>" alt="" /> 查询
               </button>
               <wylb:hasPermission name="BoreholeStation:create">
               <button type="submit" class="positive" name="additem" onclick="getReferenceForm(this).action='${ctx}/biz/BoreholeStation/create.do'" >
                 <img src="<c:url value="/image/form/add.gif"/>" alt="" /> 新增
               </button> 
               </wylb:hasPermission>
               <wylb:hasPermission name="BoreholeStation:delete">
               <button type="button" class="negative" name="deleteitem" onclick="batchDelete('${ctx}/biz/BoreholeStation/delete.do','items',document.forms.queryForm)">
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
	      <wylb:hasPermission name="BoreholeStation:report"></wylb:hasPermission>
	       <img src="<c:url value="/image/form/icon_pdf.gif"/>" title="导出PDF" alt="导出PDF" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/BoreholeStation/report.do','PDF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_excel.gif"/>" title="导出Excel" alt="导出excel" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/BoreholeStation/report.do','XLS');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_rtf.gif"/>" title="导出RTF" alt="导出RTF" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/BoreholeStation/report.do','RTF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_html.gif"/>" title="导出HTML" alt="导出HTML" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/BoreholeStation/report.do','HTML');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_xml.gif"/>" title="导出XML" alt="导出XML" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/BoreholeStation/report.do','XML');"/>
	    </simpletable:pageToolbar>
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
				<th style="width:1px;">&nbsp;</th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"/></th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="PROVINCE_CODE" >省份代码</th>
				<th sortColumn="PROVINCE_CNAME" >省份</th>
				<th sortColumn="STATION_CODE" >台站代码</th>
				<th sortColumn="STATION_CNAME" >台站名称</th>
				<th width="20%">观测项</th>
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
				<td><c:out value='${item.provinceCode}'/>&nbsp;</td>
				<td><c:out value='${item.provinceCname}'/>&nbsp;</td>
				<td><c:out value='${item.stationCode}'/>&nbsp;</td>
				<td><c:out value='${item.stationCname}'/>&nbsp;</td>
				<td><div id="${item.stationCode}" style="text-align:left;"><a href="javascript:showItems('${item.stationCode}');">显示观测项</a></div></td>
				<td>
					<a href="${ctx}/biz/BoreholeStation/show.do?stationCode=${item.stationCode}&" title="查看" > <img src="<c:url value='/image/form/view.png'/>" alt="查看"  /></a>&nbsp;
					<wylb:hasPermission name="BoreholeStation:edit">
					<a href="${ctx}/biz/BoreholeStation/edit.do?stationCode=${item.stationCode}&" title="修改" > <img src="<c:url value='/image/form/edit.gif'/>" alt="修改"  /></a>
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

