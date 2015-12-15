<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			编码<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="编码" key="code" value="%{model.code}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			权限描述:
		</td>	
		<td>
		  <s:textfield label="权限描述" key="description" value="%{model.description}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			状态<span class="required">*</span>:
		</td>	
		<td>
		  <s:radio list='#{true:"启用",false:"停用"}' label="状态" key="status" value="%{model.status}" cssClass="required " required="true" />
	    </td>
	</tr>
	
