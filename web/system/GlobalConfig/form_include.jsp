<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			参数名称<span class="required">*</span>:
		</td>	
		<td>
		  <s:if test="%{model.isCoreParam==1}">
		     <s:textfield label="参数名称" key="param" value="%{model.param}" cssClass="required " required="true" disabled="true" readonly="readonly"/>
		     (核心参数不可更改参数名)
		   </s:if>
		   <s:else>
		     <s:textfield label="参数名称" key="param" value="%{model.param}" cssClass="required " required="true" />
		   </s:else>

	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			参数值<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="参数值" key="paramValue" value="%{model.paramValue}" cssClass="required " required="true" />
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
	<!--屏蔽掉核心参数设置,默认用户添加是非核心  
	<tr>	
		<td class="tdlabel">
			是否核心参数<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="是否核心参数" key="isCoreParam" value="%{model.isCoreParam}" cssClass="required digits " required="true" />
	    </td>
	</tr>
	-->
	
