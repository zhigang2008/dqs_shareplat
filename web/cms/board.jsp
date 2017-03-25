<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp" %>
<link href="<c:url value="/style/cms.css"/>" type="text/css" rel="stylesheet"/>
<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
<script	src="<c:url value="/script/jquery-form.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/jquery.validate.min.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/additional_methods.js"/>"	type="text/javascript"></script>
<script	src="<c:url value="/script/validation/messages_cn.js"/>"	type="text/javascript"></script>
<script type="text/javascript"> 
        $(document).ready(function() {
            
        	// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('pageform',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
        	 //ajax提交表单配置
        	var options = { 
        	        success:   afterAction,  // post-submit callback 
        	        dataType:  "json",        // 'xml', 'script', or 'json' (expected server response type) 
        	        resetForm: false        // reset the form after successful submit 
        	        

           	        //target:"tipdiv",         // target element(s) to be updated with server response 
        	        //beforeSubmit:  validate,  // pre-submit callback 
        	        // other available options: 
        	        //url:       url         // override for form's 'action' attribute 
        	        //type:      type        // 'get' or 'post', override for form's 'method' attribute 
       	            //clearForm: true        // clear all form fields after successful submit 
        	        // $.ajax options can be used here too, for example: 
        	        // timeout:   3000
        	    };
            //表单验证
            var v = $("#myForm").validate({
            	submitHandler: function(form) {
				$(form).ajaxSubmit(options);
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
        });
        //提交后动作
        function afterAction(data)  { 
            if(data.success){
                
                <s:if test="%{needAudit==true}">
                $("#btn_submit").attr("disabled",true);
                $("#btn_submit").text("已提交");
                $("#myForm")[0].reset();
                showAlert("成功","您的留言已提交,等待管理员审核!",300,100);
                </s:if>
                <s:else>
                $("#myForm")[0].reset();
                showResponseAlert("成功","您的留言已提交!",
                        function(){
                           window.location.reload();
                         },
                         200,100);
                </s:else>
            }
            else{
            	showAlert("Sorry,留言失败",data.message,300,100);
            }
        }
        //验证码 
      function refreshCheckCode(){
        	$("#check_img").removeAttr("src");
        	$("#check_img").attr("src","<s:url action='jcaptcha_image' namespace='/' />"+"?rand="+Math.random());	
        }
</script>          
<title>留言板</title>
</head>

<body>
    <!-- Header -->
	<%@ include file="/include/header.jsp" %>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper">
			<h1>用户留言</h1>
		</div>
	</div>
	<!-- End of Page title -->
	<div class="cl twitter_blog">
    <div class="twitter">
      <h2>&nbsp;</h2>
      <div class="bird">
      <img width="75" height="80" alt="picture" title="欢迎在此留言" src="<c:url value="/image/cms/bird.gif"/>"/>
        <p> 我要留言</p>
      </div>
    </div>
    </div>
 <div id="content" class="cl wrapper">
    <!-- 留言列表 -->
	<div id="msg_list" class="left-nav" style="width:600px;">
		<form id="pageform" action="<c:url value="/cms/board/show.do"/>">
            <div id="searchdiv" class="searchdiv" >
            <div style="float:left;width:450px;">
            <label>留言人:</label><input value="${query.userName}" id="userName" name="userName" maxlength="20"  class=""/>
            <label>标题:</label><input value="${query.title}"  name="title" maxlength="20"  class=""/>
            <label>内容:</label><input value="${query.content}"  name="content" maxlength="20"  class=""/>
            </div>
            <div class="buttons" style="float:left;clear:right;margin:2px 0 0 0;padding:0;">
               <button type="button" class="regular" style="padding:3px 10px;" name="query" onclick="javascript:simpleTable.togglePage(1);" >
                 <img src="<c:url value="/image/form/query.gif"/>" alt="" />查询
             </button>
             </div>
            </div>
         <c:choose>
         <c:when test="${fn:length(page.result)>0}">
		 <c:forEach items="${page.result}" var="item" varStatus="status">
			<div class="post">
			<!--  ${page.thisPageFirstElementNumber + status.index}.-->
				<h2><c:out value='${item.title}'/></h2>
				<div class="postmetadata"> 
					<div>
					    <strong>&nbsp;&nbsp;[<c:out value='${item.boardType.name}'/>]</strong>
						<span><c:out value='${item.timeString}'/></span> 
						By
						<span><c:out value='${item.userName}'/></span>
					</div>
				</div>
				<div class="cl"></div>
				<div class="entry">
					&nbsp;&nbsp;<img title="用户留言内容" src="<c:url value="/image/cms/post_ask.gif"/>" align="middle"/><c:out value='${item.content}'/>
				</div>
               <div class="cl"></div>
             <c:if test="${item.reply!=null}">
               <div class="reply">
                   &nbsp;&nbsp;<img title="管理员回复" src="<c:url  value="/image/cms/post_reply.gif"/>" align="middle"/>
                <c:out value='${item.reply}'/>
               </div>
               </c:if>
			</div>
			</c:forEach>
		<div style="width:98%;height:30px;">
		    <simpletable:pagePlatToolbar page="${page}"></simpletable:pagePlatToolbar>
		</div>
		</c:when>
		<c:otherwise>
		  <div style="width:98%;height:30px;margin-top:30px;line-height:30px;text-align:center;">暂无公开留言,欢迎您留言!</div>
		</c:otherwise>
		</c:choose>
	 </form>
	</div>
	<!-- 我要留言 -->
	<div id="msg_post" class="right-nav" style="width:350px;">
	<s:form id="myForm" action="/cms/CmsBoard/jsonSave.do" method="post">
	<s:token/>
      <div id="post_body" class="postbody">
		<div class="postitem">	
		<span class="postlabel">留言类别:</span>	
		  <s:select label="留言类别" key="msgType" value="%{model.msgType}" cssClass="digits required " required="true" list="%{baseCode.cmsBoardType}" listKey="code" listValue="name"/>
	    </div>
	  <div class="postitem">	
		<span class="postlabel">留言人<span class="required">*</span>:
		</span>	
		<s:if test="#session.CURRENT_USER.userid!=2">
		  <s:textfield label="留言人" key="userName" value="%{#session.CURRENT_USER.userName}" cssClass="required " required="true" />
		</s:if>
		<s:else>
		  <s:textfield label="留言人" key="userName" value="" cssClass="required "   required="true" />
		</s:else>
	</div>
		<div class="postitem">	
		<span class="postlabel">联系电话:	</span>	
		  <s:textfield label="联系电话" key="phone" value="" cssClass=""   required="false" />
	</div>
	
	<div class="postitem">	
		<span class="postlabel">邮件:</span>	
		<s:if test="#session.CURRENT_USER.userid!=2">
		  <s:textfield label="邮件" key="mail" value="%{#session.CURRENT_USER.email}" cssClass="email"   required="false" />
		</s:if>
		<s:else>
		  <s:textfield label="邮件" key="mail" value="" cssClass="email"   required="false" />
		</s:else>
	</div>
	<div class="postitem">	
		<span class="postlabel">
			标题<span class="required">*</span>:
		</span>	
		  <s:textfield label="标题" key="title" value="" cssClass="required "  required="true" />
	</div>
	
	<div class="postitem">	
		<span class="postlabel">
			内容<span class="required">*</span>:
		</span>	
		  <s:textarea label="内容" key="content" value="" cssClass="required " required="true"   rows="5"/>
	</div>
	
	<s:if test="%{needCaptcha==true}">
	<!-- 需要验证码 -->
	<div class="postitem">	
		<span class="postlabel">
			验证码:
		</span>	
		<s:textfield  id="captchaCode" name="captchaCode"  cssClass=""  cssStyle="width: 110px;"/>
		<img id="check_img" style="display: inline-block;vertical-align:bottom" width="80" height="30" onclick="javascript:refreshCheckCode();" title="点击换一个验证码" src="<s:url action='jcaptcha_image' namespace='/' />"></img>
		<!-- <a href="javascript:void(0);" onclick="javascript:refreshCheckCode();">换一换</a> -->
	</div>
    </s:if>
		 <s:hidden label="用户ID" key="userId" value="%{#session.CURRENT_USER.userid}" cssClass="digits " required="false" />
		<div class="buttons cl" style="margin-left:50px;">
		<button id="btn_submit"  name="btn_submit" type="submit" style="width:100px;" class="positive">提交留言</button>
		</div>
	 </div>	
	</s:form>
	</div>
	</div>
	<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
	<!-- End of footer -->	
</body>
</html>