<%@page import="com.steven.cms.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			所属栏目<span class="required">*</span>:
		</td>	
		<td >
		  <s:select label="所属栏目" key="channelId" value="%{model.channelId}"  required="true"  list="%{channels}" listKey="moduleId" listValue="moduleName"/>
	    </td>
	    <td class="tdlabel">
			标识名称:
		</td>	
		<td colspan="3">
		  <s:textfield label="标识名称" key="uname" value="%{model.uname}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			标题<span class="required">*</span>:
		</td>	
		<td colspan="5">
		  <s:textfield label="标题" key="title" value="%{model.title}" cssClass="required " cssStyle="width:95%;" required="true" />
	    </td>
	</tr>
	<tr>	
		<td class="tdlabel">
			作者:
		</td>	
		<td >
		  <s:textfield label="作者" key="author" value="%{model.author}" cssStyle="width:200px;" required="false" />
	    </td>
		<td class="tdlabel">
			发布日期:
		</td>	
		<td>
		<input value="${model.releaseDateString}" onclick="WdatePicker({dateFmt:'<%=CmsContent.FORMAT_RELEASE_DATE%>'})" id="releaseDateString" name="releaseDateString"  maxlength="0" class="Wdate " />
		</td>
		<td class="tdlabel">
			点击数:
		</td>	
		<td>
		  <s:textfield label="点击数" key="hitCount" value="%{model.hitCount}" cssStyle="width:100px;" cssClass="digits " required="false" />
	    </td>
	</tr>
<!-- 
	<tr>	
		<td class="tdlabel">
			类型:
		</td>	
		<td>
		  <s:textfield label="类型" key="typeId" value="%{model.typeId}" cssClass="digits " required="false" />
	    </td>
	</tr>
	 -->
	
	<tr>	
		<td class="tdlabel">
			简述:
		</td>	
		<td colspan="5">
		  <s:textarea label="简述" key="description" value="%{model.description}" cssClass="" cssStyle="width:90%;" required="false" />
	    </td>
	</tr>
	<tr>	
		<td class="tdlabel">
			正文:
		</td>	
		<td colspan="5">
		  <s:textarea  id="contentTxt" name="contentTxt.txt"  cssStyle="width:90%;" value="%{model.contentTxt.txt}" ></s:textarea>
	    </td>
	</tr>
	
