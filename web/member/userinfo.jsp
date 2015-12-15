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
    			//success: function(label) {
    			//	label.text("OK!").addClass("success");
    			//},
    			//errorContainer: $("#warning, #summary"),
    			//errorPlacement: function(error, element) {
    			//    error.appendTo( element.parent("div").find("div") );
    			//},
    			
    			//(Demo)可以通过在此处添加校验规则和校验信息,默认已经通过字段的CSS样式添加了校验信息.
    			rules: {
    				realName: {
    					required: true
    				},
    				email:{
    					email: true
    				}
 			},

	           messages : {
					realName : {
						required : "请补充真实姓名"
					},
					email : {
						email : "请输入正确格式的电子邮件地址"
					}

				}

			});
		});
</script>
<title>修改用户信息</title>
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<div id="pagetitle">
		<div class="wrapper">
			<h1>用户信息</h1>
		</div>
	</div>
	<!-- End of Page title -->
<div id="content" class="cl wrapper">
<!-- Page content -->
<s:form id="regform" name="regform"
	action="updateUserInfo" namespace="/member" method="post">
	<s:token />
	<s:hidden name="userid"	value="%{#session.CURRENT_USER.userid}"></s:hidden>
	<fieldset>
	<div id="tipbox">
	  <s:actionmessage	cssClass="tipbox tipbox-info" />
	  <s:actionerror cssClass="tipbox tipbox-error" />
	</div>
	<dl>
		<dt>真实姓名：</dt>
		<dd><s:textfield id="realName" name="realName" value="%{model.realName}" cssClass=" basic-input" />
		</dd>
	</dl>
	<dl>
		<dt>电子邮件：</dt>
		<dd><s:textfield id="email" name="email" value="%{model.email}" cssClass=" basic-input" />
		</dd>
	</dl>
	<dl>
		<dt>手机：</dt>
		<dd><s:textfield id="mobile" name="mobile"	value="%{model.mobile}" cssClass="basic-input " /></dd>
	</dl>
	<dl>
		<dt>电话：</dt>
		<dd><s:textfield id="telphone" name="telphone"	value="%{model.telphone}" cssClass="basic-input " /></dd>
	</dl>
	<dl>
		<dt>住址：</dt>
		<dd><s:textfield id="address" name="address"	value="%{model.address}" cssClass="basic-input " /></dd>
	</dl>
	<dl>
		<dt>邮编：</dt>
		<dd><s:textfield id="postcode" name="postcode"	value="%{model.postcode}" cssClass="basic-input " /></dd>
	</dl>
	<s:submit value="  更  新  " cssClass="main-btn btn-green big"></s:submit></fieldset>

</s:form>
</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>