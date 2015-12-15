<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/meta.jsp" %>
<script src="<s:url value="/script/jquery-form.js"/>" type="text/javascript"></script>
<script	src="<s:url value="/script/validation/jquery.validate.min.js"/>"	type="text/javascript"></script>
<script	src="<s:url value="/script/validation/additional_methods.js"/>"	type="text/javascript"></script>
<script	src="<s:url value="/script/validation/messages_cn.js"/>"	type="text/javascript"></script>
<script type="text/javascript"> 
        $(document).ready(function() {
        	 //ajax提交表单配置
        	var options = { 
        	        success:  afterAction,  // post-submit callback 
        	        dataType:  "json",        // 'xml', 'script', or 'json' (expected server response type) 
        	        resetForm: false        // reset the form after successful submit 
        	    };
    	    
            //表单验证
            var v = $("#regform").validate({
            	debug: false,
            	errorPlacement: function(error, element) {
            		error.insertAfter(element.parent().find('label:first'));
            	}, 
            	success: function(label) {
            		// set &nbsp; as text for IE
            		label.html("&nbsp;").addClass("ok");
            	} ,
            	submitHandler: function(form) {
            		$(form).ajaxSubmit(options);
            	},
    			rules: {
    				id: {
    					required: true
    					//,	email:true
    				},
    				email:{
    					required: true
    					,	email:true
    				}
				
    			},
    			messages: {
    				id: {
					  required: "缺少用户名"
						// ,  email:"请以邮件地址为用户名"
				     },
				     email:{
				    	 required: "缺少邮件地址"
						,  email:"非法的邮件格式"
				     }
  
    			}
			
          });
        });
        
        //提交后提示信息
        function afterAction(data)  { 
            var jsonData=data;
            if(jsonData.success){
            	$("#btnDiv").hide();
            	$("#tipDiv").html("申请成功,请进入您的信箱进行查收.");
        	  $("#tipDiv").fadeIn("slow");
            }
            else{
            	$("#tipDiv").html(jsonData.message);
            }

        } 
</script>
<title>忘记密码-确认邮件地址</title>
</head>
<body>
<div id="top" >
		<div id="header_back"  class="wrapper" onclick="javascript:location.href='<c:url value="/" />';"  style="cusor:pointer" >
			<!-- Title/Logo  -->
			<div id="header_title" >
			<!-- 
			<img src="<c:url value="/image/main/logo.png" />" alt="网站LOGO" width="50" height="50"/>
			<span>国家地震科学数据共享中心</span>
			-->
			&nbsp;
			</div>
</div>	
</div>	
<div class="wrapper" style="margin-top:50px;">
		<div id="top_div"  >
		 <div style="width:50%">
	     <s:actionmessage	cssClass="tipbox tipbox-info" />
	      <s:actionerror cssClass="tipbox tipbox-error" />
        </div>
   <div class="cl register">
   <s:form id="regform" name="regform"  action="sendResetPasswordEmail" namespace="/member"  method="post">
        <s:token />
    <fieldset>
	<legend >请确认这是您账户登记的邮件地址</legend>
    <s:hidden id="userid" name="userid" value="%{model.userid}"></s:hidden>
	<p>
	<label class="required" for="email">邮件地址:</label>
    <br>
    <s:textfield id="email" cssClass="half valid " cssStyle="height:20px;line-height:20px;font-size:14px;padding-left:15px;"  name="email" value="%{model.email}" readonly="true"/>
</p>
	<div id="btnDiv">
	 <a href="javascript:history.back();" id="btn_cancle" class="main-btn" > &nbsp;否&nbsp;  </a>
     or
     <input id="btn_submit" class="main-btn btn-green" type="submit" value="是 ">
    </div>
						
	</fieldset>
</s:form>
   <div id="tipDiv" style="min-height:50px;padding:10px;"></div>
	</div>
</div>
</div>

	<div class="cl" ></div>
	<div id="bottom" style="margin-top:120px;">
		<div class="wrapper">
			<p>京ICP备05014806号  &nbsp; Copyright &copy; 2003~2012 <b><a href="#" title="地壳应力研究所">中国地震局地壳应力研究所</a></b>
			</p>
			<p>地址：北京西三旗安宁庄路1号（北京2855信箱）  邮编：100085</p>
            <p>Tel:010-62936875  Email:fanny28@163.com</p>
		</div>
	</div>
</body>
</html>