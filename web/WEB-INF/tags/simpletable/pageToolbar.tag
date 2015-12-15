<%@ tag pageEncoding="UTF-8"%>
<%@ attribute name="page" required="true" type="com.steven.framework.core.page.Page" description="Page.java" %>
<%@ attribute name="pageSizeSelectList" type="java.lang.Number[]" required="false"  %>
<%@ attribute name="isShowPageSizeList" type="java.lang.Boolean" required="false"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// set default values
	Integer[] defaultPageSizes = new Integer[]{10,20,50,100,500,1000};
	if(jspContext.getAttribute("pageSizeSelectList") == null) {
		jspContext.setAttribute("pageSizeSelectList",defaultPageSizes); 
	}
	
	if(jspContext.getAttribute("isShowPageSizeList") == null) {
		jspContext.setAttribute("isShowPageSizeList",true); 
	} 
%>

<table width="100%"  border="0" cellspacing="0" class="gridToolbar">
  <tr>
	<td>
		<div class="box">
		
			<div  class="leftControls" >
				<jsp:doBody/>
			</div>
			
			<div class="paginationControls">
				<div class="buttonLabel">显示记录从${page.thisPageFirstElementNumber}到${page.thisPageLastElementNumber}, 总记录 ${page.totalCount} </div>
				<div class="bar-separator"></div>
				<div>
				<c:choose>
				<c:when test="${page.firstPage}"><img src="<c:url value='/widgets/simpletable/images/firstPageDisabled.gif'/>"  alt="" /></c:when>
				<c:otherwise><a href="javascript:simpleTable.togglePage(1);"><img src="<c:url value='/widgets/simpletable/images/firstPage.gif'/>" alt="第一页"  /></a></c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${page.hasPreviousPage}"><a href="javascript:simpleTable.togglePage(${page.previousPageNumber});"><img src="<c:url value='/widgets/simpletable/images/prevPage.gif'/>" alt="上一页"  /></a></c:when>
				<c:otherwise><img src="<c:url value='/widgets/simpletable/images/prevPageDisabled.gif' />" alt=""  /></c:otherwise>
				</c:choose>
				</div>
				
				<div class="bar-separator"></div>
				<div class="pagelist">
				
				<c:set value="0" var="preNumber" scope="page" />
				<c:forEach var="item" items="${page.linkPageNumbers}">
				<c:if test="${preNumber+1 < item }">
				  <div class="current">...</div>
				</c:if>
				<c:choose>
				<c:when test="${item == page.thisPageNumber}">
                <div class="current">${item}</div>
                </c:when>
				<c:otherwise><a href="javascript:simpleTable.togglePage(${item});">${item}</a></c:otherwise>
				</c:choose>
				
				<c:set value="${item}" var="preNumber" scope="page" />
				</c:forEach>
				</div>
				
				<div class="bar-separator"></div>
				
				<div >
				<c:choose>
				<c:when test="${page.hasNextPage}"><a href="javascript:simpleTable.togglePage(${page.nextPageNumber});"><img src="<c:url value='/widgets/simpletable/images/nextPage.gif'/>" style="border:0" alt="下一页" /></a></c:when>
				<c:otherwise><img src="<c:url value='/widgets/simpletable/images/nextPageDisabled.gif'/>" style="border:0" alt="" /></c:otherwise>
				</c:choose>
				
				
				<c:choose>
				<c:when test="${page.lastPage}"><img src="<c:url value='/widgets/simpletable/images/lastPageDisabled.gif'/>" style="border:0" alt="" /></c:when>
				<c:otherwise><a href="javascript:simpleTable.togglePage(${page.lastPageNumber});"><img src="<c:url value='/widgets/simpletable/images/lastPage.gif'/>" style="border:0" alt="最后一页"/></a></c:otherwise>
				</c:choose>
				</div>
				
				<div class="bar-separator"></div>
				
				<c:if test="${isShowPageSizeList}">
				<div>
				<select onchange="simpleTable.togglePageSize(this.value)">
					<c:forEach var="item" items="${pageSizeSelectList}">
						<option value="${item}" ${page.pageSize == item ? 'selected="selected"' : '' }>${item}</option>
					</c:forEach> 
				</select>
				</div>
				</c:if>
				
			</div>
		</div>
	</td>
  </tr>
</table>