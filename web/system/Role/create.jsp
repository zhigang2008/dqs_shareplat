<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<s:head />
<link href="<c:url value="/script/dynatree/skin-vista/ui.dynatree.css"/>" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<c:url value="/script/jquery-ui.js"/>"></script>
<script type="text/javascript" src="<c:url value="/script/dynatree/jquery.dynatree.js"/>"></script>
<script	src="<c:url value="/script/validation/jquery.validate.min.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/additional_methods.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/messages_cn.js"/>"	type="text/javascript"></script>
<script type="text/javascript"> 
        $(document).ready(function() {
            //表单验证
            var v = $("#myForm").validate({
            	submitHandler: function(form) {
				
				  var tree = $("#moduleTree").dynatree("getTree"); 
			      treeData=tree.serializeArray(false);
			      //将tree中选择的内容添加到额外的表单中 
			      jQuery.each(treeData, function(i, field){
			    	  $("#addFields").append("<input type='hidden' name='modules' value='"+field.value+"'></input>");
			    	}); 

			    //选中所有权限
			    	$("#permissions").children().each(function(){$(this).attr("selected","selected");});
			    	
		          //提交表单
		          form.submit();
		        }
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
            //加载模块树
            $("#moduleTree").dynatree({ 
            	checkbox:true,
            	selectMode:2,
                persist: false,
                /**一次性通过ajax以及目录加载 **/ 
                initAjax: { url: "<c:url value="/system/Module/treeList.do"/>" ,
                            data:{ 
                	              "mode":"all",  
                                  "includeRoot":true
                                   } 
                          },
                minExpandLevel: 3,
                strings: { 
                    loading: "正在加载…", 
                    loadError: "数据加载失败!" 
                },
                onSelect:function(flag,selectedNode){
                    //选中时,选中所有父节点
                    if(flag){
                    	  selectedNode.visitParents(function(pnode){
                    	  pnode.select(true);
                	   },
                	   false);
                    }
                    //取消时,取消所有子节点
                    else{
                    	selectedNode.visit(function(cnode){
                            cnode.select(false);
                        },
                        false);
                    }
                    
                }
               
            });
            //产生tabs
        	$("#formdiv").tabs();
                
        });
</script> 
<style >
#tabs-permission input{
width:60px;
}
#tabs-permission select{
width:300px;
height:300px;
}
</style>         
<title>Role新增</title>
</head>

<body>
    <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>角色管理 -> 新增</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
	<s:form id="myForm" action="/system/Role/save.do" method="post">
		<div id="controlbuttons" class="buttons">
               <button id="submitButton" name="submitButton" type="submit"  class="positive">
                 <img src="<c:url value="/image/form/ok.gif"/>" alt="" /> 提交
               </button>
               <button type="button" class="regular" name="backlist" onclick="window.location='${ctx}/system/Role/list.do'" >
                 <img src="<c:url value="/image/form/grid.gif"/>" alt="" /> 返回列表
               </button> 
               <button type="button" class="regular" name="backpage" onclick="history.back();">
                 <img src="<c:url value="/image/form/back.gif"/>" alt="" /> 取消
               </button> 
        </div>
        <div class="cl"></div>
	    <div id="formdiv">
	     <ul>
		   <li><a class="corner-tl" href="#tabs-basic">基础信息</a></li>
		   <li><a class="" href="#tabs-module">模块信息</a></li>
		   <li><a class="corner-tr" href="#tabs-permission">权限信息</a></li>
	     </ul>
	   <div id="tabs-basic">
	    <table id="formtable" class="formtable">
		  <%@ include file="form_include.jsp"%>
	   </table>
	   </div>
	   <div id="tabs-module">
	    <div id="moduleTree"></div>
	   </div>
	   <!-- 额外添加的表单元素放入此处 -->
	   <div id="addFields" ></div>
	   <div id="tabs-permission">
	    <s:optiontransferselect
     label="角色拥有的权限"
     name="permissions"
     id="permissions"
     leftTitle="拥有的权限"
     rightTitle="可供选择的权限"
     list="%{existPermissions}"
     listKey="id" 
     listValue="description" 
     multiple="true"
     emptyOption="false"
     allowUpDownOnLeft="false"
     allowUpDownOnRight="false"  
     doubleId="allPermissions"
     doubleName="allPermissions"
     doubleList="%{baseCode.permission}"
     doubleListKey="id"
     doubleListValue="description" 
     doubleHeaderKey="doubleHeaderKey"
     doubleHeaderValue="--- Please Select ---"
     doubleEmptyOption="false"
     doubleMultiple="true"
 />
	   </div>
	</div>
</s:form>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>