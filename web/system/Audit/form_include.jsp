<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			用户id<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="用户id" key="userid" value="%{model.userid}" cssClass="required digits " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			用户名:
		</td>	
		<td>
		  <s:textfield label="用户名" key="userName" value="%{model.userName}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			登录时间<span class="required">*</span>:
		</td>	
		<td>
		<input value="${model.actTimeString}" onclick="WdatePicker({dateFmt:'<%=Audit.FORMAT_ACT_TIME%>'})" id="actTimeString" name="actTimeString"  maxlength="0" class="Wdate required " />
		</td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			登录ip:
		</td>	
		<td>
		  <s:textfield label="登录ip" key="actIp" value="%{model.actIp}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			登录状态<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="登录状态" key="actStatus" value="%{model.actStatus}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			操作类型:
		</td>	
		<td>
		  <s:textfield label="操作类型" key="actType" value="%{model.actType}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			备注:
		</td>	
		<td>
		  <s:textfield label="备注" key="notes" value="%{model.notes}" cssClass="" required="false" />
	    </td>
	</tr>
	
