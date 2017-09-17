<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%pageContext.setAttribute("APP_PATH",request.getContextPath()); %>

<html>
<head>
	<title>汪正良的博客  | 后台管理系统</title>
	<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
	<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- 网站图标 -->
	<link href='${APP_PATH }/images/logo.ico' rel='icon' type='image/x-icon'/>
	<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<style>
		body{
			padding-top:70px;
			width: 100%;
			height: 100%;
		}
		#left-container{
			margin-right: 60px;
			padding-left: 0;
			padding-right: 0;
		}
		#left-container h4{
			padding: 10px;
			margin: 0;
			background-color: #f8f8f8;
		}
		#left-container hr{
			margin-top: 0;
		}
		#list_content ul{
			list-style: none;
			padding-left: 10px;
		}
		#list_content ul li{
			padding-top: 5px;
			font-size: 17px;
			color: #666;
		}
		.data_list{
			background-color: #FDFDFD;
			border: 1px solid #E5E5E5;
		}
		#right-container{
			padding-left: 0;
			padding-right: 0;
		}
		#right-container h4{
			padding: 10px;
			margin: 0;
			background-color: #f8f8f8;
		}
		#right-container hr{
			margin-top: 0;
		}
		.container-fluid{
			padding-left: 60px;
		}
		#page{
			padding-left:40px;
		}
		#page_total{
			font-size: 15px;
		}
		#footer{
			height: 80px;
			background-color: #f8f8f8;
			margin-bottom: 0;
		}
		#footer p{
			text-align: center;
			padding: 20px;
			margin-bottom: 0;
		}
	</style>
</head>
<body>
	<!-- 导航条  -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="container-fluid">
				<div class="navbar-header">
					<a href="#" class="navbar-brand"><strong>Wang's Blog</strong>  <font size="2">我是盖世英雄</font></a >
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
		    	    </button>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="${APP_PATH }/getAllDiary.action">博客首页</a></li >
					<li><a href="${APP_PATH }/toDiaryList.action">文章列表</a></li >
					<li><a href="${APP_PATH }/toTypeManage.action">标签管理</a></li>
					<li><a href="${APP_PATH }/toNewDiary.action">写文章</a></li>
				</ul >
				 <form class="navbar-form navbar-right">
			        <div class="form-group">
			          <input type="text" class="form-control" placeholder="在本站搜索">
			        </div>
			        <button type="submit" class="btn btn-default">搜索</button>
			     </form>
			</div>
		</div>
	</nav>
	<!-- 内容 -->
	<div class="container-fluid">
		<div class="row">
			<!-- 左边内容 -->
	  		<div class="col-md-7" id="left-container" style="height:600px">
	  			<div class="data_list"><!-- 这一块内容是可变内容  -->
	  				<jsp:include page="${manageMainTemp }"></jsp:include>
	  			</div>
	  		</div>
	  		<!-- 右边内容 -->
	  		<div class="col-md-1"></div><!-- 不要删，占位内容，删了排版会发生错误 -->
	 	    <div class="col-md-4" id="right-container">
	 	    	<div class="data_list"><!-- 这是一块可变内容 -->
	 	    		<%-- <div><!-- 按日期分类 -->
		 	    		<h4><span class="glyphicon glyphicon-time"></span><strong> 按时间分类</strong></h4>
		 	    		<hr />
		 	    		<div id="list_content">
							<ul>
							<c:forEach var="type" items="${typeList }">
								<li><a href="serachByTypeId.action?id=${type.tid }">${type.tname }</a></li>
								<hr />
							</c:forEach>
							</ul>
		 	    		</div>
	 	    		</div> --%>
	 	    		<div><!-- 按类型分类 -->
		 	    		<h4><span class="glyphicon glyphicon-tag"></span><strong> 按标签分类</strong></h4>
		 	    		<hr />
		 	    		<div id="list_content">
							<ul>
							<c:forEach var="type" items="${typeList }">
								<li><a href="serachByTypeId.action?id=${type.tid }">${type.tname }</a></li>
								<hr />
							</c:forEach>
							</ul>
		 	    		</div>
	 	    		</div>
	 	    	</div>
 	    	</div>
  	  </div>
  	</div>
    
	<!-- 页脚 -->
	<div id="footer">
		<div class="container-fluid">
			<p>
				 汪小良的博客 (●′ω`●)<br>
			    &copy;汪正良版权所有，后台管理系统 ❤ 汪正良
		    </p>
		</div>
	</div>

</body>	
<script type="text/javascript">
	function addType(){
		var newType = $("#newType").val();
		if(newType == null || newType == ''){
			return false;
		}
		$.ajax({
			url:"${APP_PATH }/addNewType.action",
			data:"tname="+newType,
			type:"POST",
			success:function(result){
				if(result == "1"){
					alert("标签创建成功!")
					window.location.reload();
				}else if(result == "2"){
					alert("标签已经存在！")
				}
			}
		});
	}
	
	function delType(id){
		$.ajax({
			url:"${APP_PATH}/delType.action",
			data:"id="+id,
			success:function(result){
				if(result == "1"){
					alert("删除成功！");
					window.location.reload();
				}else{
					alert("删除失败！");
				}
			}
		});
	}
	
	function toEditType(id){
		$.ajax({
			url:"${APP_PATH}/getOneType.action",
			data:"id="+id,
			success:function(result){
				$("#editType").val(result.tname);
				$("#editId").val(result.tid);
			}
		});
		$("#edit").modal({
			backdrop:"static"
		});
	}
	function editType(){
		var id = $("#editId").val();
		var name = $("#editType").val();
		$.ajax({
			url:"${APP_PATH}/updateType.action",
			data:"id="+id+"&name="+name,
			type:"POST",
			success:function(result){
				if(result == "1"){
					alert("标签修改成功！");
					window.location.reload();
				}
			}
		});
	}
	
</script>
</html>