<%@page import="com.steven.cms.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>留言 维护</title>
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
	function review(id,status){
			$.getJSON("<s:url value="/cms/CmsBoard/jsonUpdate.do"/>?id="+id+"&status="+status, function(data){
				  if(data.success==true){
					  $("#queryForm").submit();
				  }
				  else{
					  alert("审批失败:"+data.message);
				  }
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
			<h1>留言板</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<form id="queryForm" name="queryForm" action="<c:url value="/cms/CmsBoard/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend><span id="toggle-bar" class="toggle-down">&nbsp;</span><span>搜索</span></legend>
			<div id="param-div" class="param-div" >
			<table>
				<tr>	
					<td class="tdLabel">留言人</td>		
					<td>
						<input value="${query.userName}" id="userName" name="userName" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel">标题</td>		
					<td>
						<input value="${query.title}" id="title2" name="title" maxlength="200"  class=""/>
					</td>
					<td class="tdLabel">内容</td>		
					<td>
						<input value="${query.content}" id="content2" name="content" maxlength="2000"  class=""/>
					</td>
					<td class="tdLabel">时间</td>		
					<td>
						<input value="<fmt:formatDate value='${query.timeBegin}' pattern='<%=CmsBoard.FORMAT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=CmsBoard.FORMAT_TIME%>'})" id="timeBegin" name="timeBegin"  class="Wdate" />
						<input value="<fmt:formatDate value='${query.timeEnd}' pattern='<%=CmsBoard.FORMAT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=CmsBoard.FORMAT_TIME%>'})" id="timeEnd" name="timeEnd"   class="Wdate"/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel">联系电话</td>		
					<td>
						<input value="${query.phone}" id="phone" name="phone" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel">邮件</td>		
					<td>
						<input value="${query.mail}" id="mail" name="mail" maxlength="80"  class=""/>
					</td>
					<td class="tdLabel">留言类别</td>		
					<td>
						<s:select value="%{#request.query.msgType}" id="msgType" name="msgType"  list="%{baseCode.cmsBoardType}" listKey="code" listValue="name" headerKey="" headerValue="---"/>
					</td>
					<td class="tdLabel">状态</td>		
					<td>
						<s:select value="%{#request.query.status}" id="status" name="status" list="%{baseCode.cmsBoardStatus}" listKey="code" listValue="name" headerKey="" headerValue="---"/>
					</td>
				</tr>	
			</table>
			</div>
		</fieldset>
		<div class="handleControl">
             <div class="buttons">
               <button type="submit" class="regular" name="query" onclick="getReferenceForm(this).action='${ctx}/cms/CmsBoard/list.do'" >
                 <img src="<c:url value="/image/form/query.gif"/>" alt="" /> 查询
               </button>
               <!--
               <wylb:hasPermission name="CmsBoard:create">
               <button type="submit" class="positive" name="additem" onclick="getReferenceForm(this).action='${ctx}/cms/CmsBoard/create.do'" >
                 <img src="<c:url value="/image/form/add.gif"/>" alt="" /> 新增
               </button> 
               </wylb:hasPermission>
               -->
               <wylb:hasPermission name="CmsBoard:delete">
               <button type="button" class="negative" name="deleteitem" onclick="batchDelete('${ctx}/cms/CmsBoard/delete.do','items',document.forms.queryForm)">
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
	      <wylb:hasPermission name="CmsBoard:report">
	       <img src="<c:url value="/image/form/icon_pdf.gif"/>" title="导出PDF" alt="导出PDF" onclick="javascript:simpleTable.exportToFile('${ctx}/cms/CmsBoard/report.do','PDF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_excel.gif"/>" title="导出Excel" alt="导出excel" onclick="javascript:simpleTable.exportToFile('${ctx}/cms/CmsBoard/report.do','XLS');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_rtf.gif"/>" title="导出RTF" alt="导出RTF" onclick="javascript:simpleTable.exportToFile('${ctx}/cms/CmsBoard/report.do','RTF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_html.gif"/>" title="导出HTML" alt="导出HTML" onclick="javascript:simpleTable.exportToFile('${ctx}/cms/CmsBoard/report.do','HTML');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_xml.gif"/>" title="导出XML" alt="导出XML" onclick="javascript:simpleTable.exportToFile('${ctx}/cms/CmsBoard/report.do','XML');"/>
	       </wylb:hasPermission>
	    </simpletable:pageToolbar>
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
				<th style="width:1px;">&nbsp;</th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"/></th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="USER_NAME" >留言人</th>
				<th sortColumn="TITLE" >标题</th>
				<th sortColumn="CONTENT" >内容</th>
				<th sortColumn="TIME" >时间</th>
				<th sortColumn="PHONE" >联系电话</th>
				<th sortColumn="MAIL" >邮件</th>
				<th sortColumn="REPLY" >回复</th>
				<th sortColumn="USER_ID" >用户ID</th>
				<th sortColumn="MSG_TYPE" >留言类别</th>
				<th sortColumn="STATUS" >状态</th>
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
				<td><c:out value='${item.userName}'/>&nbsp;</td>
				<td><wylb:textCut length="15"><c:out value='${item.title}'/></wylb:textCut>&nbsp;</td>
				<td><wylb:textCut length="15"><c:out value='${item.content}'/></wylb:textCut>&nbsp;</td>
				<td><c:out value='${item.timeString}'/>&nbsp;</td>
				<td><c:out value='${item.phone}'/>&nbsp;</td>
				<td><c:out value='${item.mail}'/>&nbsp;</td>
				<td><wylb:textCut length="15"><c:out value='${item.reply}'/></wylb:textCut>&nbsp;</td>
				<td><c:out value='${item.userId}'/>&nbsp;</td>
				<td><c:out value='${item.boardType.name}'/>&nbsp;</td>
				<td><c:out value='${item.boardStatus.name}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/cms/CmsBoard/show.do?id=${item.id}&" title="查看" > <img src="<c:url value='/image/form/view.png'/>" alt="查看"  /></a>&nbsp;
					<wylb:hasPermission name="CmsBoard:edit">
					<c:choose>
					<c:when test="${item.status >= 2}">
					  <a href="javascript:review(${item.id},1);" title="退回待审核" > <img src="<c:url value='/image/form/ok.gif'/>" alt="退回待审核"  /></a>&nbsp;
					</c:when>
					<c:otherwise>
					  <a href="javascript:review(${item.id},2);" title="审核通过" > <img src="<c:url value='/image/form/cancle.gif'/>" alt="审核通过"  /></a>&nbsp;
					</c:otherwise>
					</c:choose>
					<a href="${ctx}/cms/CmsBoard/edit.do?id=${item.id}&" title="回复" > <img src="<c:url value='/image/form/edit.gif'/>" alt="回复"  /></a>
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

