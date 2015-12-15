<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>忘记密码重置信息 维护</title>
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
			<h1>忘记密码重置信息</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<form id="queryForm" name="queryForm" action="<c:url value="/system/PasswordApplyInfo/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend><span id="toggle-bar" class="toggle-down">&nbsp;</span><span>搜索</span></legend>
			<div id="param-div" class="param-div" >
			<table>
				<tr>	
					<td class="tdLabel">申请账户</td>		
					<td>
						<input value="${query.userid}" id="userid" name="userid" maxlength="22"  class="digits "/>
					</td>
					<td class="tdLabel">申请账户名</td>		
					<td>
						<input value="${query.userName}" id="userName" name="userName" maxlength="80"  class=""/>
					</td>
					<td class="tdLabel">申请时间</td>		
					<td>
						<input value="<fmt:formatDate value='${query.applytimeBegin}' pattern='<%=PasswordApplyInfo.FORMAT_APPLYTIME%>'/>" onclick="WdatePicker({dateFmt:'<%=PasswordApplyInfo.FORMAT_APPLYTIME%>'})" id="applytimeBegin" name="applytimeBegin"  class="Wdate" />
						<input value="<fmt:formatDate value='${query.applytimeEnd}' pattern='<%=PasswordApplyInfo.FORMAT_APPLYTIME%>'/>" onclick="WdatePicker({dateFmt:'<%=PasswordApplyInfo.FORMAT_APPLYTIME%>'})" id="applytimeEnd" name="applytimeEnd"   class="Wdate"/>
					</td>
					<td class="tdLabel">申请地址</td>		
					<td>
						<input value="${query.applyIp}" id="applyIp" name="applyIp" maxlength="50"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel">有效截止时间</td>		
					<td>
						<input value="<fmt:formatDate value='${query.deadlineBegin}' pattern='<%=PasswordApplyInfo.FORMAT_DEADLINE%>'/>" onclick="WdatePicker({dateFmt:'<%=PasswordApplyInfo.FORMAT_DEADLINE%>'})" id="deadlineBegin" name="deadlineBegin"  class="Wdate" />
						<input value="<fmt:formatDate value='${query.deadlineEnd}' pattern='<%=PasswordApplyInfo.FORMAT_DEADLINE%>'/>" onclick="WdatePicker({dateFmt:'<%=PasswordApplyInfo.FORMAT_DEADLINE%>'})" id="deadlineEnd" name="deadlineEnd"   class="Wdate"/>
					</td>
					<td class="tdLabel">是否有效</td>		
					<td>
						<input value="${query.isValid}" id="isValid" name="isValid" maxlength="1"  class=""/>
					</td>
					<td class="tdLabel">使用时间</td>		
					<td>
						<input value="<fmt:formatDate value='${query.useTimeBegin}' pattern='<%=PasswordApplyInfo.FORMAT_USE_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=PasswordApplyInfo.FORMAT_USE_TIME%>'})" id="useTimeBegin" name="useTimeBegin"  class="Wdate" />
						<input value="<fmt:formatDate value='${query.useTimeEnd}' pattern='<%=PasswordApplyInfo.FORMAT_USE_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=PasswordApplyInfo.FORMAT_USE_TIME%>'})" id="useTimeEnd" name="useTimeEnd"   class="Wdate"/>
					</td>
				</tr>	
			</table>
			</div>
		</fieldset>
		<div class="handleControl">
             <div class="buttons">
               <button type="submit" class="regular" name="query" onclick="getReferenceForm(this).action='${ctx}/system/PasswordApplyInfo/list.do'" >
                 <img src="<c:url value="/image/form/query.gif"/>" alt="" /> 查询
               </button>
               <wylb:hasPermission name="PasswordApplyInfo:create">
               <button type="submit" class="positive" name="additem" onclick="getReferenceForm(this).action='${ctx}/system/PasswordApplyInfo/create.do'" >
                 <img src="<c:url value="/image/form/add.gif"/>" alt="" /> 新增
               </button> 
               </wylb:hasPermission>
               <wylb:hasPermission name="PasswordApplyInfo:delete">
               <button type="button" class="negative" name="deleteitem" onclick="batchDelete('${ctx}/system/PasswordApplyInfo/delete.do','items',document.forms.queryForm)">
                 <img src="<c:url value="/image/form/delete.gif"/>" alt="" /> 删除
               </button> 
               </wylb:hasPermission>
             </div>
		</div>
	</div>
	<div class="cl"></div>
	<div class="gridTable">
        <simpletable:pageToolbar page="${page}"></simpletable:pageToolbar>
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
				<th style="width:1px;">&nbsp;</th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"/></th>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="USERID" >申请账户</th>
				<th sortColumn="USER_NAME" >申请账户名</th>
				<th sortColumn="APPLYTIME" >申请时间</th>
				<th sortColumn="APPLY_IP" >申请地址</th>
				<th sortColumn="DEADLINE" >有效截止时间</th>
				<th sortColumn="IS_VALID" >是否有效</th>
				<th sortColumn="USE_TIME" >使用时间</th>
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
				<td><c:out value='${item.userid}'/>&nbsp;</td>
				<td><c:out value='${item.userName}'/>&nbsp;</td>
				<td><c:out value='${item.applytimeString}'/>&nbsp;</td>
				<td><c:out value='${item.applyIp}'/>&nbsp;</td>
				<td><c:out value='${item.deadlineString}'/>&nbsp;</td>
				<td><c:out value='${item.isValid}'/>&nbsp;</td>
				<td><c:out value='${item.useTimeString}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/system/PasswordApplyInfo/show.do?seqno=${item.seqno}&" title="查看" > <img src="<c:url value='/image/form/view.png'/>" alt="查看"  /></a>&nbsp;
					<wylb:hasPermission name="PasswordApplyInfo:edit">
					<a href="${ctx}/system/PasswordApplyInfo/edit.do?seqno=${item.seqno}&" title="修改" > <img src="<c:url value='/image/form/edit.gif'/>" alt="修改"  /></a>
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

