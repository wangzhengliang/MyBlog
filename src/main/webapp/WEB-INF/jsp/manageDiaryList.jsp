<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<!-- 列表头 -->
<h4><span class="glyphicon glyphicon-th"></span><strong> 文章列表</strong></h4>
 	<hr/>
		<!-- 列表内容 -->
		<div id="list_content">
			<ul>
				<c:forEach var="diary" items="${pageInfo.list }">
					<li><a href="toEditDiary.action?id=${diary.did }">${diary.title }</a></li>
					<hr />
				</c:forEach>
			</ul>
 				<!-- 显示分页信息 -->
			<div id="page" class="row">
				<!--分页文字信息  -->
				<div id="page_total" class="col-md-6">当前 <code>${pageInfo.pageNum }</code>页,总<code>${pageInfo.pages }</code>
					页,总 <code>${pageInfo.total }</code> 条记录</div>
				<!-- 分页条信息 -->
				<div class="col-md-6">
					<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${APP_PATH }/toDiaryList.action?pn=1">首页</a></li>
						<c:if test="${pageInfo.hasPreviousPage }">
							<li><a href="${APP_PATH }/toDiaryList.action?pn=${pageInfo.pageNum-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
	
						<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
							<c:if test="${page_Num == pageInfo.pageNum }">
								<li class="active"><a href="#">${page_Num }</a></li>
							</c:if>
							<c:if test="${page_Num != pageInfo.pageNum }">
								<li><a href="${APP_PATH }/toDiaryList.action?pn=${page_Num }">${page_Num }</a></li>
							</c:if>
	
						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
							<li><a href="${APP_PATH }/toDiaryList.action?pn=${pageInfo.pageNum+1 }"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<li><a href="${APP_PATH }/toDiaryList.action?pn=${pageInfo.pages}">末页</a></li>
					</ul>
					</nav>
				</div>
			</div>
 		</div>