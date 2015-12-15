<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="seqno" name="seqno" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			用户ID<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="用户ID" key="userid" value="%{model.userid}" cssClass="required digits " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			用户姓名:
		</td>	
		<td>
		  <s:textfield label="用户姓名" key="userName" value="%{model.userName}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			下载时间<span class="required">*</span>:
		</td>	
		<td>
		<input value="${model.downloadTimeString}" onclick="WdatePicker({dateFmt:'<%=DownloadRecord.FORMAT_DOWNLOAD_TIME%>'})" id="downloadTimeString" name="downloadTimeString"  maxlength="0" class="Wdate required " />
		</td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			文件目录:
		</td>	
		<td>
		  <s:textfield label="文件目录" key="fileCatalog" value="%{model.fileCatalog}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			文件名称:
		</td>	
		<td>
		  <s:textfield label="文件名称" key="fileName" value="%{model.fileName}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			来源IP:
		</td>	
		<td>
		  <s:textfield label="来源IP" key="fromip" value="%{model.fromip}" cssClass="" required="false" />
	    </td>
	</tr>
	
