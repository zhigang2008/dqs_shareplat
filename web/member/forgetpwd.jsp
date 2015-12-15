<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/meta.jsp" %>
<script	src="<s:url value="/script/validation/jquery.validate.min.js"/>"	type="text/javascript"></script>
<script	src="<s:url value="/script/validation/additional_methods.js"/>"	type="text/javascript"></script>
<script	src="<s:url value="/script/validation/messages_cn.js"/>"	type="text/javascript"></script>
<script type="text/javascript"> 
        $(document).ready(function() {
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
    			rules: {
    				userName: {
    					required: true
    					//,	email:true
    				}
    			},
    			messages: {
    				userName: {
					  required: "请输入用户名"
						 //,  email:"请以邮件地址为用户名"
				     }
  
    			}
			
          });
        });

</script>
<title>忘记密码</title>
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
   <s:form id="regform" name="regform"  action="forgetPassword" namespace="/member"  method="post">
        <s:token />
    <fieldset>
	<legend >账户信息</legend>

	<p>
	<label class="required" for="firstname">用户名:</label>
    <br>
    <input id="userName" class="half valid " style="height:20px;line-height:20px;font-size:14px;padding-left:15px;" type="text" name="userName" value="">
</p>
	<div class="buttons">
	<button id="submitButton" name="submitButton" type="submit"  class="positive">
                 确&nbsp;&nbsp;认
     </button>
    </div>
						
	</fieldset>
</s:form>

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