<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.steven.framework.common.menu.Menu" %>
<%@ taglib uri="/steven-tags" prefix="wylb" %>
	<!-- Header -->
	<div id="top" >
		<div id="header_back"  class="wrapper">
			<!-- Title/Logo  -->
			<div id="header_title">
			<!-- 
			<img src="<c:url value="/image/main/logo.png" />" alt="网站LOGO" width="50" height="50"/>
			<span>国家地震科学数据共享中心</span>
			-->
			&nbsp;
			</div>
			
			<!-- right navigation -->
			<div id="topnav">
			    <div class="info">
			    <div class="userinfo">
			    <wylb:user>
				
				<s:if test="#session.CURRENT_USER.userid!=2">
                                当前用户:<b><wylb:principal property="realName"/></b>
				<span>|</span> <a href="<s:url value="/member/changepwd.jsp"/>">更改密码</a>
				<s:url id="userUpdateUrl" action="toUpdateUserInfo" namespace="/member" >
				  <s:param name="userid" value="%{#session.CURRENT_USER.userid}"/>
				</s:url>
				<span>|</span> <s:a href="%{userUpdateUrl}" method="post">个人信息</s:a>
				<span>|</span> <a href="<s:url value="/logout.do"/>">退出</a><br />
				</s:if>
				<s:else>
				<span>-</span> <a href="<s:url value="/logout.do"/>">登录/注册 </a><span>-</span><br />
				</s:else>
				<!-- notice 
				<small>You have <a href="#" class="high"><b>1</b> new message!</a></small>
				-->
				</wylb:user>
				<wylb:guest>
				<span>|</span> <a href="<s:url value="/logout.do"/>">登录</a><br />
				</wylb:guest>
				</div>
			    </div>
			    
			    <div class="top_link">
			     <ul>
			        <li><a href="<c:url value="/cms/content/databasedesc.do"/>">数据资源简介</a></li>
			        <li><a href="<c:url value="/cms/board/show.do"/>">留言板</a></li>
			        <li><a href="<c:url value="/cms/content/contactus.do?ftl=t2"/>">联系我们</a></li>
			     </ul>
			    </div>
			    
			    <div class="subtitle">
			              中国地壳应力环境数据服务
			    <a href="http://http://www.sciencedata.cn/" >
				<img   src="<c:url value="/image/dqs/menhu.jpg"/>" alt="科学数据共享工程" />
				</a>
				</div>
				
			</div>
			<!-- End of Top navigation -->
    </div>	
    </div> 
    <div class="cl menu_back" >
		<!-- Main navigation -->
		 <div id="menu_div" class="wrapper">
			<wylb:menu id="my_menu" menu="${userMenus}" style="1" level="2" showRoot="0"  target="_self" autoInit="1"></wylb:menu>
			<!-- End of Main navigation -->
			
			<!-- Quick search box -->
			<div id="search">
			  <!--  
			  <form action="" method="post"><input class="" type="text" id="q" name="q" /></form>
			  -->
			  
			</div>
	  </div>
	</div>	
	<!-- End of Header -->