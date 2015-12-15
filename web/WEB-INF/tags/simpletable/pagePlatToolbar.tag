<%@ tag pageEncoding="UTF-8"%>
<%@ attribute name="page" required="true" type="com.steven.framework.core.page.Page" description="Page.java" %>
<%@ attribute name="pageSizeSelectList" type="java.lang.Number[]" required="false"  %>
<%@ attribute name="isShowPageSizeList" type="java.lang.Boolean" required="false"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// set default values
	Integer[] defaultPageSizes = new Integer[]{10,20,50,100,500};
	if(jspContext.getAttribute("pageSizeSelectList") == null) {
		jspContext.setAttribute("pageSizeSelectList",defaultPageSizes); 
	}
	
	if(jspContext.getAttribute("isShowPageSizeList") == null) {
		jspContext.setAttribute("isShowPageSizeList",false); 
	} 
%>

<table width="100%"  border="0" cellspacing="0" class="gridToolbar">
  <tr>
	<td style="background:transparent">
		<div class="box">
		
			<div  class="leftControlsplat" >
				<jsp:doBody/>
			</div>
			
			<div class="paginationControlsPlat" style="height:24px;line-height:24px;float:right;">
				<div class="buttonLabel">显示记录从${page.thisPageFirstElementNumber}到${page.thisPageLastElementNumber}, 总记录 ${page.totalCount} </div>
				<div class="bar-separator"></div>
				<div>
				<c:choose>
				<c:when test="${page.firstPage}">[首页]</c:when>
				<c:otherwise><a href="javascript:simpleTable.togglePage(1);" >[首页]</a></c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${page.hasPreviousPage}"><a href="javascript:simpleTable.togglePage(${page.previousPageNumber});">[上一页]</a></c:when>
				<c:otherwise>[上一页]</c:otherwise>
				</c:choose>
				</div>
				<div class="bar-separator"></div>
				<div class="pagelist">
				<c:set value="0" var="preNumber" scope="page" />
				<c:forEach var="item" items="${page.linkPageNumbers}">
				<c:if test="${preNumber+1 < item }">
				  <span class="current" style="display:-moz-inline-box;  display:inline-block;width:10px;text-align:center;">...</span>
				</c:if>
				<c:choose>
				<c:when test="${item == page.thisPageNumber}">
                <span class="current" style="display:-moz-inline-box;  display:inline-block;width:10px;text-align:center;">${item}</span>
                </c:when>
				<c:otherwise><span style="display:-moz-inline-box;  display:inline-block;width:10px;text-algin:center;"><a href="javascript:simpleTable.togglePage(${item});" >${item}</a></span></c:otherwise>
				</c:choose>
				
				<c:set value="${item}" var="preNumber" scope="page" />
				</c:forEach>
				</div>
				
				<div class="bar-separator"></div>
				
				<div >
				<c:choose>
				<c:when test="${page.hasNextPage}"><a href="javascript:simpleTable.togglePage(${page.nextPageNumber});">[下一页]</a></c:when>
				<c:otherwise>[下一页]</c:otherwise>
				</c:choose>
				
				
				<c:choose>
				<c:when test="${page.lastPage}">[末页]</c:when>
				<c:otherwise><a href="javascript:simpleTable.togglePage(${page.lastPageNumber});">[末页]</a></c:otherwise>
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