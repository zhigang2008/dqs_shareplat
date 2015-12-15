<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="moduleId" name="moduleId" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			模块名称<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="模块名称" key="moduleName" value="%{model.moduleName}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			模块地址<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="模块地址" key="url" value="%{model.url}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			上级模块<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="上级模块" key="parent" value="%{model.parent}" cssClass="required digits " required="true" />
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
	
	<tr>	
		<td class="tdlabel">
			描述:
		</td>	
		<td>
		  <s:textfield label="描述" key="description" value="%{model.description}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			排序字段<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="排序字段" key="sortOrder" value="%{model.sortOrder}" cssClass="required digits " required="true" />
	    </td>
	</tr>
	
