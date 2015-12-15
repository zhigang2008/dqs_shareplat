<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="moduleId" name="moduleId" />
    <s:hidden  label="上级模块" key="parent" value="%{model.parent}" cssClass="required validate-integer max-value-2147483647" required="true" />

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
			模块类型<span class="required">*</span>:
		</td>	
		<td>
		  <s:select label="模块类型" key="typeId" cssClass="digits " value="%{model.typeId}" required="false" list="#{1:'系统菜单',2:'栏目菜单',3:'内容菜单'}"  listKey="key"  listValue="value"/>  
		</td>
	</tr>
	<tr>	
		<td class="tdlabel">
			状态<span class="required">*</span>:
		</td>	
		<td>
		  <s:radio list='#{true:"启用",false:"停用"}'  key="status" value="%{model.status}" cssClass=" " required="true"></s:radio> 
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
		  <s:textfield label="排序字段" key="sortOrder" value="%{model.sortOrder}" cssClass="required digits" required="true" />
	    </td>
	</tr>
	
