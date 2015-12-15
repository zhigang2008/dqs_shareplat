<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<title>钻孔应变数据信息</title>
<script type="text/javascript">
function doImport(){
   <s:if test="dataOk==true">
      <s:if test="dataExist==true">
    	      if(confirm("该阶段的数据已经存在,继续导入将覆盖原有数据,确定导入?")){
    	    	  window.location="${ctx}/biz/BoreholeStrainUpload/importData.do";
    	      }
    	      else{}
      </s:if>
      <s:else>
        window.location="${ctx}/biz/BoreholeStrainUpload/importData.do";
      </s:else>
   </s:if>
  <s:else>
      alert("测量值数量与该时间段不匹配,导入操作被中止.请确认导入数据!");
  </s:else>
}
</script>
</head>

<body>
<!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>钻孔应变数据 -> 数据导入预览</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<div class="showdetail"> 
		<div id="controlbuttons" class="buttons">
               <button type="button" class="regular" name="backpage" onclick="window.location='${ctx}/biz/BoreholeStrainUpload/upload.do'">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 返回上一步
               </button> 
               <button type="button" class="regular" name="backlist" onclick="javascript:doImport();" >
                 <img src="<c:url value="/image/form/grid.gif"/>" alt="" /> 确定
               </button> 
        </div>
        <div class="cl"></div>
        <div id="formdiv" >
        
        <p>${provinceCname}-${stationCname }-${itemCname}  [${dataYear}年${dataMonth}月]</p>
        <s:if test="dataExist==true">
        <div class="tipbox-warning">注意:该阶段的数据已经存在,继续导入将覆盖原有数据</div>
        </s:if>
        <s:if test="dataOk==false">
        <div class="tipbox-error">注意:测量值数量与该时间段不匹配,请确认导入数据是否正确.</div>
        </s:if>
        <div>
        <table width="100%"  border="0" cellspacing="0" class="gridBody">
		   <s:iterator value="%{dataList}" id="da" status="dataIndex">
		   <tr>
		     <td align="right" width="100"><s:property value="observeTimeString"/>&nbsp;</td>
		     <td align="left">&nbsp;&nbsp;<s:property value="observeValue"/></td>
		    </tr>
		   </s:iterator>
		   </table>
		</div>   
	</div>
	 </div>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>
