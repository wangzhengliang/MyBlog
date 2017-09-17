<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%pageContext.setAttribute("APP_PATH",request.getContextPath()); %>

<html>
<head>
<title>汪正良的博客  | 登陆后台</title>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="${APP_PATH }/login/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/login/css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="${APP_PATH }/login/css/component.css" />
<!-- 网站图标 -->
<link href='${APP_PATH }/images/logo.ico' rel='icon' type='image/x-icon'/>
</head>
<body>
	
<div class="container demo-1">
	<div class="content">
		<div id="large-header" class="large-header">
			<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<h3>Hello,Mr Wang</h3>
					<form id="form" action="${APP_PATH}/login.action" method="post">
						<div class="input_outer">
							<span class="u_user"></span>
							<input id="name" name="mname" class="text" style="color: #FFFFFF !important" type="text" placeholder="wzl" value="wzl">
						</div>
						<div class="input_outer">
							<span class="us_uer"></span>
							<input id="password" name="mpassword" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" value="" type="password" placeholder="请输入密码">
						</div>
						<center id="msg" style="color: red;">${msg }</center>
						<div class="mb2"><a class="act-but submit" onclick="$('#form').submit();return login()" style="color: #FFFFFF">登录</a></div>
					</form>
				</div>
		</div>
	</div>
</div><!-- /container -->
	<script type="text/javascript">
		function login(){
			var name = $("#name").val();
			var password = $("#password").val();
			var msg = $("#msg");
			if(password == null || password == ''){
				msg.html("密码不能为空！")
				return false;
			}
			return true;
		}
	</script>
	<script src="${APP_PATH }/login/js/TweenLite.min.js"></script>
	<script src="${APP_PATH }/login/js/EasePack.min.js"></script>
	<script src="${APP_PATH }/login/js/rAF.js"></script>
	<script src="${APP_PATH }/login/js/demo-1.js"></script>
</body>	
</html>