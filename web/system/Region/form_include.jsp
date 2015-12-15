<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			regionCode:
		</td>	
		<td>
		  <s:textfield label="regionCode" key="regionCode" value="%{model.regionCode}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			regionName<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="regionName" key="regionName" value="%{model.regionName}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			rome:
		</td>	
		<td>
		  <s:textfield label="rome" key="rome" value="%{model.rome}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			zmCode:
		</td>	
		<td>
		  <s:textfield label="zmCode" key="zmCode" value="%{model.zmCode}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			parentId:
		</td>	
		<td>
		  <s:textfield label="parentId" key="parentId" value="%{model.parentId}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			memo:
		</td>	
		<td>
		  <s:textfield label="memo" key="memo" value="%{model.memo}" cssClass="" required="false" />
	    </td>
	</tr>
	
