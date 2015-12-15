<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<title>User信息</title>
</head>

<body>
<!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>用户管理 -> 查看用户</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<div class="showdetail"> 
	<s:form action="/system/User/list.do" method="post" theme="simple">
		<div id="controlbuttons" class="buttons">
               <button type="button" class="regular" name="backlist" onclick="window.location='${ctx}/system/User/list.do'" >
                 <img src="<c:url value="/image/form/grid.gif"/>" alt="" /> 返回列表
               </button> 
               <button type="button" class="regular" name="backpage" onclick="history.back();">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 后退
               </button> 
        </div>
        <div class="cl"></div>
        <div id="formdiv" >
        <p>基本内容:</p>
		   <s:hidden name="userid" id="userid" value="%{model.userid}"/>
		<table id="formtable" class="formtable">
			<tr>	
				<td class="tdlabel">用户名: </td>	
				<td><s:property value="%{model.userName}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">用户类型: </td>	
				<td><s:property value="%{model.userType.name}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">真实姓名: </td>	
				<td><s:property value="%{model.realName}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">邮件: </td>	
				<td><s:property value="%{model.email}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">证件类型: </td>	
				<td><s:property value="%{model.idType}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">证件号码: </td>	
				<td><s:property value="%{model.idCode}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">移动电话: </td>	
				<td><s:property value="%{model.mobile}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">移动电话2: </td>	
				<td><s:property value="%{model.mobile2}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">联系电话: </td>	
				<td><s:property value="%{model.telephone}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">联系电话2: </td>	
				<td><s:property value="%{model.telephone2}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">联系地址: </td>	
				<td><s:property value="%{model.address}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">邮政编码: </td>	
				<td><s:property value="%{model.postcode}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">头衔职称: </td>	
				<td><s:property value="%{model.title}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">注册时间: </td>	
				<td><s:property value="%{model.registerTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">注册ip: </td>	
				<td><s:property value="%{model.registerIp}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">最后登录时间: </td>	
				<td><s:property value="%{model.lastLoginTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">最后登录ip: </td>	
				<td><s:property value="%{model.lastLoginIp}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">登录次数: </td>	
				<td><s:property value="%{model.loginCount}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">级别: </td>	
				<td><s:property value="%{model.rank}" /></td>
			</tr>
			<tr>	
				<td class="tdlabel">是否禁用: </td>	
				<td><s:property value="%{model.isDisabled}" /></td>
			</tr>
		</table>
		<p>角色信息:</p>
		 <div>
		 <s:iterator value="%{model.userRoles}" var="userRole" status="userRoleStatus">
                 <s:iterator value="%{baseCode.role}" var="role" status="roleStatus">
                    <s:if test="%{#userRole.roleId==#role.roleId}"><s:property value="roleName" /></s:if>
                 </s:iterator>
                 <s:if test="!#userStatus.last">,</s:if>
             </s:iterator>
		 </div>
		</div>
	</s:form>
	</div>
	</div> <!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>
