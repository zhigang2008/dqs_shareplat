<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />
	<s:hidden id="zmCode" name="zmCode" value="%{model.zmCode}" />
	<s:hidden id="stationCode" name="stationCode" value="%{model.stationCode}"/>

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			台站编号:
		</td>	
		<td>
		  <s:textfield label="台站编号" key="stationId" value="%{model.stationId}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			观测时间<span class="required">*</span>:
		</td>	
		<td>
		<input value="${model.timeString}" onclick="WdatePicker({dateFmt:'<%=TemperatureInfo.FORMAT_TIME%>'})" id="timeString" name="timeString"  maxlength="0" class="Wdate required " />
		</td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			温度<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="温度" key="temperature" value="%{model.temperature}" cssClass="required number " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			年度:
		</td>	
		<td>
		  <s:textfield label="年度" key="dataYear" value="%{model.dataYear}" cssClass="" required="false" />
	    </td>
	</tr>
	
