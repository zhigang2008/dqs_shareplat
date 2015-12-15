<%@page import="com.steven.core.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0" />
<title>模块维护</title>
<%@ include file="/commons/meta.jsp" %>
<link href="<c:url value="/style/layout.css"/>"	type="text/css" rel="stylesheet"/>
<link href="<c:url value="/script/dynatree/skin-vista/ui.dynatree.css"/>" type="text/css" rel="stylesheet"/>
<link href="<c:url value="/script/dynatree/jquery.contextMenu.css"/>" type="text/css" rel="stylesheet"/>
<script src="<c:url value="/script/jquery-ui.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/script/dynatree/jquery.dynatree.js"/>"></script>
<script type="text/javascript" src="<c:url value="/script/dynatree/jquery.contextMenu-custom.js"/>"></script>
<script type="text/javascript"> 
	 // --- Contextmenu helper -------------------------------------------------- 
	 
	  function bindContextMenu(nodeSpan) { 
	    // Add context menu to all nodes: 
	    $(nodeSpan) 
	      .destroyContextMenu() // unbind first, to prevent duplicates 
	      .contextMenu({menu: "myMenu"}, function(action, el, pos) { 
	      // The event was bound to the <span> tag, but the node object 
	      // is stored in the parent <li> tag 
	      var node = el.parents("[dtnode]").attr("dtnode"); 
	      switch( action ) { 
	      case "add": 
	    	  showFrame("添加模块","<c:url value="/system/Module/create.do"/>?parent="+node.data.key,500,360);
 		      break;
	      case "edit":
	    	  showFrame("编辑模块","<c:url value="/system/Module/edit.do"/>?moduleId="+node.data.key,500,360);
		      break; 
	      case "delete": 
		      showConfirm("确认","您确定要删除节点["+node.data.title+"]?",function(val){
			    if(val){
	    	     $.getJSON("<c:url value="/system/Module/jsonDelete.do"/>?moduleId="+node.data.key, 
	    	      function(json){
    	    	  if(json.success){
        	    	  showAlert("OK","删除成功",200,100);
        	    	  var parentNode = $("#tree").dynatree("getTree").getNodeByKey(node.data.parentId);
        	    	  parentNode.reloadChildren();
        	    	  parentNode.expand();
    	    	  }
    	    	  else{
    	    		  showAlert("Error",json.message,200,100);
    	    	  }
	    	     });
			    }
			    else{}
	    	  },320,100);
	           break; 
	      default: 
	         //alert("Todo: appply action '" + action + "' to node " + node); 
	      } 
	    }); 
	  }; 
	  
	// --- Init dynatree during startup ---------------------------------------- 
    $(function(){ 
        // Attach the dynatree widget to an existing <div id="tree"> element 
        // and pass the tree options as an argument to the dynatree() function: 
        $("#tree").dynatree({ 
        	checkbox:false,
        	selectMode:3,
            
            persist: false,
            /**一次性通过ajax以及目录加载 **/ 
            initAjax: { url: "<c:url value="/system/Module/treeList.do"/>" ,
                        data:{ 
            	              "parent": "0",  
                              "pageSize": "1000" ,
                              "lazyLoad":true,
                              "includeRoot":true
                               } 
                      },
             
            //懒加载        
            onLazyRead: function(node){ 
                       node.appendAjax( {url: "<c:url value="/system/Module/treeList.do"/>", 
                                         data: {"parent": node.data.key, 
                                                "pageSize": "1000" ,
                                                 "lazyLoad":true,
                                                 "includeRoot":false
                                               } 
                                    }); 
                       },           
            minExpandLevel: 1,
            strings: { 
                loading: "正在加载…", 
                loadError: "数据加载失败!" 
            },
            //加载菜单
            onRender: function(node, nodeSpan) { 
            	bindContextMenu(nodeSpan); 
            },
            onClick: function(node, event) { 
                // Eat mouse events, while a menu is open 
                if( $(".contextMenu:visible").length > 0 ){ 
                  return false; 
                } 
              }, 
             onKeydown: function(node, event) { 
                // Eat keyboard events, when a menu is open 
                if( $(".contextMenu:visible").length > 0 ) 
                  return false; 
         
                switch( event.which ) { 
         
                // Open context menu on [Space] key (simulate right click) 
                case 32: // [Space] 
                  $(node.span).trigger("mousedown", { 
                    preventDefault: true, 
                    button: 2 
                    }) 
                  .trigger("mouseup", { 
                    preventDefault: true, 
                    pageX: node.span.offsetLeft, 
                    pageY: node.span.offsetTop, 
                    button: 2 
                    }); 
                  return false; 
                } 
              }
        });

        //按钮事件
        $("#btnCollapseAll").click(function(){ 
            $("#tree").dynatree("getRoot").visit(function(node){ 
              node.expand(false); 
            }); 
            return false; 
          }); 
          $("#btnExpandAll").click(function(){ 
            $("#tree").dynatree("getRoot").visit(function(node){ 
              node.expand(true); 
            }); 
            return false; 
          }); 
         $("#btnReloadActive").click(function(){ 
        	var node = $("#tree").dynatree("getActiveNode");
 			if( node ){
 				node.reloadChildren(function(node, isOk){
 				});
 			}else{
 				alert("没有选择节点");
 			}
            });     
    }); 
    //重新加载节点
    function freshNode(nodeId){
    	var node = $("#tree").dynatree("getTree").getNodeByKey(nodeId);
    	if( node ){
			node.reloadChildren();
			node.expand(true);
    	}
    }
    //关闭弹出窗口
    function closePopup(){
        $("#dialogBoxClose").click();
    }
    </script> 
	
</head>

<body>
    <!-- 菜单内容 --> 
  <ul id="myMenu" class="contextMenu"> 
    <wylb:hasPermission name="Module:create">
       <li class="add"><a href="#add">添加</a></li> 
    </wylb:hasPermission>
    <wylb:hasPermission name="Module:edit">
        <li class="edit"><a href="#edit">编辑</a></li> 
    </wylb:hasPermission>
    <wylb:hasPermission name="Module:delete">
       <li class="delete"><a href="#delete">删除</a></li> 
    </wylb:hasPermission>
    <li class="quit separator"><a href="#quit">取消</a></li> 
  </ul> 
  
   <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>功能模块管理 </h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div id="content" class="cl wrapper">
 
   <div id="controlbuttons" class="buttons">
               <button type="button" class="regular" name="btnExpandAll" id="btnExpandAll">
                 <img src="<c:url value="/image/tree/folder-open.gif"/>" alt="" /> 展开所有节点
               </button> 
               <button type="button" class="regular" name="btnCollapseAll" id="btnCollapseAll">
                 <img src="<c:url value="/image/tree/folder.gif"/>" alt="" /> 收起所有节点
               </button> 
               <button type="button" class="regular" name="btnReloadActive" id="btnReloadActive">
                 <img src="<c:url value="/image/tree/load.gif"/>" alt="" /> 重载当前节点
               </button> 
  </div> 
  <div class="cl"></div>
  <!-- 树形结构 -->
  <div id="tree">
  </div>
  <div id="detail" ></div>
  	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>


