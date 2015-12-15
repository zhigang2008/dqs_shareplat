<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
<script src="<c:url value="/script/validation/jquery.validate.min.js"/>"	type="text/javascript"></script>
<script src="<c:url value="/script/validation/additional_methods.js"/>"	type="text/javascript"></script>
<script src="<c:url value="/script/validation/messages_cn.js"/>"	type="text/javascript"></script>
<script type="text/javascript"> 
        $(document).ready(function() {
            //表单验证
            var v = $("#regform").validate({
            	debug: false,
    			errorElement: "em",
    			success: function(label) {
    				label.text("OK!").addClass("success");
    			},
    			//errorContainer: $("#warning, #summary"),
    			//errorPlacement: function(error, element) {
    			//    error.appendTo( element.parent("div").find("div") );
    			//},
    			
    			//(Demo)可以通过在此处添加校验规则和校验信息,默认已经通过字段的CSS样式添加了校验信息.
    			rules: {
    				oriPwd: {
    					required: true,
    					minlength:6
    				},
    				newPwd:{
    					required: true,
    					minlength:6
    				},
    				password2:{
    					required: true,
    					equalTo:"#newPwd"
    				}
    			},
    			messages: {
				   oriPwd: {
					   required: "请输入原始密码",
					   minlength:"密码长度不低于6位"
				   },
				   newPwd:{
   					required: "请输入新密码",
   					minlength:"密码长度不低于6位"
   				   },
				   password2: {
					   required: "请输入密码",
					   equalTo:"两次输入密码不一致"
				   }

    			}
			
          });
        });
     

</script>
<title>修改密码</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<div id="pagetitle">
		<div class="wrapper">
			<h1>密码修改</h1>
		</div>
	</div>
	<!-- End of Page title -->
<div id="content" class="cl wrapper">
<!-- Page content -->
<s:form id="regform" name="regform"
	action="changePassword" namespace="/member" method="post">
	<s:token />
	<s:hidden name="userid"	value="%{#session.CURRENT_USER.userid}"></s:hidden>
	<fieldset>
	<div id="tipbox">
	  <s:actionmessage	cssClass="tipbox tipbox-info" />
	  <s:actionerror cssClass="tipbox tipbox-error" />
	</div>
	<dl>
		<dt>原始密码：</dt>
		<dd><s:password id="oriPwd" name="oriPwd" cssClass=" basic-input" />
		</dd>
	</dl>
	<dl>
		<dt>新的密码：</dt>
		<dd><s:password id="newPwd" name="newPwd" cssClass=" basic-input" />
		</dd>
	</dl>
	<dl>
		<dt>重复密码：</dt>
		<dd><s:password id="password2" name="password2"	cssClass="basic-input " /></dd>
	</dl>
	<s:submit value="  提 交  " cssClass="main-btn btn-green big"></s:submit></fieldset>

</s:form>
</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>