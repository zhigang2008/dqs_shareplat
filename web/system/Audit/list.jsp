<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Audit 维护</title>
<%@ include file="/commons/meta.jsp" %>
<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
<script	src="<c:url value="/script/validation/jquery.validate.min.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/additional_methods.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/messages_cn.js"/>"	type="text/javascript"></script>
<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
			//搜索栏收起
			$("#toggle-bar").click(function(oEvent) {
				$("#param-div").toggle("slow");
				$(this).toggleClass("toggle-up");
			});

			//验证查询表单
			var v = $("#queryForm").validate();
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
			<h1>审计信息</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<form id="queryForm" name="queryForm" action="<c:url value="/system/Audit/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend><span id="toggle-bar" class="toggle-down">&nbsp;</span><span>搜索</span></legend>
			<div id="param-div" class="param-div" >
			<table>
				<tr>	
					<td class="tdLabel">用户ID</td>		
					<td>
						<input value="${query.userid}" id="userid" name="userid" maxlength="10"  class="digits "/>
					</td>
					<td class="tdLabel">用户名</td>		
					<td>
						<input value="${query.userName}" id="userName" name="userName" maxlength="100"  class=""/>
					</td>
					
					</tr>	
				<tr>
				   <td class="tdLabel">登录IP</td>		
					<td>
						<input value="${query.actIp}" id="actIp" name="actIp" maxlength="50"  class=""/>
					</td>
					 <td class="tdLabel">时间</td>		
					<td>
						<input value="<fmt:formatDate value='${query.actTimeBegin}' pattern='<%=Audit.FORMAT_ACT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=Audit.FORMAT_ACT_TIME%>'})" id="actTimeBegin" name="actTimeBegin"  class="Wdate" />
						<input value="<fmt:formatDate value='${query.actTimeEnd}' pattern='<%=Audit.FORMAT_ACT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=Audit.FORMAT_ACT_TIME%>'})" id="actTimeEnd" name="actTimeEnd"   class="Wdate"/>
					</td>
					<!-- 
					<td class="tdLabel">登录状态</td>		
					<td>
						<input value="${query.actStatus}" id="actStatus" name="actStatus" maxlength="0"  class=""/>
					</td>
					 -->
				</tr>	
			</table>
			</div>
		</fieldset>
		<div class="handleControl">
             <div class="buttons">
               <button type="submit" class="regular" name="query" onclick="getReferenceForm(this).action='${ctx}/system/Audit/list.do'" >
                 <img src="<c:url value="/image/form/query.gif"/>" alt="" /> 查询
               </button>
               <!-- 只能查看删除.不能新增
                <button type="submit" class="positive" name="additem" onclick="getReferenceForm(this).action='${ctx}/system/Audit/create.do'" >
                 <img src="<c:url value="/image/form/add.gif"/>" alt="" /> 新增
               </button> 
               -->
               <wylb:hasPermission name="Audit:delete">
               <button type="button" class="negative" name="deleteitem" onclick="batchDelete('${ctx}/system/Audit/delete.do','items',document.forms.queryForm)">
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
	      <wylb:hasPermission name="Audit:report"></wylb:hasPermission>
	       <img src="<c:url value="/image/form/icon_pdf.gif"/>" title="导出PDF" alt="导出PDF" onclick="javascript:simpleTable.exportToFile('${ctx}/system/Audit/report.do','PDF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_excel.gif"/>" title="导出Excel" alt="导出excel" onclick="javascript:simpleTable.exportToFile('${ctx}/system/Audit/report.do','XLS');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_rtf.gif"/>" title="导出RTF" alt="导出RTF" onclick="javascript:simpleTable.exportToFile('${ctx}/system/Audit/report.do','RTF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_html.gif"/>" title="导出HTML" alt="导出HTML" onclick="javascript:simpleTable.exportToFile('${ctx}/system/Audit/report.do','HTML');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_xml.gif"/>" title="导出XML" alt="导出XML" onclick="javascript:simpleTable.exportToFile('${ctx}/system/Audit/report.do','XML');"/>
	    </simpletable:pageToolbar>
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
				<th style="width:1px;">&nbsp;</th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"/></th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="USERID" >用户ID</th>
				<th sortColumn="USER_NAME" >用户名</th>
				<th sortColumn="ACT_TIME" >时间</th>
				<th sortColumn="ACT_IP" >IP</th>
				<th sortColumn="ACT_STATUS" >状态</th>
				<th sortColumn="ACT_TYPE" >操作类型</th>
				<th sortColumn="NOTES" >备注</th>
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
				<td><c:out value='${item.userid}'/>&nbsp;</td>
				<td><c:out value='${item.userName}'/>&nbsp;</td>
				<td><c:out value='${item.actTimeString}'/>&nbsp;</td>
				<td><c:out value='${item.actIp}'/>&nbsp;</td>
				<td>
				<c:choose>
				<c:when test="${item.actStatus}">OK</c:when>
				<c:otherwise>
				<c:out value='${item.actStatus}'/>&nbsp;
				</c:otherwise>
                </c:choose>
                </td>
				<td>
				<c:if test="${item.actType==1}">登录</c:if>
                <c:if test="${item.actType==2}">离开</c:if>
				</td>
				<td><c:out value='${item.notes}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/system/Audit/show.do?id=${item.id}&" title="查看" > <img src="<c:url value='/image/form/view.png'/>" alt="查看"  /></a>&nbsp;
					<!--  <a href="${ctx}/system/Audit/edit.do?id=${item.id}&" title="修改" > <img src="<c:url value='/image/form/edit.gif'/>" alt="修改"  /></a> -->
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

