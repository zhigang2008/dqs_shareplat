<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp"%>
<html>
<head>
<%@ include file="/commons/meta.jsp" %>
<title>首页</title>

</head>

<body>
<wylb:user>
<%
    response.sendRedirect("main.do");

%>
<wylb:principal></wylb:principal>
</wylb:user>
<wylb:guest>
<% 
response.sendRedirect("login.do");
%>
</wylb:guest>

</body>
</html>


