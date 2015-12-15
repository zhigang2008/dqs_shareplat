<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>


<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			文件目录<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="文件目录" key="fileCatalog" value="%{model.fileCatalog}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			文件名称<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="文件名称" key="fileName" value="%{model.fileName}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			下载数量<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="下载数量" key="downloadCount" value="%{model.downloadCount}" cssClass="required digits " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			最近更新时间:
		</td>	
		<td>
		<input value="${model.updateTimeString}" onclick="WdatePicker({dateFmt:'<%=DownloadData.FORMAT_UPDATE_TIME%>'})" id="updateTimeString" name="updateTimeString"  maxlength="0" class="Wdate " />
		</td>
	</tr>
	
