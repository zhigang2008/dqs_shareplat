<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/meta.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册成功</title>
<style type="text/css">
td,p,li,div,select,input,body {font-size:12px;}
</style>
</head>
<body topmargin="5" bgcolor="#ffffff" marginheight="5">
<center>
<!--  
<table border="0" cellpadding="0" cellspacing="0" width="750"><tbody><tr><td width="25"></td><td align="left"><img src="<c:url value="/images/logo.jpg"/>"></td>
      <td align="right" valign="bottom">&nbsp;</td>
      <td align="left" width="20"></td></tr></tbody></table>
 -->
<table border="0" cellpadding="0" cellspacing="0" width="750" height="15"><tbody><tr><td ></td></tr></tbody></table>
<table border="0" cellpadding="0" cellspacing="0" width="750" height="1"><tbody><tr><td class="bg02"></td></tr></tbody></table>
<table border="0" cellpadding="0" cellspacing="0" width="750" height="9"><tbody><tr><td class="bg02" width="1"></td><td class="bg01" width="748"></td><td class="bg02" width="1"></td></tr></tbody></table>

<table border="0" cellpadding="0" cellspacing="0" width="750">
	<tbody>
		<tr>
			<td class="bg02" width="1"></td>
			<td class="bg01" width="8"></td>
			<td align="center" valign="top" width="732">
			<table border="0" cellpadding="0" cellspacing="0" width="700">
				<tbody>
					<tr>
						<td class="lr" align="left" valign="top"> 
						<center><strong> 注册成功</strong></center>
 	               </tr>
 	               <tr>
						<td class="lr" align="left" valign="top"> 
						<center><strong> &nbsp;</strong></center>
 	               </tr>
 	               <tr>
						<td class="lr" align="left" valign="top"> 
						<s:url id="loginUrl" value="/login.jsp" />
			        	
						<center><strong> <s:a href="%{loginUrl}">登录系统</s:a></strong></center>
 	               </tr>
				</tbody>
			</table>
			<br>
			<table border="0" cellpadding="0" cellspacing="0" width="700">
				<tbody>
					<tr>
						<td align="middle">
						<div align="center"><input name="Submit2" class="button01"
							style="padding: 3px; width: 150px; height: 25px;"
							onClick="window.close(this)" value="关闭本页" type="submit">
						</div>
						</td>
					</tr>
				</tbody>
			</table>
			</td>
			<td class="bg01" width="8"></td>
			<td class="bg02" width="1"></td>
		</tr>
	</tbody>
</table>


</center>
</body>
</html>