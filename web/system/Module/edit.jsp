<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<title>Module编辑</title>
<script src="<c:url value="/script/jquery-form.js"/>" type="text/javascript"></script>
<script	src="<c:url value="/script/validation/jquery.validate.min.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/additional_methods.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/messages_cn.js"/>"	type="text/javascript"></script>
<script type="text/javascript"> 
        $(document).ready(function() {

            //ajax提交表单配置
        	var options = { 
        	        success:  afterAction,  // post-submit callback 
        	        dataType:  "json",        // 'xml', 'script', or 'json' (expected server response type) 
        	        resetForm: false        // reset the form after successful submit 

           	        //target:"tipdiv",         // target element(s) to be updated with server response 
        	        //beforeSubmit:  validate,  // pre-submit callback 
        	        // other available options: 
        	        //url:       url         // override for form's 'action' attribute 
        	        //type:      type        // 'get' or 'post', override for form's 'method' attribute 
       	            //clearForm: true        // clear all form fields after successful submit 
        	        // $.ajax options can be used here too, for example: 
        	        //timeout:   3000 
        	    };

            //表单验证
    		var v = $("#myForm").validate({
    			submitHandler: function(form) {
    				$(form).ajaxSubmit(options);
    		    },
    		    rules: {
    				status: "required"
    				},
    			messages: {
    				status: "请选择状态"
    			}

    		});
        	
        });

        //提交后提示信息
        function afterAction(data)  { 
            if(data.success){
        	   $("#_tipdiv").html("更新节点成功!");
        	   $("#_tipdiv").show();
        	   $("#_tipdiv").fadeOut(1000);
               //刷新父窗口
        	   parent.freshNode("<s:property value="model.parent"></s:property>");
        	   parent.closePopup();
        	   
            }
            else{
            	$("#_tipdiv").html(data.message);
            	$("#_tipdiv").show();
            	$("#_tipdiv").fadeIn(1000);
            }

        } 
    </script> 
</head>

<body>
	  <s:form id="myForm" action="/system/Module/jsonUpdate.do" method="post">
		<div id="controlbuttons" class="buttons">
               <button id="submitButton" name="submitButton" type="submit"  class="positive">
                 <img src="<c:url value="/image/form/ok.gif"/>" alt="" /> 保存
               </button>
        </div>
        
        <div class="cl"></div>
        <div id="_tipdiv" ></div>
        <div class="cl"></div>
        <div id="formdiv" >
        <p>请填写以下内容:</p>
		<table id="formtable" class="formtable">
		<%@ include file="form_include.jsp" %>
		</table>
		</div>
	</s:form>
</body>