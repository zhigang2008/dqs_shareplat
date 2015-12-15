<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			用户组id<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="用户组id" key="groupId" value="%{model.groupId}" cssClass="required digits " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			角色id<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="角色id" key="roleId" value="%{model.roleId}" cssClass="required digits " required="true" />
	    </td>
	</tr>
	
