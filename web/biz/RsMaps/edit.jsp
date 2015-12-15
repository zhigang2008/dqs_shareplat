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

            	/*默认条件即可,如果需要请在下面启用相关选项
            	debug: false,
    			errorElement: "em",
    			success: function(label) {
    				label.text("ok!").addClass("success");
    			},
    			//errorContainer: $("#warning, #summary"),
    			//errorPlacement: function(error, element) {
    			//error.appendTo( element.parent("td").next("td") );
    			//},
    			
    			//(Demo)可以通过在此处添加校验规则和校验信息,默认已经通过字段的CSS样式添加了校验信息.
    			rules: {
    				firstname: "required",
    				lastname: "required",
    				username: {
    					required: true,
    					minlength: 2
    				}
    			},
    			messages: {
    				firstname: "Please enter your firstname",
    				lastname: "Please enter your lastname",
    				username: {
    					required: "Please enter a username",
    					minlength: "Your username must consist of at least 2 characters"
    				}
    			}
			*/
          });
            $("#file_upload").uploadify({
                "uploader"  : "<s:url value="/script/uploadify/uploadify.swf"/>",
                "script"    : "<s:url value="/support/fileupload.do"/>",
                "cancelImg" : "<s:url value="/script/uploadify/cancle.gif"/>",
                "fileDataName" : "fileData",
                "folder"    : "/u/file/remote_sensing_maps/${model.libId}",
                "fileExt"   : "*.*",
                "fileDesc"  : "All Files (*.*)",
                // "scriptData":backData,
                "auto"      : true,
                //"queueID"   : "fileQueue",  
                "multi"     : false,
                "buttonText": "Change Files...",
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
        	 //$("#fileSize").attr("value",fileObj.size);
        	 $("#mapId").attr("value",json.dataMap.fileName);
        	 $("#mapName").attr("value",json.dataMap.fileName);
             $("#mapLocation").attr("value",json.dataMap.filePath);
        }

</script>

<title>遥感图件信息编辑</title>
</head>

<body>
    <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>遥感图件信息 -> 编辑</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<s:form id="myForm" action="/biz/RsMaps/update.do" method="post">
		<div id="controlbuttons" class="buttons">
               <button id="submitButton" name="submitButton" type="submit"  class="positive">
                 <img src="<c:url value="/image/form/ok.gif"/>" alt="" /> 保存
               </button>
               <button type="button" class="regular" name="backlist" onclick="window.location='${ctx}/biz/RsMaps/list.do?libId=${model.libId}'" >
                 <img src="<c:url value="/image/form/grid.gif"/>" alt="" /> 返回列表
               </button> 
               <button type="button" class="regular" name="backpage" onclick="history.back();">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 取消
               </button> 
        </div>
		<div class="cl"></div>
        <div id="formdiv" >
        <p>请填写以下内容:</p>
		<table id="formtable" class="formtable">
		
		<s:hidden id="seqno" name="seqno" value="%{model.seqno}"/>
		<s:hidden key="libId" value="%{model.libId}"  />
		<s:hidden key="uploadTimeString" value="%{model.uploadTimeString}"  />
	   <tr>	
		<td class="tdlabel">
			图件编码<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="图件编码" key="mapId" id="mapId" value="%{model.mapId}" cssClass="required " required="true" />
	    </td>
	</tr>
	
	<tr>	
		<td class="tdlabel">
			图件名称<span class="required">*</span>:
		</td>	
		<td>
		  <s:textfield label="图件名称" key="mapName" id="mapName" value="%{model.mapName}" cssClass="required " required="true" />
		  <s:hidden key="mapLocation" id="mapLocation" value="%{model.mapLocation}"  />
		  <br/>
		  <input id="file_upload" name="file_upload" type="file"  /> 
		  <!-- <div id="fileQueue" style="width: 400px;border: 1px solid green;min-height:60px;"></div> -->
	    </td>
	</tr>

		</table>
		</div>
	</s:form>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>