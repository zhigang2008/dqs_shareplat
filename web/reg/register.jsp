<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/meta.jsp" %>
<script	src="<c:url value="/script/validation/jquery.validate.min.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/additional_methods.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/messages_cn.js"/>"	type="text/javascript"></script>
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
    				userName: {
    					required: true,
    					email:true,
    					remote:{
	                           url:"<s:url value="/remoteCheck/User/checkExistUser.do"/>",
	                           type: "post",
	                           data:{userName: function() { return $("#userName").val();} } 
	                         }
    				},
    				password: {
    					required: true,
    					minlength:6
    				},
    				password2:{
    					required: true,
    					equalTo:"#password"
    				},
    				realName:{
    					required: true
    				},
    				captchaCode:{
    					required: true
    				},
    				after:{
    					required: true
    				}
    			},
    			messages: {
    				userName: {
					  required: "请输入用户名",
					  email:"请以邮件地址为用户名",
					  remote:"该用户已存在"
				     },
				     password: {
					   required: "请输入密码",
					   minlength:"密码长度不低于8位"
				   },
				   password2: {
					   required: "请输入密码",
					   equalTo:"两次输入密码不一致"
				   },
				   realName:{
   					required: "请输入真实姓名"
   				   },
   				   captchaCode:{
					   required: "请输入验证码"
				   },
				   after:{
   					required: "需阅读并同意我们的协议"
   				   }
  
    			}
			
          });
        });

        
function refreshCheckCode(){
	$("#check_img").removeAttr("src");
	$("#check_img").attr("src","<s:url action='jcaptcha_image' namespace='/' />"+"?rand="+Math.random());	
}

</script>
<title>用户注册</title>
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
<div class="wrapper" >
		<div id="top_div"  >
		 <div style="width:50%">
	     <s:actionmessage	cssClass="tipbox tipbox-info" />
	      <s:actionerror cssClass="tipbox tipbox-error" />
        </div>
        <div class="cl register">
   <s:form id="regform" name="regform"  action="register" namespace="/member"  method="post">
        <s:token />
 			 <fieldset>
	<legend >用户注册</legend>

	 <dl>
	 <dt>用户名称：</dt>
	 <dd>
		<s:textfield   id="userName" name="userName"  cssClass="textinp " />
	 </dd>
	</dl>
	<dl>
	<dt>创建密码：</dt>
	<dd>
		<s:password id="password" name="password"   cssClass="textinp " />
		</dd>
	</dl>
	<dl>
  
	<dt>重复密码：</dt>
	<dd>
		<s:password  id="password2" name="password2"  cssClass="textinp " />
		</dd>
	</dl>
	<dl>
  
	<dt>真实名称：</dt>
	<dd>
		<s:textfield  id="realName" name="realName"  cssClass="textinp  " />
		</dd>
	</dl>
	
	<dl>
	<dt>验证码：</dt>
	<dd>
		<s:textfield  id="captchaCode" name="captchaCode"    cssStyle="float:left;margin-right:10px; width: 130px;"/>
		<span>
		<img id="check_img" style="display: inline-block; " width="80" height="35" src="<s:url action='jcaptcha_image' namespace='/' />"></img>
		<a href="javascript:void(0);" onclick="javascript:refreshCheckCode();">换一换</a></span>
			
	</dd>
   </dl> 
	
	<dl>
	<dt>&nbsp;</dt>
	<dd class="hdagreement"><span>
	<label>
	<input	type="checkbox" checked="checked" id="after" name='after' value="1" /></label>
			我已看过并同意<a	href="${ctx}/reg/regagreement.jsp" target="_blank">《注册协议》</a></span>
	</dd>
	</dl>
	<span ></span>
	<dl>
    <dt>&nbsp;</dt>
			<dd class="hdopen"><input class="btn_register" id="submit" type="submit" value=""></input></dd>
	</dl>
							
			 </fieldset>
</s:form>

		</div>
		</div>
</div>

	<div class="cl" ></div>
	<div id="bottom" style="border-top:0px;">
		<div class="wrapper">
			<p>京ICP备05014806号  &nbsp; Copyright &copy; 2003~2012 <b><a href="#" title="地壳应力研究所">中国地震局地壳应力研究所</a></b>
			</p>
			<p>地址：北京西三旗安宁庄路1号（北京2855信箱）  邮编：100085</p>
            <p>Tel:010-62936875  Email:fanny28@163.com</p>
		</div>
	</div>
</body>
</html>