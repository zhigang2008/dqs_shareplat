<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="groupId" name="groupId" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			组名<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="组名" key="groupName" value="%{model.groupName}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			描述:
		</td>	
		<td>
		  <s:textfield label="描述" key="groupDesc" value="%{model.groupDesc}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			状态<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="状态" key="status" value="%{model.status}" cssClass="required " required="true" />
	    </td>
	</tr>
	
