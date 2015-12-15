<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="roleId" name="roleId" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			角色名称<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="角色名称" key="roleName" value="%{model.roleName}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			角色描述:
		</td>	
		<td>
		  <s:textfield label="角色描述" key="roleDesc" value="%{model.roleDesc}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			排列顺序:
		</td>	
		<td>
		  <s:textfield label="排列顺序" key="priority" value="%{model.priority}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			状态<span class="required">*</span>:
		</td>	
		<td>
		  <s:radio list='#{true:"启用",false:"停用"}'  key="status" value="%{model.status}" cssClass="required " required="true"></s:radio> 
	     </td>
	</tr>
	
