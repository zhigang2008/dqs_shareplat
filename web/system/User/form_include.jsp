<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="userid" name="userid" />
<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			用户名<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="用户名" key="userName" value="%{model.userName}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			用户类型:
		</td>	
		<td>
		  <s:select label="用户类型" key="userTypeId" cssClass="digits " value="%{model.userTypeId}" required="false" list="%{baseCode.userType}"  listKey="code"  listValue="name"/>  
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			真实姓名:
		</td>	
		<td>
		  <s:textfield label="真实姓名" key="realName" value="%{model.realName}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			邮件:
		</td>	
		<td>
		  <s:textfield label="邮件" key="email" value="%{model.email}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			证件类型:
		</td>	
		<td>
		  <s:textfield label="证件类型" key="idType" value="%{model.idType}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			证件号码:
		</td>	
		<td>
		  <s:textfield label="证件号码" key="idCode" value="%{model.idCode}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			移动电话:
		</td>	
		<td>
		  <s:textfield label="移动电话" key="mobile" value="%{model.mobile}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			移动电话2:
		</td>	
		<td>
		  <s:textfield label="移动电话2" key="mobile2" value="%{model.mobile2}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			联系电话:
		</td>	
		<td>
		  <s:textfield label="联系电话" key="telephone" value="%{model.telephone}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			联系电话2:
		</td>	
		<td>
		  <s:textfield label="联系电话2" key="telephone2" value="%{model.telephone2}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			联系地址:
		</td>	
		<td>
		  <s:textfield label="联系地址" key="address" value="%{model.address}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			邮政编码:
		</td>	
		<td>
		  <s:textfield label="邮政编码" key="postcode" value="%{model.postcode}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			头衔职称:
		</td>	
		<td>
		  <s:textfield label="头衔职称" key="title" value="%{model.title}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			是否禁用:
		</td>	
		<td>
		 <s:radio list='#{false:"启用",true:"禁用"}'  key="isDisabled" value="%{model.isDisabled}" cssClass="required " required="true"></s:radio> 
	    </td>
	</tr>
	
