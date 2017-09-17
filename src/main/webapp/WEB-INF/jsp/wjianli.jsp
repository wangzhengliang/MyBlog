<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<html>
	<head>
		<title>汪正良的简历</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${APP_PATH }/jianli/assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
<body>

	<!-- 头部 -->
	<section id="header">
		<header>
			<span class="image avatar"><img src="images/avatar.jpg" alt="" /></span>
			<h1 id="logo"><a href="#">汪正良</a></h1>
			<p>zhi shi gai bian ming yun <br />
			day day up!</p>
		</header>
		<nav id="nav">
			<ul>
				<li><a href="#one" class="active">关于</a></li>
				<li><a href="#two">我的技能</a></li>
				<li><a href="#three">最近动态</a></li>
				<li><a href="#four">联系我</a></li>
			</ul>
		</nav>
		<footer>
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
				<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
			</ul>
		</footer>
	</section>

	<!-- 主体 -->
	<div id="wrapper">

	<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one">
				<div class="container">
					<header class="major">
						<h2>关于我</h2>
						<p>汪正良，95年出生于江西万年，18年将毕业于江西农业大学，本科专业是物联网工程，在校期间软硬皆有接触，个人发展放心偏软件，立志当一名优秀的JAVA工程师
						 <a href="${APP_PATH }/getAllDiary.action">点击查看</a> 我的个人博客。</p>
					</header>
					<p></p>
				</div>
			</section>

			<!-- Two -->
			<section id="two">
				<div class="container">
					<h3>我的技能</h3>
					<p>因为本科专业是物联网，大一学习了一年的硬件，但是发现自己对这方面真的是不感兴趣，得益于学院的优秀制度，在大二下学期在老师和同学的帮助下开始转学JAVA，虽然天资不是很好，但在老师和同学的帮助下也积累了不少知识，能够独立完成一些开发任务：</p>
					<ul class="feature-icons">
						<li class="fa-code">独立编码，实现某些特定需求</li>
						<li class="fa-cubes">熟悉sql语句，熟悉使用Mysql数据库</li>
						<li class="fa-book">能够独立看文档</li>
						<li class="fa-coffee">会使用Maven管理项目</li>
						<li class="fa-bolt">会使用SVN</li>
						<li class="fa-users">熟练使用SSM、SSH等JAVA领域的主类框架</li>
					</ul>
				</div>
			</section>

			<!-- Three -->
			<section id="three">
				<div class="container">
					<h3>最近动态</h3>
					<p>内容来源与我的博客，<a href="#">点击</a> 浏览我的博客主页</p>
					<div class="features">
						<article>
							<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
							<div class="inner">
								<h4>Possibly broke spacetime</h4>
								<p>Integer eu ante ornare amet commetus vestibulum blandit integer in curae ac faucibus integer adipiscing ornare amet.</p>
							</div>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a>
							<div class="inner">
								<h4>Terraformed a small moon</h4>
								<p>Integer eu ante ornare amet commetus vestibulum blandit integer in curae ac faucibus integer adipiscing ornare amet.</p>
							</div>
						</article>
						<article>
							<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a>
							<div class="inner">
								<h4>Snapped dark matter in the wild</h4>
								<p>Integer eu ante ornare amet commetus vestibulum blandit integer in curae ac faucibus integer adipiscing ornare amet.</p>
							</div>
						</article>
					</div>
				</div>
			</section>

			<!-- Four -->
			<section id="four">
				<div class="container">
					<h3>联系我</h3>
					<p>可以在下面留下您的联系方式，我会根据您留下的消息找到你</p>
					<form method="post" action="#">
						<div class="row uniform">
							<div class="6u 12u(xsmall)"><input type="text" name="name" id="name" placeholder="尊称" /></div>
							<div class="6u 12u(xsmall)"><input type="email" name="email" id="email" placeholder="邮箱" /></div>
						</div>
						<div class="row uniform">
							<div class="12u"><input type="text" name="subject" id="subject" placeholder="留言主题" /></div>
						</div>
						<div class="row uniform">
							<div class="12u"><textarea name="message" id="message" placeholder="留言内容" rows="6"></textarea></div>
						</div>
						<div class="row uniform">
							<div class="12u">
								<ul class="actions">
									<li><input type="submit" class="special" value="发送信息" /></li>
									<li><input type="reset" value="重置" /></li>
								</ul>
							</div>
						</div>
					</form>
				</div>
			</section>

			<!-- Footer -->
			<section id="footer">
					<div class="container">
						<ul class="copyright">
							<li>汪正良的个人简历</li>
							<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</div>
				</section>

		</div>
</div>
	
	<!-- Scripts -->
	<script src="${APP_PATH }/jianli/assets/js/jquery.min.js"></script>
	<script src="${APP_PATH }/jianli/assets/js/jquery.scrollzer.min.js"></script>
	<script src="${APP_PATH }/jianli/assets/js/jquery.scrolly.min.js"></script>
	<script src="${APP_PATH }/jianli/assets/js/skel.min.js"></script>
	<script src="${APP_PATH }/jianli/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${APP_PATH }/jianli/assets/js/main.js"></script>

</body>
</html>