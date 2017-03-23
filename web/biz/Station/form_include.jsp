<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<tr>	
		<td class="tdlabel">
			地区<span class="required">*</span>:
		</td>	
		<td>
		  <s:select label="地区" key="regionCode" value="%{model.regionCode}" cssClass="required " required="true" list="%{baseCode.region}"  listKey="regionCode"  listValue="regionName"/>
	    </td>
	</tr>
	<!-- 系统自动获取 
	<tr>	
		<td class="tdlabel">
			地区简写代码:
		</td>	
		<td>
		  <s:textfield label="地区简写代码" key="zmCode" value="%{model.zmCode}" readonly="yes" cssClass="" required="false" />
	    </td>
	</tr>
	-->
	<tr>	
		<td class="tdlabel">
			编号<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="编号" key="code" value="%{model.code}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			名称<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="名称" key="name" value="%{model.name}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			经度:
		</td>	
		<td>
		  <s:textfield label="经度" key="longitude" value="%{model.longitude}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			纬度:
		</td>	
		<td>
		  <s:textfield label="纬度" key="latitude" value="%{model.latitude}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			海拔:
		</td>	
		<td>
		  <s:textfield label="海拔" key="hight" value="%{model.hight}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			位置:
		</td>	
		<td>
		  <s:textfield label="位置" key="unit" value="%{model.unit}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			钻孔类型:
		</td>	
		<td>
		  <s:select label="钻孔类型" key="wellTypeCode" value="%{model.wellTypeCode}" cssClass="digits " required="false" list="%{baseCode.wellType}"  listKey="code"  listValue="name" />
 
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			钻孔深度:
		</td>	
		<td>
		  <s:textfield label="钻孔深度" key="wellDepth" value="%{model.wellDepth}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			观测深度:
		</td>	
		<td>
		  <s:textfield label="观测深度" key="observateDepth" value="%{model.observateDepth}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			岩性:
		</td>	
		<td>
		  <s:textfield label="岩性" key="lithology" value="%{model.lithology}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			温度:
		</td>	
		<td>
		  <s:textfield label="温度" key="temperature" value="%{model.temperature}" cssClass="digits " required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			观测时间:
		</td>	
		<td>
		  <s:textfield label="观测时间" key="observateTime" value="%{model.observateTime}" cssClass="" required="false" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			台站类型:
		</td>	
		<td>
		  <s:select label="台站类型" key="stationTypeCode" value="%{model.stationTypeCode}" cssClass="digits " required="false" list="%{baseCode.stationType}"  listKey="code"  listValue="name"  />
		  	  
	    </td>
	</tr>
	
