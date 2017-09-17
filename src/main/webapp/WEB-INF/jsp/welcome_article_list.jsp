<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<style type="text/css">
	#nav_ul li{
		 float:left;
		 list-style:none;
		 padding-left:10px;
	}
	#page_nav{
		padding-left: 50px;
	}
	.nav_div{
		display: inline-block;
		vertical-align: top;
	}
	.right{
		margin-left: 50px;
		font-size: 20px;
	}
</style>
<!-- 文章列表 -->
<c:forEach var="diary" items="${pageInfo.list }">
		<article>
			<div class="heading">
				<h2><a href="showDiary.action?id=${diary.did }">${diary.title }</a></h2>
			</div>
			<div class="content">
				<c:if test="${diary.image != null && diary.image != '' }">
					<a href="showDiary.action?id=${diary.did }"><img src="/pic/Blog/images/${diary.image}" style="width:120px;height:90px"/></a>
				</c:if>	
				<p>
					${diary.content_base }...
				</p>
			</div>
			<div class="info">
				<p>By 汪正良  <fmt:formatDate value="${diary.relasedata }" type="date" pattern="yyyy-MM-dd HH:mm"/> - <a href="#">评论 </a></p>
			</div>
		</article>
</c:forEach>



<div id="page_nav">
	<!--分页文字信息  -->
	<div class="nav_div left">当前第  <code>${pageInfo.pageNum }</code> 页,总共 <code>${pageInfo.pages }</code>
	 页,总共 <code> ${pageInfo.total }</code> 条记录</div>
	<!-- 分页条信息 -->
	<div class="nav_div right">
		<ul id="nav_ul">
			<li><a href="getAllDiary.action?pn=1">首页</a></li>
			<c:if test="${pageInfo.hasPreviousPage }">
				<li><a href="${APP_PATH }/getAllDiary.action?pn=${pageInfo.pageNum-1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
	
	
			<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
				<c:if test="${page_Num == pageInfo.pageNum }">
					<li><a href="#">${page_Num }</a></li>
				</c:if>
				<c:if test="${page_Num != pageInfo.pageNum }">
					<li><a href="getAllDiary.action?pn=${page_Num }">${page_Num }</a></li>
				</c:if>
	
			</c:forEach>
			<c:if test="${pageInfo.hasNextPage }">
				<li><a href="getAllDiary.action?pn=${pageInfo.pageNum+1 }"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<li><a href="getAllDiary.action?pn=${pageInfo.pages}">末页</a></li>
		</ul>
	</div>
</div>




