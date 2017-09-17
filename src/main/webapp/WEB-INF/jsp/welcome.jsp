<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<html>
	<head>
		<title>我是盖世英雄  | 汪正良</title>
		
		<%--SEO优化 --%>
		<meta name="description" content="Java开发交流、Java资源分享、SSM项目、程序员、SSH教程 | wangzhengliang.xin">
		<meta name="author" content="汪正良">
		
		<link rel="stylesheet" href="${APP_PATH }/show/css/zerogrid.css">
		<link rel="stylesheet" href="${APP_PATH }/show/css/style.css">
	    <link rel="stylesheet" href="${APP_PATH }/show/css/responsive.css">
	    
	    <!-- 网站图标 -->
	    <link href='/pic/Blog/images/logo.ico' rel='icon' type='image/x-icon'/>
	</head>
	<body>
		<div class="wrap-body zerogrid">
			<!--------------Header--------------->
			<header>
				<div class="wrap-header">
					
					<div class="top">
						<div id="search">
							<div class="button-search" style="background: url('/pic/Blog/images/button-search.png') center center no-repeat;"></div>
							<input type="text" value="Search..." onfocus="if (this.value == &#39;Search...&#39;) {this.value = &#39;&#39;;}" onblur="if (this.value == &#39;&#39;) {this.value = &#39;Search...&#39;;}">
						</div>
					</div>
					
					<div id="logo">
						<h1>Mr Wang</h1>
					</div>
					
					<nav>
						<div class="wrap-nav">
							<div class="menu">
								<ul>
									<li><a href="${APP_PATH }/getAllDiary.action">首页</a></li>
									<li><a href="#" onclick="showMsg1()">个人简历</a></li>
									<li><a href="#" onclick="showMsg()">你是我的谁</a></li>
									<li><a href="${APP_PATH }/toLogin.action">后台管理</a></li>
								</ul>
							</div>
						</div>
					</nav>
					
				</div>
			</header>
			
			<!--------------Content--------------->
			<section id="content">
				<div class="wrap-content">
					<div class="row block">
						<div id="main-content" class="col-2-3">
							<div class="wrap-col">
								<jsp:include page="${mainTemp }"></jsp:include>
							</div>
						</div>
						<div id="sidebar" class="col-1-3">
							<div class="wrap-col">
								<div class="box">
									<div class="heading"><h2>关于我</h2></div>
									<div class="content">
										<img src="/pic/Blog/images/1.jpg" style="border: 0px;width:100px;height:100px"/>
										<p>
											博主信息：<br>
											汪正良，95年正月出生，江西上饶万年人，江西农业大学14级物联网工程学生。
										</p>
									</div>
								</div>
								<div class="box">
									<div class="heading"><h2>热门分类</h2></div>
									<div class="content">
										<ul>
											<c:forEach var="diaryType" items="${diaryTypeList }">
												<li><a href="${APP_PATH }/showDiaryForTypeId.action?id=${diaryType.tid }">${diaryType.tname }</a></li>
											</c:forEach>
										</ul>
									</div>
								</div>
								<div class="box">
									<div class="heading"><h2>友情链接</h2></div>
									<div class="content">
										<div class="post">
											<center>
												<h4><a href="https://www.wangzhengliang.github.io/">汪正良的GitHub小窝（停更）</a></h4>
												<h4><a href="http://www.bootcss.com/">BootStrap中文网</a></h4>
											</center>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--------------Footer--------------->
			<footer>
				<div class="wrap-footer">
					<div class="row">
						<div class="col-1-3">
							<div class="wrap-col">
								<div class="box">
									<div class="heading"><h2>相册</h2></div>
									<div class="content gallery">
										<a href="/pic/Blog/images/img1.jpg"><img src="/pic/Blog/images/img1.jpg" width="120"/></a>
										<a href="/pic/Blog/images/img2.jpg"><img src="/pic/Blog/images/img2.jpg" width="120"/></a>
										<a href="/pic/Blog/images/img3.jpg"><img src="/pic/Blog/images/img3.jpg" width="120"/></a>
										<a href="/pic/Blog/images/img4.jpg"><img src="/pic/Blog/images/img4.jpg" width="120"/></a>
										<a href="/pic/Blog/images/img5.jpg"><img src="/pic/Blog/images/img5.jpg" width="120"/></a>
										<a href="/pic/Blog/images/img6.jpg"><img src="/pic/Blog/images/img6.jpg" width="120"/></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-1-3">
							<div class="wrap-col">
								<div class="box">
									<div class="heading"><h2>博客介绍</h2></div>
									<div class="content">
									<p>
										本博客采用的架构为：
										Spring+Springmvc+Myabtis+Maven+
										+Mysql+BootStrap,项目通过Maven进行管理，前台采用BootStrap
										开源框架搭建，系统后台是SSM框架支撑，部分前台展示页面来源于开源中国。数
										据存储在Mysql数据库中，项目部署在阿里云上。搭建博客的主要目的是交友学习，
										不进行商业活动，部分博文来源于网上，如有侵权，请联系博主删除侵权内容。
									</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-1-3">
							<div class="wrap-col">
								<div class="box">
									<div class="heading"><h2>联系我</h2></div>
									<div class="content">
										<p>您可以通过以下方式联系到我：</p>
										<p>QQ:1026626960</p>
										<p>微信：13097282351</p>
										<p>手机号码：13097282351</p>
										<p>新浪微博：<a href="https://m.weibo.cn/u/5789561734?from=1077195010&wm=14010_0013&sourceType=qq&uid=5789561734">@我是汪大大的小号</a></p>
										<p>知乎首页：<a href="http://www.zhihu.com/people/wang-zheng-liang-35?utm_source=qq&utm_medium=social">汪正良的知乎首页</a></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="copyright">
					<p>&copy; 汪小良的博客 (●′ω`●) 由 <a target="_blank" href="http://www.aliyun.com"> Aliyun</a> 提供强力驱动<br>
						&copy; 汪正良版权所有 ❤ 汪正良<br>
						赣ICP备17010062号
					</p>
				</div>
			</footer>
			
			</div>
	</body>
<script type="text/javascript">
	function showMsg(){
		alert("“你是我的谁” 功能正在测试中，稍后开放！")
	}
	function showMsg1(){
		alert("“个人简历” 还在努力打码中，稍后开放！")
	}
</script>
</html>