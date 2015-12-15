<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>地应力数据表2015</title>
<%@ include file="/commons/meta.jsp" %>
<link href="<c:url value="/style/bootstrap.min.css"/>" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<c:url value="/script/bootstrap.min.js"/>"></script>
</head>

<body>
    <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>地应力数据表2015</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<br />
	       <wylb:lacksRole name="role_member">
	        <div class="label label-warning"><a href="<c:url value="/logout.do"/>">[注册会员登录后可下载数据]</a></div>
	       </wylb:lacksRole>

		<table  class="table table-bordered">
		  <thead>
			  <tr>
				<th >序号</th>
				<th >数据表</th>
				<th >数据使用说明</th>
			  </tr>
		  </thead>
		  <tbody>
		     <tr>
		        <td>1</td>
		        <td>断层滑动数据表<wylb:hasAnyRoles name="role_member,role_admin"><a href="<c:url value="/biz/EarthStress/downloadfile.do?fileCatalog=地壳应力-分类下载&fileName=断层滑动数据表.xlsx"/>">【下载】</a></wylb:hasAnyRoles></td>
		        <td><a href="${ctx}/support/download.do?fileCatalog=地壳应力-分类下载&fileName=断层滑动数据表说明&filePath=/u/file/earth_stress/断层滑动数据表说明.doc">断层滑动数据表说明</a></td>
		     </tr>
		     <tr>
		        <td>2</td>
		        <td>水压致裂数据表<wylb:hasAnyRoles name="role_member,role_admin"><a href="<c:url value="/biz/EarthStress/downloadfile.do?fileCatalog=地壳应力-分类下载&fileName=水压致裂应力测试数据表.xlsx"/>">【下载】</a></wylb:hasAnyRoles></td>
		        <td><a href="${ctx}/support/download.do?fileCatalog=地壳应力-分类下载&fileName=水压致裂数据表说明&filePath=/u/file/earth_stress/水压致裂数据表说明.doc">水压致裂数据表说明</a></td>
		     </tr>
		     <tr> 
		        <td>3</td>
		        <td>应力解除数据表<wylb:hasAnyRoles name="role_member,role_admin"><a href="<c:url value="/biz/EarthStress/downloadfile.do?fileCatalog=地壳应力-分类下载&fileName=应力解除测试数据表.xlsx"/>">【下载】</a></wylb:hasAnyRoles></td>
		        <td><a href="${ctx}/support/download.do?fileCatalog=地壳应力-分类下载&fileName=应力解除数据表说明&filePath=/u/file/earth_stress/应力解除数据表说明.doc">应力解除数据表说明</a></td>
		      </tr>
		     <tr>
		      <td>4</td>
		        <td>震源机制解数据表<wylb:hasAnyRoles name="role_member,role_admin"><a href="<c:url value="/biz/EarthStress/downloadfile.do?fileCatalog=地壳应力-分类下载&fileName=震源机制解数据表.xlsx"/>">【下载】</a></wylb:hasAnyRoles></td>
		        <td><a href="${ctx}/support/download.do?fileCatalog=地壳应力-分类下载&fileName=震源机制解数据表说明&filePath=/u/file/earth_stress/震源机制解数据表说明.doc">震源机制解数据表说明</a></td>
		      </tr>
		     <tr>
		     <td>5</td>
		        <td>钻孔崩落数据表<wylb:hasAnyRoles name="role_member,role_admin"><a href="<c:url value="/biz/EarthStress/downloadfile.do?fileCatalog=地壳应力-分类下载&fileName=钻孔崩落数据表.xlsx"/>">【下载】</a></wylb:hasAnyRoles></td>
		        <td><a href="${ctx}/support/download.do?fileCatalog=地壳应力-分类下载&fileName=钻孔崩落数据表说明&filePath=/u/file/earth_stress/钻孔崩落数据表说明.doc">钻孔崩落数据表说明</a></td>
		     </tr>
		  </tbody>
		</table>
		<p><a href="${ctx}/support/download.do?fileCatalog=地壳应力-分类下载&fileName=应力分区详解&filePath=/u/file/earth_stress/应力分区详解.doc">[应力分区详解]</a></p>
		
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->

</body>
</html>


