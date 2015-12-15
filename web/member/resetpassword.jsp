<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/meta.jsp" %>
<title>密码重置</title>
<style type="text/css">
ul{
    list-style: none;
}
.tipbox{
   border:0px;
}
</style>
</head>
<body>
<div class="wrapper" >
		<div id="top_div"  style="margin-top:80px;min-height:100px;">
		 <div >
	     <s:actionmessage	cssClass="tipbox tipbox-info" />
	      <s:actionerror cssClass="tipbox tipbox-error" />
        </div>
</div>
</div>
</body>
</html>