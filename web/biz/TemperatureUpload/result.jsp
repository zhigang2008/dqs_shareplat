<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<title>钻孔地温数据信息</title>
</head>

<body>
<!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>钻孔地温数据 -> 数据导入结果</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<div class="showdetail"> 
		<div id="controlbuttons" class="buttons">
               <button type="button" class="regular" name="backlist" onclick="window.location='${ctx}/biz/TemperatureUpload/upload.do'" >
                 <img src="<c:url value="/image/form/grid.gif"/>" alt="" /> 继续导入
               </button> 
               <button type="button" class="regular" name="backpage" onclick="window.location='${ctx}/'">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 返回主页
               </button> 
        </div>
        <div class="cl"></div>
        <div id="formdiv" >
        <p>执行结果:</p>
          <s:if test="hasActionMessages()">
            <div class="tipbox-error">
              <s:actionmessage/>
            </div>
          </s:if>
          <s:else>
              <div class="tipbox-info">
                                       数据已经成功导入!
              </div>
          </s:else>
		 </div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>
