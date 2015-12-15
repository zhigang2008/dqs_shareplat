<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<s:head />
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
    			*/
    			rules: {
    				stationCode: {
					required: true,
					maxlength:30,
					lettersonly:true,
					nowhitespace:true,
					remote:{
                           url:"<s:url value="/remoteCheck/BoreholeStation/checkExistStation.do"/>",
                           type: "post",
                           data:{stationCode: function() { return $("#stationCode").val();} } 
                         }
				   }
    			},
    			messages: {
    				stationCode: {
    					required: "请填写字母形式的台站编号",
    					maxlength:"30个字符以下",
    					lettersonly:"只允许字母形式",
    					nowhitespace:"不允许空白字符",
    					remote:"该台站已存在,请确认或者换个编码"
    				}
    			}
			
          });

		$.getJSON("<c:url value="/biz/BoreholeStation/getStandardProvinces.do"/>",function(myJSON){ 
				 var myOptions0=""; 
				 for(var i=0;i<myJSON.length;i++){ 
				      myOptions0 += '<option value="' + myJSON[i].zmCode + '">' +myJSON[i].regionName + '</option>'; 
				     }                          
				  $("#provinceCode").empty();         
				  $("#provinceCode").html(myOptions0); 
				  $("#provinceCname").val($("#provinceCode option:selected").text());
		});

		 $("#provinceCode").change(function(){ 
			 if($(this).val()!=null){ 
		      $("#provinceCname").val($("#provinceCode option:selected").text()); 
			 }
			}); 
        });
</script>          
<title>钻孔应变台站信息新增</title>
</head>

<body>
    <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>钻孔应变台站信息 -> 新增</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<s:form id="myForm" action="/biz/BoreholeStation/save.do" method="post">
		<div id="controlbuttons" class="buttons">
               <button id="submitButton" name="submitButton" type="submit"  class="positive">
                 <img src="<c:url value="/image/form/ok.gif"/>" alt="" /> 提交
               </button>
               <button type="button" class="regular" name="backlist" onclick="window.location='${ctx}/biz/BoreholeStation/list.do'" >
                 <img src="<c:url value="/image/form/grid.gif"/>" alt="" /> 返回列表
               </button> 
               <button type="button" class="regular" name="backpage" onclick="history.back();">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 取消
               </button> 
        </div>
        <div class="cl"></div>
        <div id="formdiv" >
        <p>台站基本信息:</p>
		<table id="formtable" class="formtable">
		<tr>	
		 <td class="tdlabel">省份</td>	
		 <td> <select  id="provinceCode" name="provinceCode"  /></td>
		 <td>
		  <s:hidden label="省份" key="provinceCname" id="provinceCname" name="provinceCname" />
	    </td>
		<td class="tdlabel">
			台站名称:<span class="required">*</span>
		</td>	
		<td>
		  <s:textfield label="台站名称" key="stationCname" id="stationCname" name="stationCname" value="%{model.stationCname}" cssClass="required" required="false" />
	    </td>
		<td class="tdlabel">
			台站代码<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="台站代码" key="stationCode" id="stationCode" name="stationCode" value="%{model.stationCode}" cssClass="required " required="true" />
	    </td>
	</tr>
		</table>
		<p>观测项信息:</p>
		<s:optiontransferselect
     label="观测项选择"
     name="standardItems"
     id="standardItems"
     leftTitle="所有标准观测项"
     rightTitle="该台站的观测项"
     list="%{baseCode.boreholeStationItem}"
     listKey="code" 
     listValue="name" 
     multiple="true"
     emptyOption="false"
     allowUpDownOnLeft="false"
     allowUpDownOnRight="false"  
     doubleId="stationItems"
     doubleName="stationItems"
     doubleList="{}"
     doubleListKey="code"
     doubleListValue="name" 
     doubleHeaderKey="doubleHeaderKey"
     doubleHeaderValue="--- Please Select ---"
     doubleEmptyOption="false"
     doubleMultiple="true"
     cssClass="" 
     cssStyle="height:300px;" 
     doubleCssStyle="height:300px;" 
     />
		<!--
		<s:checkboxlist id="items" name="items" list="%{baseCode.boreholeStationItem}" listKey="code" listValue="name"></s:checkboxlist>
		-->
		</div>
	</s:form>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>