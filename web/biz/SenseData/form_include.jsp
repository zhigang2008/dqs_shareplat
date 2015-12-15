<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="seqno" name="seqno" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
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
			文件名:
		</td>	
		<td>
		  <s:textfield label="文件名" key="fileName" value="%{model.fileName}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			上传时间<span class="required">*</span>:
		</td>	
		<td>
		<input value="${model.insertTimeString}" onclick="WdatePicker({dateFmt:'<%=SenseData.FORMAT_INSERT_TIME%>'})" id="insertTimeString" name="insertTimeString"  maxlength="0" class="Wdate required " />
		</td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			浏览数:
		</td>	
		<td>
		  <s:textfield label="浏览数" key="viewCount" value="%{model.viewCount}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			下载量:
		</td>	
		<td>
		  <s:textfield label="下载量" key="downloadCount" value="%{model.downloadCount}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			备注:
		</td>	
		<td>
		  <s:textfield label="备注" key="remark" value="%{model.remark}" cssClass="" required="false" />
	    </td>
	</tr>
	
