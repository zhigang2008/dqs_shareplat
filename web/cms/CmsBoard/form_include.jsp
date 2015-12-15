<%@page import="com.steven.cms.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			留言人<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="留言人" key="userName" value="%{model.userName}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			标题<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="标题" key="title" value="%{model.title}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			内容<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="内容" key="content" value="%{model.content}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			时间<span class="required">*</span>:
		</td>	
		<td>
		<input value="${model.timeString}" onclick="WdatePicker({dateFmt:'<%=CmsBoard.FORMAT_TIME%>'})" id="timeString" name="timeString"  maxlength="0" class="Wdate required " />
		</td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			联系电话:
		</td>	
		<td>
		  <s:textfield label="联系电话" key="phone" value="%{model.phone}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			邮件:
		</td>	
		<td>
		  <s:textfield label="邮件" key="mail" value="%{model.mail}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			回复:
		</td>	
		<td>
		  <s:textfield label="回复" key="reply" value="%{model.reply}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			用户ID:
		</td>	
		<td>
		  <s:textfield label="用户ID" key="userId" value="%{model.userId}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			留言类别:
		</td>	
		<td>
		  <s:textfield label="留言类别" key="msgType" value="%{model.msgType}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			状态<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="状态" key="status" value="%{model.status}" cssClass="required digits " required="true" />
	    </td>
	</tr>
	
