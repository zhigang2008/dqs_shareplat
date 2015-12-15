<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="observeTime" name="observeTime" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			台站编号<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="台站编号" key="stationId" value="%{model.stationId}" cssClass="required digits " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			观测值:
		</td>	
		<td>
		  <s:textfield label="观测值" key="observeValue" value="%{model.observeValue}" cssClass="required number " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			年度:
		</td>	
		<td>
		  <s:textfield label="年度" key="colYear" value="%{model.colYear}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			数据表名:
		</td>	
		<td>
		  <s:textfield label="数据表名" key="tableName" value="%{model.tableName}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			数据字段名:
		</td>	
		<td>
		  <s:textfield label="数据字段名" key="columnName" value="%{model.columnName}" cssClass="" required="false" />
	    </td>
	</tr>
	
