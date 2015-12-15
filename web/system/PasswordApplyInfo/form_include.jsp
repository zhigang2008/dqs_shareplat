<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="seqno" name="seqno" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			申请账户<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="申请账户" key="userid" value="%{model.userid}" cssClass="required digits " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			申请账户名<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="申请账户名" key="userName" value="%{model.userName}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			申请时间<span class="required">*</span>:
		</td>	
		<td>
		<input value="${model.applytimeString}" onclick="WdatePicker({dateFmt:'<%=PasswordApplyInfo.FORMAT_APPLYTIME%>'})" id="applytimeString" name="applytimeString"  maxlength="0" class="Wdate required " />
		</td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			申请地址:
		</td>	
		<td>
		  <s:textfield label="申请地址" key="applyIp" value="%{model.applyIp}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			有效截止时间:
		</td>	
		<td>
		<input value="${model.deadlineString}" onclick="WdatePicker({dateFmt:'<%=PasswordApplyInfo.FORMAT_DEADLINE%>'})" id="deadlineString" name="deadlineString"  maxlength="0" class="Wdate " />
		</td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			是否有效<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="是否有效" key="isValid" value="%{model.isValid}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			使用时间:
		</td>	
		<td>
		<input value="${model.useTimeString}" onclick="WdatePicker({dateFmt:'<%=PasswordApplyInfo.FORMAT_USE_TIME%>'})" id="useTimeString" name="useTimeString"  maxlength="0" class="Wdate " />
		</td>
	</tr>
	
