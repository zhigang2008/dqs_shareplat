<%@page import="com.dqs.biz.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>钻孔应变数据 维护</title>
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
				colYear: {
				     digits:true,
		             minlength:4, 
		             maxlength:4
			        }
			     },
			   messages: {
			    	 colYear: {
				     digits:"请输入四位数的年度",
		             minlength:"请输入四位数的年度" ,
		             maxlength:"请输入四位数的年度"
			        }
			     }
				});
				
			//所有省份
				$.getJSON("<c:url value="/biz/BoreholeStation/getAllProvince.do"/>",function(myJSON){ 
				 var myOptions0=""; 
				 for(var i=0;i<myJSON.length;i++){ 
				      myOptions0 += '<option value="' + myJSON[i].provinceCode + '">' +myJSON[i].provinceCname + '</option>'; 
				     }                          
				   $("#provinceCode").empty();         
 				   $("#provinceCode").html(myOptions0); 

 	 		    <c:choose>
 			       <c:when test="${query.provinceCode!=null}">
			        //设置省份           
				   $("#provinceCode").val("${query.provinceCode}");
				    //设置台站
				    $.getJSON("<c:url value="/biz/BoreholeStation/getStationInfo.do"/>",{provinceCode:'${query.provinceCode}'},function(myJSON){ 
				     var myOptions_s=""; 
				    for(var i=0;i<myJSON.length;i++){ 
				    	myOptions_s += '<option value="' + myJSON[i].stationCode + '">' +myJSON[i].stationCname + '</option>'; 
				     }                          
				     $("#tableName").empty();         
				     $("#tableName").html(myOptions_s); 
					 $("#tableName").val("${query.tableName}");
				    });
					//设置观测项
					$.getJSON("<c:url value="/biz/BoreholeStation/getItemInfo.do"/>",{stationCode:'${query.tableName}'},function(myJSON){ 
				    var myOptions_i=""; 
				    for(var i=0;i<myJSON.length;i++){ 
				    	myOptions_i += '<option value="' + myJSON[i].itemCode + '">' +myJSON[i].itemCname + '</option>'; 
				   }                          
				   $("#columnName").empty();         
				   $("#columnName").html(myOptions_i); 
				   $("#columnName").val("${query.columnName}");
					});
				  </c:when>
				  <c:otherwise>
				 //设定选定值
					$("#provinceCode").change();
				 </c:otherwise>
				 </c:choose>
				   });
				                              
			//台站 选择
			 $("#provinceCode").change(function(){ 
				 if($(this).val()!=null){ 
				 $.getJSON("<c:url value="/biz/BoreholeStation/getStationInfo.do"/>",{provinceCode:$(this).val()},function(myJSON){ 
				 var myOptions=""; 
				 for(var i=0;i<myJSON.length;i++){ 
				      myOptions += '<option value="' + myJSON[i].stationCode + '">' +myJSON[i].stationCname + '</option>'; 
				  }                          
				   $("#tableName").empty();         
				   $("#columnName").empty();     
				   $("#tableName").html(myOptions); 
				   $("#tableName").change();   
				   });
				   
				 $("#provinceCname").val($("#provinceCode option:selected").text()); 

				 }
				}); 
				//观测项选择
				$("#tableName").change(function(){ 
				 if($(this).val()!=null){ 
				 $.getJSON("<c:url value="/biz/BoreholeStation/getItemInfo.do"/>",{stationCode:$(this).val()},function(myJSON){ 
				 var myOptions2=""; 
				 for(var i=0;i<myJSON.length;i++){ 
				      myOptions2 += '<option value="' + myJSON[i].itemCode + '">' +myJSON[i].itemCname + '</option>'; 
				   }                          
				   $("#columnName").empty();         
				   $("#columnName").html(myOptions2); 
				   $("#columnName").change();
				 });
				    $("#stationCname").val($("#tableName option:selected").text());                            
				    }
                   
				   }); 
                //观测项改变
				$("#columnName").change(function(){ 
					$("#itemCname").val($("#columnName option:selected").text()); 
				});
				
				//年度改变
				$("#colYear").focus(function(){ 
					$("#observeTimeBegin").val("");
					$("#observeTimeEnd").val(""); 
				});
				$("#observeTimeBegin").focus(function(){ 
					$("#colYear").val(""); 
				});
		        $("#observeTimeEndn").focus(function(){ 
			        $("#colYear").val(""); 
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
			<h1>钻孔应变数据</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<form id="queryForm" name="queryForm" action="<c:url value="/biz/BoreholeStrain/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend><span id="toggle-bar" class="toggle-down">&nbsp;</span><span>搜索</span></legend>
			<div id="param-div" class="param-div" >
			
			<table>
				<tr>	
					<td class="tdLabel">省份</td>	
					<td> <select  id="provinceCode" name="provinceCode"  /></td>
					<td class="tdLabel">台站</td>	
					<td>
						<select  id="tableName" name="tableName"  class="required" />
					</td>
					<td class="tdLabel">观测项</td>		
					<td>
						<select  id="columnName" name="columnName" class="required"/>
					</td>
					</tr>
					<tr>
					<td class="tdLabel">观测值</td>		
					<td>
						<input value="${query.observeValue}" id="observeValue" name="observeValue" maxlength="15"  class="number "/>
					</td>
					<td class="tdLabel">年度</td>		
					<td >
						<input value="${query.colYear}" id="colYear" name="colYear" maxlength="10"  class="digits"/>
					</td>
					<td class="tdLabel">观测时间</td>		
					<td colspan="3">
						<input value="<fmt:formatDate value='${query.observeTimeBegin}' pattern='<%=BoreholeStrain.FORMAT_OBSERVE_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=BoreholeStrain.FORMAT_OBSERVE_TIME%>'})" id="observeTimeBegin" name="observeTimeBegin"  class="Wdate" />
						<input value="<fmt:formatDate value='${query.observeTimeEnd}' pattern='<%=BoreholeStrain.FORMAT_OBSERVE_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=BoreholeStrain.FORMAT_OBSERVE_TIME%>'})" id="observeTimeEnd" name="observeTimeEnd"   class="Wdate"/>
					</td>
				</tr>	
			</table>
			<input type="hidden" id="provinceCname" name="provinceCname" value="${query.provinceCname}"></input>
			<input type="hidden" id="stationCname" name="stationCname" value="${query.stationCname}"></input>
			<input type="hidden" id="itemCname" name="itemCname" value="${query.itemCname}"></input>
			
			</div>
		</fieldset>
		<div class="handleControl">
             <div class="buttons">
               <button type="submit" class="regular" name="query" onclick="getReferenceForm(this).action='${ctx}/biz/BoreholeStrain/list.do'" >
                 <img src="<c:url value="/image/form/query.gif"/>" alt="" /> 查询
               </button>
               <!--屏蔽掉新建与删除 
               <wylb:hasPermission name="BoreholeStrain:create">
               <button type="submit" class="positive" name="additem" onclick="getReferenceForm(this).action='${ctx}/biz/BoreholeStrain/create.do'" >
                 <img src="<c:url value="/image/form/add.gif"/>" alt="" /> 新增
               </button> 
               </wylb:hasPermission>
               <wylb:hasPermission name="BoreholeStrain:delete">
               <button type="button" class="negative" name="deleteitem" onclick="batchDelete('${ctx}/biz/BoreholeStrain/delete.do','items',document.forms.queryForm)">
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
	    <div style="text-align:center;font-weight: bold;">${query.provinceCname} - ${query.stationCname} - ${query.itemCname}</div>
        <div style="text-align:center;font-weight: normal;">
           <table border="1" class="gridBody" width="600" align="center" style="border-color:#DAE6F5">
             <tr><td width="100">记录数:</td><td width="200">${calcValue.AMOUNT}</td><td width="100">平均值:</td><td width="200">${calcValue.formatAvgValue}</td></tr>
             <tr><td>最小值:</td><td>${calcValue.formatMinValue}</td><td>最大值:</td><td>${calcValue.formatMaxValue}</td></tr>
             <tr><td>标准差:</td><td>${calcValue.formatStdValue}</td><td>协方差:</td><td>${calcValue.formatVeriValue}</td></tr>
           </table>
        </div>
        <div id="chartDiv" style="display:none;text-align:center;font-weight: normal;">
        </div>
        <simpletable:pageToolbar page="${page}">
        <!-- 报表导出,可以添加权限判定 -->
	      <wylb:hasAnyRoles name="role_member,role_admin">
	       <img src="<c:url value="/image/form/icon_pdf.gif"/>" title="导出PDF" alt="导出PDF" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/BoreholeStrain/report.do','PDF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_excel.gif"/>" title="导出Excel" alt="导出excel" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/BoreholeStrain/report.do','XLS');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_rtf.gif"/>" title="导出RTF" alt="导出RTF" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/BoreholeStrain/report.do','RTF');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_html.gif"/>" title="导出HTML" alt="导出HTML" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/BoreholeStrain/report.do','HTML');"/>
	       &nbsp;<img src="<c:url value="/image/form/icon_xml.gif"/>" title="导出XML" alt="导出XML" onclick="javascript:simpleTable.exportToFile('${ctx}/biz/BoreholeStrain/report.do','XML');"/>
	       </wylb:hasAnyRoles>
	       <wylb:lacksRole name="role_member">
	        [注册会员登录后可下载数据]
	       </wylb:lacksRole>
	    </simpletable:pageToolbar>
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  <tr>
				<th style="width:1px;">&nbsp;</th>
				<wylb:hasPermission name="BoreholeStrain:edit">
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"/></th>
				</wylb:hasPermission>
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="STATION_ID" >台站编号</th>
				<th sortColumn="OBSERVE_TIME" >观测时间</th>
				<th sortColumn="OBSERVE_VALUE" >观测值</th>
				<th sortColumn="COL_YEAR" >年度</th>
				<wylb:hasPermission name="BoreholeStrain:edit"><th>操作</th></wylb:hasPermission>
			  </tr>
		  </thead>
		  <tbody>
		      <c:choose>
		       <c:when test="${fn:length(page.result)>0}">
		  	   <c:forEach items="${page.result}" var="item" varStatus="status">
			   <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<wylb:hasPermission name="BoreholeStrain:edit">
				<td><input type="checkbox" name="items" value="observeTime=${item.observeTimeString}&" /></td>
				</wylb:hasPermission>
				<td><c:out value='${item.stationId}'/>&nbsp;</td>
				<td><c:out value='${item.observeTimeString}'/>&nbsp;</td>
				<td><c:out value='${item.observeValue}'/>&nbsp;</td>
				<td><c:out value='${item.colYear}'/>&nbsp;</td>
				<wylb:hasPermission name="BoreholeStrain:edit">
				<td>
					<!--  <a href="${ctx}/biz/BoreholeStrain/show.do?observeTimeString=${item.observeTimeString}&tableName=${query.tableName}&columnName=${query.columnName}" title="查看" > <img src="<c:url value='/image/form/view.png'/>" alt="查看"  /></a>&nbsp;
					-->
					<a href="${ctx}/biz/BoreholeStrain/edit.do?observeTimeString=${item.observeTimeString}&tableName=${query.tableName}&columnName=${query.columnName}" title="修改" > <img src="<c:url value='/image/form/edit.gif'/>" alt="修改"  /></a>
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
				<wylb:hasPermission name="BoreholeStrain:edit"><td>&nbsp;</td><td>&nbsp;</td></wylb:hasPermission>
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
    var chartData="<graph caption='趋势图' outCnvBaseFontSize='12' subcaption='${query.provinceCname}-${query.stationCname}-${query.itemCname}' xAxisName='时间(坐标仅显示小时时刻,曲线折点上可查看准确时间与数据)'  yAxisName='温度'  showNames='1' showValues='0' rotateNames='1' showColumnShadow='0' animation='1' showAlternateHGridColor='1' AlternateHGridColor='c1dbfa' divLineColor='c1dbfa' divLineAlpha='20' alternateHGridAlpha='5' canvasBgColor='f2f2f2' canvasBorderColor='dae6f5' baseFontColor='333333'>";
    <c:forEach items="${page.result}" var="item" varStatus="status">
     chartData += "<set name='${fn:substring(item.observeTimeString,11,13)}' value='${item.observeValue}' hoverText='${item.observeTimeString}'/>";
     </c:forEach>
    chartData +="</graph> "
</script>	
</body>
</html>


