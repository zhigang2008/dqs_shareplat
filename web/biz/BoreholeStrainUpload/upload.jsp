<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<script	src="<c:url value="/script/validation/jquery.validate.min.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/additional_methods.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/messages_cn.js"/>"	type="text/javascript"></script>
<script	src="<s:url value="/script/swfobject.js"/>"	type="text/javascript"></script>
<script	src="<s:url value="/script/uploadify/jquery.uploadify.min.js"/>"	type="text/javascript"></script>

<script type="text/javascript"> 
        $(document).ready(function() {
            //表单验证
            var v = $("#myForm").validate({
            	rules: {
            	dataYear: {
            	     required:true,
		             minlength:4, 
		             maxlength:4
			        },
			    dataMonth: {
			        	 required:true,
			             range:[1,12]
					     /*        ,
			             remote: {
			                 url: "<s:url value="/remoteCheck/BoreholeStrain/checkExistData.do"/>",
			                 type: "post",
			                 cache:false,
			                 data: {
			        	       tableName: function() {
			                     return $("#tableName").val();
			                   },
			                   columnName: function() {
				                 return $("#columnName").val();
				               },
				               dataYear: function() {
					             return $("#dataYear").val();
					           },
					           dataMonth: function() {
						         return $("#dataMonth").val();
						        }
			                 }
			               }
					               */
				    }   
			     },
			   messages: {
			    	 dataYear: {
			    	 required:"请输入四位数的年度",
		             minlength:"请输入四位数的年度" ,
		             maxlength:"请输入四位数的年度"
			        },
			        dataMonth: {
					     required:"请输入月度",
			             range:"1~12月度" 
			            // ,remote:"该站点该时间内的数据已经存在"
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
			       <c:when test="${provinceCode!=null}">
		        //设置省份           
			   $("#provinceCode").val("${provinceCode}");
			    //设置台站
			    $.getJSON("<c:url value="/biz/BoreholeStation/getStationInfo.do"/>",{provinceCode:'${provinceCode}'},function(myJSON){ 
			     var myOptions_s=""; 
			    for(var i=0;i<myJSON.length;i++){ 
			    	myOptions_s += '<option value="' + myJSON[i].stationCode + '">' +myJSON[i].stationCname + '</option>'; 
			     }                          
			     $("#tableName").empty();         
			     $("#tableName").html(myOptions_s); 
				 $("#tableName").val("${tableName}");
			    });
				//设置观测项
				$.getJSON("<c:url value="/biz/BoreholeStation/getItemInfo.do"/>",{stationCode:'${tableName}'},function(myJSON){ 
			    var myOptions_i=""; 
			    for(var i=0;i<myJSON.length;i++){ 
			    	myOptions_i += '<option value="' + myJSON[i].itemCode + '">' +myJSON[i].itemCname + '</option>'; 
			   }                          
			   $("#columnName").empty();         
			   $("#columnName").html(myOptions_i); 
			   $("#columnName").val("${columnName}");
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

            //文件上传
			 $("#file_upload").uploadify({
	                "uploader"  : "<s:url value="/script/uploadify/uploadify.swf"/>",
	                "script"    : "<s:url value="/support/fileupload.do"/>",
	                "cancelImg" : "<s:url value="/script/uploadify/cancle.gif"/>",
	                "fileDataName" : "fileData",
	                "folder"    : "/u/upload/temp",
	                "fileExt"   : "*.*",
	                "fileDesc"  : "All Files (*.*)",
	                // "scriptData":backData,
	                "auto"      : true,
	                "queueID"   : "fileQueue",  
	                "multi"     : false,
	                "buttonText": "Select Files...",
	                //"buttonImg" : "<s:url value="/image/layout/uploadButton.gif"/>",
	                "wmode"     : "transparent",
	                "onComplete" :completeAction,
	                "onError"   : function (event,queueID,fileObj,errorObj) {
	                    alert(errorObj.type + ' Error: ' + errorObj.info);
	                  }
	              });
			
        });

        function completeAction(event, queueID, fileObj, response, data){
        	//转换为json对象
        	 var json = eval("(" + response + ")");
        	 $("#fileSize").attr("value",fileObj.size);
        	 $("#documentName").html(json.dataMap.fileName);
             $("#filepath").attr("value",json.dataMap.filePath);
        }
</script>          
<title>钻孔应变数据上传</title>
</head>

<body>
    <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>钻孔应变数据 -> 上传</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<s:form id="myForm" action="/biz/BoreholeStrainUpload/preview.do" method="post">
		<div id="controlbuttons" class="buttons">
               <button type="button" class="regular" name="backpage" onclick="history.back();">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 取消
               </button> 
               <button id="submitButton" name="submitButton" type="submit"  class="positive">
                 <img src="<c:url value="/image/form/ok.gif"/>" alt="" /> 预览
               </button>
        </div>
        <div class="cl"></div>
        <div id="formdiv" >
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
					<td class="tdLabel">年度</td>		
					<td >
						<input id="dataYear" name="dataYear" maxlength="10" value="${dataYear}" class="required digits"/>
					</td>
					<td class="tdLabel">月份</td>		
					<td >
						<input id="dataMonth" name="dataMonth" maxlength="10" value="${dataMonth}" class="required digits"/>
					</td>
				</tr>	
			</table>
			<input type="hidden" id="provinceCname" name="provinceCname" value="${provinceCname}"></input>
			<input type="hidden" id="stationCname" name="stationCname" value="${stationCname}"></input>
			<input type="hidden" id="itemCname" name="itemCname" value="${itemCname}"></input>
			<p>上传文件</p>
		    <div id="tips" ></div>
		    <div>
		      <input id="file_upload" name="file_upload" type="file"  />
		      <div id="fileQueue" ></div>  
		    </div>
            <s:hidden label="上传文件" id="filepath" name="filepath" value="%{filepath}" cssClass="required" required="false" />
            <div>已上传文件:<p id="documentName">${filepath}</p></div>
		</div>
	</s:form>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>