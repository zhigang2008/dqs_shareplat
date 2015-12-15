<%@page import="com.steven.cms.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="contentId" name="contentId" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			内容文本:
		</td>	
		<td>
		  <s:textfield label="内容文本" key="txt" value="%{model.txt}" cssClass="" required="false" />
	    </td>
	</tr>
	
