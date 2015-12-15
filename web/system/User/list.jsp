<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户管理</title>
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
			<h1>用户管理</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<form id="queryForm" name="queryForm" action="<c:url value="/system/User/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend><span id="toggle-bar" class="toggle-down">&nbsp;</span><span>搜索</span></legend>
			<div id="param-div" class="param-div" >
			<table>
				<tr>	
					<td class="tdLabel">用户名</td>		
					<td>
						<input value="${query.userName}" id="userName" name="userName" maxlength="100"  class=""/>
					</td>
					<td class="tdLabel">真实姓名</td>		
					<td>
						<input value="${query.realName}" id="realName" name="realName" maxlength="100"  class=""/>
					</td>
					
					<td class="tdLabel">注册时间</td>		
					<td>
						<input value="<fmt:formatDate value='${query.registerTimeBegin}' pattern='<%=User.FORMAT_REGISTER_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=User.FORMAT_REGISTER_TIME%>'})" id="registerTimeBegin" name="registerTimeBegin"  class="Wdate" />
						<input value="<fmt:formatDate value='${query.registerTimeEnd}' pattern='<%=User.FORMAT_REGISTER_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=User.FORMAT_REGISTER_TIME%>'})" id="registerTimeEnd" name="registerTimeEnd"   class="Wdate"/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel">移动电话</td>		
					<td>
						<input value="${query.mobile}" id="mobile" name="mobile" maxlength="20"  class=""/>
					</td>
					<td class="tdLabel">联系电话</td>		
					<td>
						<input value="${query.telephone}" id="telephone" name="telephone" maxlength="30"  class=""/>
					</td>
					<td class="tdLabel">最后登录时间</td>		
					<td>
						<input value="<fmt:formatDate value='${query.lastLoginTimeBegin}' pattern='<%=User.FORMAT_LAST_LOGIN_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=User.FORMAT_LAST_LOGIN_TIME%>'})" id="lastLoginTimeBegin" name="lastLoginTimeBegin"  class="Wdate" />
						<input value="<fmt:formatDate value='${query.lastLoginTimeEnd}' pattern='<%=User.FORMAT_LAST_LOGIN_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=User.FORMAT_LAST_LOGIN_TIME%>'})" id="lastLoginTimeEnd" name="lastLoginTimeEnd"   class="Wdate"/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel">邮件</td>		
					<td>
						<input value="${query.email}" id="email" name="email" maxlength="100"  class=""/>
					</td>
					<td class="tdLabel">证件号码</td>		
					<td>
						<input value="${query.idCode}" id="idCode" name="idCode" maxlength="30"  class=""/>
					</td>
					<td class="tdLabel">是否禁用</td>		
					<td>
						<input value="${query.isDisabled}" id="isDisabled" name="isDisabled" maxlength="0"  class=""/>
					</td>
					<!-- 
					<td class="tdLabel">最后登录ip</td>		
					<td>
						<input value="${query.lastLoginIp}" id="lastLoginIp" name="lastLoginIp" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel">登录次数</td>		
					<td>
						<input value="${query.loginCount}" id="loginCount" name="loginCount" maxlength="3"  class="digits "/>
					</td>
					<td class="tdLabel">级别</td>		
					<td>
						<input value="${query.rank}" id="rank" name="rank" maxlength="3"  class="digits "/>
					</td>
					 -->
				</tr>	
			</table>
			</div>
		</fieldset>
		<div class="handleControl">
             <div class="buttons">
               <button type="submit" class="regular" name="query" onclick="getReferenceForm(this).action='${ctx}/system/User/list.do'" >
                 <img src="<c:url value="/image/form/query.gif"/>" alt="" /> 查询
               </button>
              <wylb:hasPermission name="User:create">
               <button type="submit" class="positive" name="additem" onclick="getReferenceForm(this).action='${ctx}/system/User/create.do'" >
                 <img src="<c:url value="/image/form/add.gif"/>" alt="" /> 新增
               </button> 
               </wylb:hasPermission>
               <wylb:hasPermission name="User:delete">
               <button type="button" class="negative" name="deleteitem" onclick="batchDelete('${ctx}/system/User/delete.do','items',document.forms.queryForm)">
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
				<th sortColumn="USER_NAME" >用户名</th>
				<th sortColumn="USER_TYPE_ID" >用户类型</th>
				<th sortColumn="REAL_NAME" >真实姓名</th>
				<th sortColumn="EMAIL" >邮件</th>
				<th sortColumn="MOBILE" >移动电话</th>
				<th sortColumn="TELEPHONE" >联系电话</th>
				<th sortColumn="REGISTER_TIME" >注册时间</th>
				<th sortColumn="LAST_LOGIN_TIME" >最后登录</th>
				<th sortColumn="IS_DISABLED" >状态</th>
				<th>操作</th>
			  </tr>
		  </thead>
		  <tbody>
		      <c:choose>
		       <c:when test="${fn:length(page.result)>0}">
		  	   <c:forEach items="${page.result}" var="item" varStatus="status">
			   <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td>
				<c:choose>
				<c:when test="${item.userTypeId == 1}">&nbsp;</c:when>
				<c:otherwise>
				<input type="checkbox" name="items" value="userid=${item.userid}&" />
				</c:otherwise>
                </c:choose>
				</td>
				<td  style="text-align:left;"><c:out value='${item.userName}'/>&nbsp;</td>
				<td><c:out value='${item.userType.name}'/>&nbsp;</td>
				<td style="text-align:left;"><c:out value='${item.realName}'/>&nbsp;</td>
				<td style="text-align:left;"><c:out value='${item.email}'/>&nbsp;</td>
				<td style="text-align:right;"><c:out value='${item.mobile}'/>&nbsp;</td>
				<td style="text-align:right;"><c:out value='${item.telephone}'/>&nbsp;</td>
				<td><c:out value='${item.registerTimeString}'/>&nbsp;</td>
				<td><c:out value='${item.lastLoginTimeString}'/>&nbsp;</td>
				<td>
				<c:if test="${item.isDisabled==false}">生效</c:if>
				<c:if test="${item.isDisabled==true}">禁用</c:if>
				</td>
				<td>
					<a href="${ctx}/system/User/show.do?userid=${item.userid}&" title="查看" > <img src="<c:url value='/image/form/view.png'/>" alt="查看"  /></a>&nbsp;
					<wylb:hasPermission name="User:edit">
					<a href="${ctx}/system/User/edit.do?userid=${item.userid}&" title="修改" > <img src="<c:url value='/image/form/edit.gif'/>" alt="修改"  /></a>
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

