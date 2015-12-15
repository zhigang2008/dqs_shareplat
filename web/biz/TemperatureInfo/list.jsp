<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>钻孔地温 维护</title>
<%@ include file="/commons/meta.jsp" %>
<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
<script	src="<c:url value="/script/validation/jquery.validate.min.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/additional_methods.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/messages_cn.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/fusion/FusionCharts.js"/>"	type="text/javascript"></script>
<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			<c:if test="${page!=null}">
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
			</c:if>
			//搜索栏收起
			$("#toggle-bar").click(function(oEvent) {
				$("#param-div").toggle("slow");
				$(this).toggleClass("toggle-up");
			});

			var v = $("#queryForm").validate({ 
				rules: {
				dataYear: {
				     digits:true,
		             minlength:4, 
		             maxlength:4
			        }
			     },
			   messages: {
			    	 dataYear: {
				     digits:"请输入四位数的年度",
		             minlength:"请输入四位数的年度" ,
		             maxlength:"请输入四位数的年度"
			        }
			     }
				});

			//台站选择
			//所有省份
				$.getJSON("<c:url value="/biz/Station/getAllProvince.do"/>",function(myJSON){ 
				 var myOptions0=""; 
				 for(var i=0;i<myJSON.length;i++){ 
				      myOptions0 += '<option value="' + myJSON[i].zmCode + '">' +myJSON[i].region.regionName + '</option>'; 
				     }                          
				   $("#zmCode").empty();         
 				   $("#zmCode").html(myOptions0); 
 	 		    <c:choose>
 			       <c:when test="${query.zmCode!=null}">
			        //设置省份           
				   $("#zmCode").val("${query.zmCode}");
				    //设置台站
				    $.getJSON("<c:url value="/biz/Station/getStationInfo.do"/>",{zmCode:'${query.zmCode}'},function(myJSON){ 
				     var myOptions_s=""; 
				    for(var i=0;i<myJSON.length;i++){ 
				    	myOptions_s += '<option value="' + myJSON[i].code + '">' +myJSON[i].name + '</option>'; 
				     }                          
				     $("#stationCode").empty();         
				     $("#stationCode").html(myOptions_s); 
					 $("#stationCode").val("${query.stationCode}");
				    });
				  </c:when>
				  <c:otherwise>
				 //设定选定值
					$("#zmCode").change();
				 </c:otherwise>
				 </c:choose>
				   });
				                              
			//台站 选择
			 $("#zmCode").change(function(){ 
				 if($(this).val()!=null){ 
				 $.getJSON("<c:url value="/biz/Station/getStationInfo.do"/>",{zmCode:$(this).val()},function(myJSON){ 
				 var myOptions=""; 
				 for(var i=0;i<myJSON.length;i++){ 
				      myOptions += '<option value="' + myJSON[i].code + '">' +myJSON[i].name + '</option>'; 
				  }                          
				   $("#stationCode").empty();         
				   $("#stationCode").html(myOptions); 
				   $("#stationCode").change();   
				   });
				 $("#regionName").val($("#zmCode option:selected").text()); 
				 }
				}); 
			 $("#stationCode").change(function(){ 
					$("#stationName").val($("#stationCode option:selected").text()); 
				});
				
			//年度改变
			$("#dataYear").focus(function(){ 
				$("#timeBegin").val("");
				$("#timeEnd").val(""); 
			});
			$("#timeBegin").focus(function(){ 
				$("#dataYear").val(""); 
			});
	        $("#timeEndn").focus(function(){ 
		        $("#dataYear").val(""); 
	        });
	      //画图
			$("#chartButton").toggle(function(){
				$("#chartDiv").show();
				var chart1 = new FusionCharts("<c:url value="/charts/FCF_Line.swf"/>", "chart1Id", "980", "300", "0", "1");		   			
				chart1.setDataXML(chartData);
				chart1.render("chartDiv");
				$("#chartButton").text("隐藏观测曲线");
			},
			function(){
				$("#chartDiv").hide();
				$("#chartButton").text("显示观测曲线");
			});
			
			 <c:if test="${query.chartKeepShow==true}">
			 $("#chartButton").click();
			 </c:if>
		});
	</script>
</head>

<body>
    <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>钻孔地温</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<form id="queryForm" name="queryForm" action="<c:url value="/biz/TemperatureInfo/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend><span id="toggle-bar" class="toggle-down">&nbsp;</span><span>搜索</span></legend>
			<div id="param-div" class="param-div" >
			<table>
			   <tr>
			        <td class="tdLabel">省份</td>	
					<td> <select  id="zmCode" name="zmCode"  class="required"/></td>
					<td class="tdLabel">台站</td>	
					<td>
						<select  id="stationCode" name="stationCode"  class="required" />
					</td>
					<td class="tdLabel">温度</td>		
					<td>
						<input value="${query.temperature}" id="temperature" name="temperature" maxlength="12"  class="digits "/>
					</td>
			    </tr>
				<tr>	
					<td class="tdLabel">年度</td>		
					<td>
						<input value="${query.dataYear}" id="dataYear" name="dataYear" maxlength="10"  class=""/>
					</td>
					<td class="tdLabel">观测时间</td>		
					<td colspan="3">
						<input value="<fmt:formatDate value='${query.timeBegin}' pattern='<%=TemperatureInfo.FORMAT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=TemperatureInfo.FORMAT_TIME%>'})" id="timeBegin" name="timeBegin"  class="Wdate" />
						<input value="<fmt:formatDate value='${query.timeEnd}' pattern='<%=TemperatureInfo.FORMAT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=TemperatureInfo.FORMAT_TIME%>'})" id="timeEnd" name="timeEnd"   class="Wdate"/>
					</td>
				</tr>	
			</table>
			<input type="hidden" id="regionName" name="regionName" value="${query.regionName}"></input>
			<input type="hidden" id="stationName" name="stationName" value="${query.stationName}"></input>
			</div>
		</fieldset>
		<div class="handleControl">
             <div class="buttons">
               <button type="submit" class="regular" name="query" onclick="getReferenceForm(this).action='${ctx}/biz/TemperatureInfo/list.do'" >
                 <img src="<c:url value="/image/form/query.gif"/>" alt="" /> 查询
               </button>
               <!--屏蔽掉新增与删除操作
               <wylb:hasPermission name="TemperatureInfo:create">
               <button type="submit" class="positive" name="additem" onclick="getReferenceForm(this).action='${ctx}/biz/TemperatureInfo/create.do'" >
                 <img src="<c:url value="/image/form/add.gif"/>" alt="" /> 新增
               </button> 
               </wylb:hasPermission>
               <wylb:hasPermission name="TemperatureInfo:delete">
               <button type="button" class="negative" name="deleteitem" onclick="batchDelete('${ctx}/biz/TemperatureInfo/delete.do','items',document.forms.queryForm)">
                 <img src="<c:url value="/image/form/delete.gif"/>" alt="" /> 删除
               </button> 
               </wylb:hasPermission>
               -->
               <button type="button" class="positive" name="chartButton" id="chartButton" title="查询数据后方可显示观测曲线">
                 <img src="<c:url value="/image/form/templates.png"/>" alt="" /> 显示观测曲线
               </button> 
               <s:checkbox name="chartKeepShow" id="chartKeepShow" value="%{#request.query.chartKeepShow}" title="勾选该项则在每次查询时直接显示观测曲线">保持</s:checkbox>
             </div>
		</div>
	</div>
	<div class="cl"></div>
	<div class="gridTable">
	  <div style="text-align:center;font-weight: bold;">${query.regionName} - ${query.stationName}</div>
	  <div id="chartDiv" style="display:none;text-align:center;font-weight: normal;"></div>
        <simpletable:pageToolbar page="${page}">
        <!-- 报表导出,可以添加权限判定 -->
	      <wylb:hasAnyRoles name="role_member,role_admin">
	       <img src="<c:url value="/image/form/icon_pdf.gif"/>" title="导出PDF" alt="导出PDF" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/TemperatureInfo/report.do','PDF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_excel.gif"/>" title="导出Excel" alt="导出excel" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/TemperatureInfo/report.do','XLS');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_rtf.gif"/>" title="导出RTF" alt="导出RTF" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/TemperatureInfo/report.do','RTF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_html.gif"/>" title="导出HTML" alt="导出HTML" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/TemperatureInfo/report.do','HTML');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_xml.gif"/>" title="导出XML" alt="导出XML" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/TemperatureInfo/report.do','XML');"/>
	       </wylb:hasAnyRoles>
	       <wylb:lacksRole name="role_member">
	        [注册会员登录后可下载数据]
	       </wylb:lacksRole>
	    </simpletable:pageToolbar>
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
				<th style="width:1px;">&nbsp;</th>
				<wylb:hasPermission name="TemperatureInfo:edit">
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"/></th>
				</wylb:hasPermission>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="STATION_ID" >台站编号</th>
				<th sortColumn="TIME" >观测时间</th>
				<th sortColumn="TEMPERATURE" >温度</th>
				<th sortColumn="DATA_YEAR" >年度</th>
				<wylb:hasPermission name="TemperatureInfo:edit"><th>操作</th></wylb:hasPermission>
			  </tr>
		  </thead>
		  <tbody>
		      <c:choose>
		       <c:when test="${fn:length(page.result)>0}">
		  	   <c:forEach items="${page.result}" var="item" varStatus="status">
			   <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<wylb:hasPermission name="TemperatureInfo:edit">
				<td><input type="checkbox" name="items" value="id=${item.id}&" /></td>
				</wylb:hasPermission>
				<td><c:out value='${item.stationId}'/>&nbsp;</td>
				<td><c:out value='${item.timeString}'/>&nbsp;</td>
				<td><c:out value='${item.temperature}'/>&nbsp;</td>
				<td><c:out value='${item.dataYear}'/>&nbsp;</td>
				<wylb:hasPermission name="TemperatureInfo:edit">
				<td>
					<!-- 
					<a href="${ctx}/biz/TemperatureInfo/show.do?id=${item.id}&zmCode=${query.zmCode}&stationCode=${query.stationCode}" title="查看" > <img src="<c:url value='/image/form/view.png'/>" alt="查看"  /></a>&nbsp;
					 -->
					
					<a href="${ctx}/biz/TemperatureInfo/edit.do?id=${item.id}&zmCode=${query.zmCode}&stationCode=${query.stationCode}" title="修改" > <img src="<c:url value='/image/form/edit.gif'/>" alt="修改"  /></a>
				</td>
				</wylb:hasPermission>
			  </tr>
		  	  </c:forEach>
		  	  </c:when>
		  	  <c:otherwise>
		  	  <!-- 空表格 -->
		  	  <c:forEach var="nullitem" begin="1" end="4" step="1"  varStatus="nullstatus">
		  	   <tr class="${(nullstatus.count+1) % 2 == 0 ? 'even' : 'odd'}">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<wylb:hasPermission name="TemperatureInfo:edit"><td>&nbsp;</td><td>&nbsp;</td></wylb:hasPermission>
			  </tr>
		  	  </c:forEach>
		  	  </c:otherwise>
		  	  </c:choose>
		  </tbody>
		</table>
		<simpletable:pageToolbar page="${page}"></simpletable:pageToolbar>
	</div>
	</form>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
<script type="text/javascript">
    var chartData="<graph caption='趋势图' outCnvBaseFontSize='12' subcaption='${query.regionName} - ${query.stationName}' xAxisName='时间'  yAxisName='时间(坐标仅显示小时时刻,曲线折点上可查看准确时间与数据)'  showNames='1' showValues='0' rotateNames='1' showColumnShadow='0' animation='1' showAlternateHGridColor='1' AlternateHGridColor='c1dbfa' divLineColor='c1dbfa' divLineAlpha='20' alternateHGridAlpha='5' canvasBgColor='f2f2f2' canvasBorderColor='dae6f5' baseFontColor='333333'>";
    <c:forEach items="${page.result}" var="item" varStatus="status">
     chartData += "<set name='${fn:substring(item.timeString,11,13)}' value='${item.temperature}' hoverText='${item.timeString}'/>";
     </c:forEach>
    chartData +="</graph> "
</script>
</body>
</html>

