<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp"%>
<link href="<c:url value="/style/main.css"/>" type="text/css"	rel="stylesheet" />
<title>地壳应力研究所数据共享分中心</title>
<meta http-equiv="keywords" content="地壳应力研究所数据共享分中心,地壳所,dqs"/>
<meta http-equiv="description" content="地壳应力研究所数据共享分中心提供地温观测数据,钻孔应变数据以及应力相关的数据分享服务"/>
<style>
<!--
dl{padding:0;}
dt{clear:both;padding:5px 0 10px;}
dd{float:left;padding:10px 20px 20px 5px;}
#page a,#page a:hover,#page a:active,#page a:visited{ border:0px; color: #666; text-decoration: none; border-bottom:0px;}
#fastnav ul{list-style-type:none;margin-top:20px;}
#fastnav ul li{padding:0px 0 15px 20px; font-family:"宋体"; font-size:14px;color:#333;background:url(<c:url value="/image/cms/p_ul_li.gif"/>) no-repeat 0px 0px;}
#fastnav ul li a:hover{font-weight:bold;}
h4 img {width:32px;height:32px;vertical-align: bottom; border:0 none;}
h4 span{padding-left:5px;height:32px; line-height:32px;}
#page a, #page a:hover, #page a:active, #page a:visited { border: 0 none;  color: #333;   text-decoration: none;}
#friendlink{display:inline;filter:alpha(opacity=80);-moz-opacity:0.8;-khtml-opacity: 0.8; opacity: 0.8;}
#friendlink dl{display:inline;}
#friendlink dl dd{float:left;padding:2px; margin-right:10px; border:1px solid #ccc;}
#friendlink dl dd img{height:30px;}
-->
</style>
</head>
<body>
<!-- Header -->
<%@ include file="/include/header.jsp"%>
<!-- End of Header -->
<!-- Page title -->
<div id="pagetitle">
<div class="wrapper">
<h1>&nbsp;</h1>
<!--查询框,暂时取消 
			 <form action="" method="get"><input class="" type="text" id="q" name="q" /></form>
			  --></div>
</div>
<!-- End of Page title -->
<!-- 主内容 -->
<div id="home-content" >
<!-- Page content -->
<div id="page" >
<div class="wrapper cl" >
<div id="leftPanel" class="cl" style="float:left;width:200px;">
<div>
<h4>
<img src="<c:url value="/image/ico/right.png"/>"  alt="" />
<span>快捷导航</span>
</h4>
<div id="fastnav">
 <ul>
 <li><a href="<c:url value="/biz/BoreholeStrain/list.jsp"/>">钻孔应变数据查询</a> </li>
 <li><a href="<c:url value="/cms/content/zuankongsite.do?ftl=t2"/>">钻孔应变台站信息</a> </li>
 <li><a href="<c:url value="/biz/TemperatureInfo/list.jsp"/>">钻孔地温数据查询</a> </li>
 <li><a href="<c:url value="/biz/Station/list.do"/>">钻孔地温台站信息 </a></li>
 <li><a href="<c:url value="/cms/content/gismap.do?ftl=t2"/>">应力环境应力场图</a> </li>
 <li><a href="<c:url value="/biz/EarthStress/list.jsp"/>">应力环境分类下载</a> </li>
 <li><a href="<c:url value="/biz/RsMapLib/list.do"/>">遥感地理图件浏览</a> </li>
 </ul>
</div>
<div>
<h4>
<span>使用说明</span></h4>
<div >
 <p style="line-height:20px;">部分数据查询提供报表导出功能,需要会员登录后方可使用;
 系统使用方面的信息,可参阅&lt;&lt;<a href="<c:url value="/cms/channel/10035.do"/>"><strong>用户指南</strong></a>&gt;&gt;
 </p>
 </div>
</div>
</div>
</div>
<div id="noticeDiv" style="float:right;">
<div class="colgroup leading">
<div class="column first" style="width: 360px;padding-left:20px;">
<!-- 数据服务 -->

<div >
<h4>
<img src="<c:url value="/image/ico/earth.png"/>" alt="" />
<span>数据服务</span>
</h4>
<hr />
<div id="announcementDiv">
<dl>
<dt><a href="<c:url value="/cms/content/aboutborehole.do"/>">全国钻孔应力应变观测数据库</a></dt>
<dd><a href="<c:url value="/u/metafile/全国钻孔应变观测数据库元数据.xml"/>" target="_blank" >( 全国钻孔应变元数据)</a></dd>
<dd><a href="<c:url value="/u/metafile/全国钻孔应变数据库数据模式.xml"/>" target="_blank" >( 全国钻孔应变数据模式)</a></dd>
</dl>
<dl>
<dt><a href="<c:url value="/biz/Station/list.do"/>">钻孔地温数据库</a></dt>
<dd><a href="<c:url value="/u/metafile/钻孔地温元数据.xml"/>" target="_blank" >( 钻孔地温元数据)</a></dd>
<dd><a href="<c:url value="/u/metafile/钻孔地温数据模式.xml"/>" target="_blank" >( 钻孔地温数据模式)</a></dd>
</dl>
<dl>
<dt><a href="<c:url value="/cms/content/aboutgisdb.do?ftl=t2"/>">中国地壳应力环境数据库</a></dt>
<dd><a href="<c:url value="/u/metafile/地壳应力元数据.xml"/>" target="_blank" >( 地壳应力环境元数据)</a></dd>
<dd><a href="<c:url value="/u/metafile/地壳应力数据模式.xml"/>" target="_blank" >( 地壳应力环境数据模式)</a></dd>
</dl>
</div>
</div>
<!-- 法规标准 -->
<div class="cl"></div>
<div style="width:90%;">
<h4>
<img src="<c:url value="/image/ico/chilun2.png"/>"  alt="" />
<span>法规标准</span>
</h4>
<hr />
<div id="lawsContentDiv" ></div>
</div>
<script type="text/javascript">
        $.getJSON("<s:url value="/front/getNews.do?channelId=10034"/>", function(data){

          var content="<table width='100%' class='no-style full'><tbody>";
    	  $.each(data.Rows, function(i,item){
    	    content=content+"<tr><td class='ta-left'><a href='<s:url value="/cms/content/"/>"+item.uname+".do' target='_blank'>"+item.title.substring(0,30)+"</a></td></tr>";
    	  });
    	  content=content+"</tbody></table>";
    	  $("#lawsContentDiv").html(content);
    	});
     </script>
</div>
</div>
<!-- 右侧栏 -->
<div class="column " style="width: 340px;margin-left: 25px;">
<!-- 通知栏目 -->
<div>
<h4>
<img src="<c:url value="/image/ico/pao.png"/>"  alt="" />
<span>最新信息</span>
</h4>
<hr />
<div id="mq" style="height:81px; margin:0 auto; OVERFLOW: hidden; " onmouseover="iScrollAmount=0" onmouseout="iScrollAmount=1" ></div>
</div>
<script type="text/javascript">
        $.getJSON("<s:url value="/front/getNews.do?channelId=10037&pageSize=8"/>", function(data){

          var content="<table width='100%' class='no-style full'><tbody>";
          $.each(data.Rows, function(i,item){
    	    content=content+"<tr><td class='ta-left'><a href='<s:url value="/cms/content/"/>"+item.uname+".do' target='_blank'>"+item.title.substring(0,20)+"</a></td><td class='ta-right'>"+item.releaseDateString+"</td></tr>";
    	  });
    	  content=content+"</tbody></table>";
    	  $("#mq").html(content);
    	});
        
        //滚动
        var oMarquee = document.getElementById("mq"); //滚动对象 
        var iLineHeight = 27; //单行高度，像素 
        var iLineCount = 8; //实际行数 
        var iScrollAmount = 1; //每次滚动高度，像素 
        function run() { oMarquee.scrollTop += iScrollAmount; if ( oMarquee.scrollTop == iLineCount * iLineHeight ) oMarquee.scrollTop = 0; if ( oMarquee.scrollTop % iLineHeight == 0 ) { window.setTimeout( "run()", 2500 ); } else { window.setTimeout( "run()", 10 ); } } oMarquee.innerHTML += oMarquee.innerHTML; window.setTimeout( "run()", 2500 );

 </script>
<!-- 新闻栏目 -->
<div class="cl"></div>
<div>
<h4>
<img src="<c:url value="/image/ico/paper4.png"/>"  alt="" />
<span>中国及邻区现代构造应力场图</span>
</h4>
<hr />
<div id="mapsContentDiv" style="min-height:100px;">
  <a href="<c:url value="/static/datafile/stress_cuixiaofeng.jpg"/>"  target="_blank">
    <img src="<c:url value="/static/datafile/stress_cuixiaofeng_m.jpg"/>"></img>
   </a>
</div>
</div>

</div>    
</div>

<div class="cl" style="padding-top:50px;">
   <div style="display:inline;float:left;padding:0 10px;height:30px;line-height:30px;"> 友情链接: </div>
   <div id="friendlink" >
    <dl>
     <dd>
      <a href="http://data.earthquake.cn/" title="国家地震科学数据共享中心">
       <img src="<c:url value="/image/dqs/data_center.jpg"/>" alt="国家地震科学数据共享中心"></img>
       </a>
     </dd>
      <dd>
      <a href="http://www.cenc.ac.cn/" title="中国地震台网中心">
       <img src="<c:url value="/image/dqs/network_center.jpg"/>" alt="中国地震台网中心"></img>
       </a>
     </dd>
     <dd>
      <a href="http://www.csi.ac.cn/" title="中国地震信息网">
       <img src="<c:url value="/image/dqs/csi.jpg"/>" alt="中国地震信息网"></img>
       </a>
     </dd>
     <dd>
      <a href="http://www.escience.gov.cn/" title="中国科技资源共享网">
       <img src="<c:url value="/image/dqs/escience.jpg"/>" alt="中国科技资源共享网"></img>
       </a>
     </dd>
     <dd>
      <a href="http://www.nstl.gov.cn/" title="国家科技图书文献中心">
       <img src="<c:url value="/image/dqs/nstl.jpg"/>" alt="国家科技图书文献中心"></img>
       </a>
     </dd>
     <dd>
      <a href="http://www.world-stress-map.org/" title="世界应力图">
       <img src="<c:url value="/image/dqs/wsm.jpg"/>" alt="世界应力图"></img>
       </a>
     </dd>

    </dl>
  </div>
</div>
</div>
</div>
</div>
<!-- footer -->
<%@ include file="/include/footer.jsp"%>
<!-- End of footer -->
</body>
</html>


