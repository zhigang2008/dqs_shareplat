<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>File Not Found</title>
</head>

<body>
<script type="text/javascript">
 alert("该文件已不存在!");
 history.back();
</script>
<div>
	<h1><span>该文件已不存在!</span></h1>

	<div><a href="javascript:history.back();">返回</a></div>
</div>
</body>
</html>