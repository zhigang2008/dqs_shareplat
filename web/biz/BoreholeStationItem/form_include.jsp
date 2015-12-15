<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			代码<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="代码" key="code" value="%{model.code}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			测量项<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="测量项" key="name" value="%{model.name}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			备注:
		</td>	
		<td>
		  <s:textfield label="备注" key="note" value="%{model.note}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			排序<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="排序" key="sortno" value="%{model.sortno}" cssClass="required digits " required="true" />
	    </td>
	</tr>
	
