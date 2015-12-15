<%@page import="com.steven.cms.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="code" name="code" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			类型描述<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="类型描述" key="name" value="%{model.name}" cssClass="required " required="true" />
	    </td>
	</tr>
	
