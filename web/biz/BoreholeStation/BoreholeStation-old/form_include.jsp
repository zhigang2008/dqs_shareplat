<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			省份代码<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="省份代码" key="provinceCode" value="%{model.provinceCode}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			省份:
		</td>	
		<td>
		  <s:textfield label="省份" key="provinceCname" value="%{model.provinceCname}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			台站代码<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="台站代码" key="stationCode" value="%{model.stationCode}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			台站名称:
		</td>	
		<td>
		  <s:textfield label="台站名称" key="stationCname" value="%{model.stationCname}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			观测项代码<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="观测项代码" key="itemCode" value="%{model.itemCode}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			观测项:
		</td>	
		<td>
		  <s:textfield label="观测项" key="itemCname" value="%{model.itemCname}" cssClass="" required="false" />
	    </td>
	</tr>
	
