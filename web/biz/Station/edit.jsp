<%@ page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<script	src="<c:url value="/script/validation/jquery.validate.min.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/additional_methods.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/messages_cn.js"/>"	type="text/javascript"></script>
<script type="text/javascript"> 
        $(document).ready(function() {
            //表单验证
            var v = $("#myForm").validate({

            	/*默认条件即可,如果需要请在下面启用相关选项
            	debug: false,
    			errorElement: "em",
    			success: function(label) {
    				label.text("ok!").addClass("success");
    			},
    			//errorContainer: $("#warning, #summary"),
    			//errorPlacement: function(error, element) {
    			//error.appendTo( element.parent("td").next("td") );
    			//},
    			
    			//(Demo)可以通过在此处添加校验规则和校验信息,默认已经通过字段的CSS样式添加了校验信息.
    			rules: {
    				firstname: "required",
    				lastname: "required",
    				username: {
    					required: true,
    					minlength: 2
    				}
    			},
    			messages: {
    				firstname: "Please enter your firstname",
    				lastname: "Please enter your lastname",
    				username: {
    					required: "Please enter a username",
    					minlength: "Your username must consist of at least 2 characters"
    				}
    			}
			*/
          });
        });
</script>

<title>台站编辑</title>
</head>

<body>
    <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>台站 -> 编辑</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<s:form id="myForm" action="/biz/Station/update.do" method="post">
		<div id="controlbuttons" class="buttons">
               <button id="submitButton" name="submitButton" type="submit"  class="positive">
                 <img src="<c:url value="/image/form/ok.gif"/>" alt="" /> 保存
               </button>
               <button type="button" class="regular" name="backlist" onclick="window.location='${ctx}/biz/Station/list.do'" >
                 <img src="<c:url value="/image/form/grid.gif"/>" alt="" /> 返回列表
               </button> 
               <button type="button" class="regular" name="backpage" onclick="history.back();">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 取消
               </button> 
        </div>
		<div class="cl"></div>
        <div id="formdiv" >
        <p>请填写以下内容:</p>
		<table id="formtable" class="formtable">
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
	<tr>	
		<td class="tdlabel">
			地区简写代码（禁止修改）:
		</td>	
		<td>
		  <s:textfield label="地区简写代码" key="zmCode" value="%{model.zmCode}" readonly="true" cssClass="" required="false" />
	    </td>
	</tr>
	<tr>	
		<td class="tdlabel">
			编号（禁止修改）<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="编号" key="code" value="%{model.code}" readonly="true" cssClass="required " required="true" />
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
	
		</table>
		</div>
	</s:form>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>