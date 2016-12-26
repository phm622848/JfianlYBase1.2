<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- Template Name: Rapido - Responsive Admin Template build with Twitter Bootstrap 3.x Version: 1.0 Author: ClipTheme -->
<!--[if IE 8]><html class="ie8 no-js" lang="en"><![endif]-->
<!--[if IE 9]><html class="ie9 no-js" lang="en"><![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- start: HEAD -->
<head>
	<title>JfinalYBaseV1.2</title>
	<!-- start: META -->
	<meta charset="utf-8" />
	<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta content="" name="description" />
	<meta content="" name="author" />
	<!-- end: META -->
	<!-- start: MAIN CSS -->
	<link rel="stylesheet" href="${basepath}/static/rapido/assets/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${basepath}/static/rapido/assets/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${basepath}/static/rapido/assets/plugins/animate.css/animate.min.css">
	<link rel="stylesheet" href="${basepath}/static/rapido/assets/plugins/iCheck/skins/all.css">
	<link rel="stylesheet" href="${basepath}/static/rapido/assets/css/styles.css">
	<link rel="stylesheet" href="${basepath}/static/rapido/assets/css/styles-responsive.css">
	<!--[if IE 7]>
	<link rel="stylesheet" href="${basepath}/static/rapido/assets/plugins/font-awesome/css/font-awesome-ie7.min.css">
	<![endif]-->
	<!-- end: MAIN CSS -->
	<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
	<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
</head>
<!-- end: HEAD -->
<!-- start: BODY -->
<body class="login">
<div class="row">
	<div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
		<div class="logo">
			<h4>JfinalYBaseV1.2</h4>
		</div>
		<!-- start: LOGIN BOX -->
		<div class="box-login">
			<h3>登录你的账户</h3>
			<p>
				请输入用户名和密码
			</p>
			<form class="form-login" method="post" action="${basepath}/doLogin">
				<div class="errorHandler alert alert-danger no-display">
                    <i class="fa fa-remove-sign"></i><span id="messages">您输入的信息有误，请检查后重新输入！</span>
				</div>
				<div class="successRegHandler alert alert-success no-display">
					<i class="fa fa-remove-sign"></i> 注册成功，请登录！
				</div>
				<div class="regerrorHandler alert alert-danger no-display">
					<i class="fa fa-remove-sign"></i> 注册失败，请重新注册！
				</div>
                <div class="successEmailHandler alert alert-success no-display">
                    <i class="fa fa-remove-sign"></i> 邮件已经发送，请查看邮箱！
                </div>
                <div class="senderrorHandler alert alert-success no-display">
                    <i class="fa fa-remove-sign"></i> 邮件已经发送，请查看邮箱！
                </div>
				<fieldset>
					<div class="form-group">
								<span class="input-icon">
									<input type="text" class="form-control" name="username" placeholder="用户名">
									<i class="fa fa-user"></i> </span>
					</div>
					<div class="form-group form-actions">
								<span class="input-icon">
									<input type="password" class="form-control password" name="password" placeholder="密码">
									<i class="fa fa-lock"></i>
									<a class="forgot" href="#">
										找回密码
									</a>
                                </span>
					</div>
					<div class="form-group form-actions">
						<img src="${basepath}/img"/><br/>
						<input type="text" class="input-block-level" placeholder="验证码" name="captcha" id="captcha" /><br>
					</div>

					<div class="form-actions">
                        <!--
						<label for="rememberMe" class="checkbox-inline">
							<input type="checkbox" class="grey remember" id="rememberMe" name="rememberMe" value="1">
							记住我
						</label>-->
						<button type="submit" class="btn btn-green pull-right">
							登录 <i class="fa fa-arrow-circle-right"></i>
						</button>
					</div>
					<div class="new-account">
						您还没有注册吗？
						<a href="#" class="register">
							建立一个账户
						</a>
					</div>
				</fieldset>
			</form>
			<!-- start: COPYRIGHT -->
			<div class="copyright">
				2014 &copy; Rapido by cg.
			</div>
			<!-- end: COPYRIGHT -->
		</div>
		<!-- end: LOGIN BOX -->
		<!-- start: FORGOT BOX -->
		<div class="box-forgot">
			<h3>找回密码</h3>
			<p>
				请输入您的邮箱便于您找回密码
			</p>
				<div class="errorEmailHandler alert alert-danger no-display">
					<i class="fa fa-remove-sign"></i> 您输入的email有误，请检查后重新输入！
				</div>
            <form class="form-forgot" method="post" action="${basepath}/user/sendReciveEmail">
				<fieldset>
					<div class="form-group">
								<span class="input-icon">
									<input type="email" class="form-control" name="email" id="emailer" placeholder="邮箱">
									<i class="fa fa-envelope"></i></span>
					</div>
					<div class="form-actions">
						<a class="btn btn-light-grey go-back">
							<i class="fa fa-chevron-circle-left"></i> 返回登录
						</a>
						<button type="submit" class="btn btn-green pull-right" id="goSubmit">
							提交 <i class="fa fa-arrow-circle-right"></i>
						</button>
					</div>
				</fieldset>
            </form>
			<!-- start: COPYRIGHT -->
			<div class="copyright">
				2014 &copy; Rapido by cg.
			</div>
			<!-- end: COPYRIGHT -->
		</div>
		<!-- end: FORGOT BOX -->
		<!-- start: REGISTER BOX -->
		<div class="box-register">
			<h3>注册用户</h3>
			<p>
				请输入您的信息:
			</p>
			<form class="form-register" method="post" action="${basepath}/user/registerUser">
				<div class="errorRegHandler alert alert-danger no-display">
					<i class="fa fa-remove-sign"></i> 您输入有误，请查证后重新输入。
				</div>
				<fieldset>
					<div class="form-group">
						<input type="text" class="form-control" id='loginname' name="user.loginName" placeholder="登录名">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="user.name" placeholder="姓名">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="user.no" placeholder="工号">
					</div>
					<div class="form-group">
						<div>
							<label class="radio-inline">
								<input type="radio" class="grey" value="0" name="user.sex">
								男
							</label>
							<label class="radio-inline">
								<input type="radio" class="grey" value="1" name="user.sex">
								女
							</label>
						</div>
					</div>
					<p>
						请输入账号的详细信息:
					</p>
					<div class="form-group">
								<span class="input-icon">
									<input type="email" class="form-control" name="user.email" id="useremail" placeholder="邮箱">
									<i class="fa fa-envelope"></i> </span>
					</div>
					<div class="form-group">
								<span class="input-icon">
									<input type="text" class="form-control" name="user.phone" placeholder="手机号码">
									<i class="fa fa-mobile-phone"></i> </span>
					</div>
					<div class="form-group">
								<span class="input-icon">
									<input type="password" class="form-control" id="password" name="user.password" placeholder="密码">
									<i class="fa fa-lock"></i> </span>
					</div>
					<div class="form-group">
								<span class="input-icon">
									<input type="password" class="form-control" name="password_again" placeholder="重复输入密码">
									<i class="fa fa-lock"></i> </span>
					</div>
					<div class="form-group">
						<div>
							<label for="agree" class="checkbox-inline">
								<input type="checkbox" class="grey agree" id="agree" name="agree">
								我同意相关的协议
							</label>
						</div>
					</div>
					<div class="form-actions">
						已注册账号
						<a href="#" class="go-back">
							登录
						</a>
						<button type="submit" class="btn btn-green pull-right">
							提交 <i class="fa fa-arrow-circle-right"></i>
						</button>
					</div>
				</fieldset>
			</form>
			<!-- start: COPYRIGHT -->
			<div class="copyright">
				2014 &copy; Rapido by cg.
			</div>
			<!-- end: COPYRIGHT -->
		</div>
		<!-- end: REGISTER BOX -->
	</div>
</div>
<input type="hidden" id="successType" value="${successType}" />
<input type="hidden" id="basepath" value="${basepath}" />
<input type="hidden" id="msg" value="${msg}" />
<!-- start: MAIN JAVASCRIPTS -->
<!--[if lt IE 9]>
<script type="text/javascript" src="${basepath}/static/rapido/assets/plugins/respond.min.js"></script>
<script type="text/javascript" src="${basepath}/static/rapido/assets/plugins/excanvas.min.js"></script>
<script type="text/javascript" src="${basepath}/static/rapido/assets/plugins/jQuery/jquery-1.11.1.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script type="text/javascript" src="${basepath}/static/rapido/assets/plugins/jQuery/jquery-2.1.1.min.js"></script>
<!--<![endif]-->
<script type="text/javascript" src="${basepath}/static/rapido/assets/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="${basepath}/static/rapido/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basepath}/static/rapido/assets/plugins/iCheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="${basepath}/static/rapido/assets/plugins/jquery.transit/jquery.transit.js"></script>
<script type="text/javascript" src="${basepath}/static/rapido/assets/plugins/TouchSwipe/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="${basepath}/static/rapido/assets/js/main.js"></script>
<!-- end: MAIN JAVASCRIPTS -->
<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
<script type="text/javascript" src="${basepath}/static/rapido/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="${basepath}/static/rapido/assets/plugins/jquery-validation/localization/messages_zh.js"></script>
<script type="text/javascript" src="${basepath}/static/js/page/login.js"></script>
<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
<script>
    jQuery(document).ready(function() {
        Main.init();
        Login.init();
    });
</script>
</body>
<!-- end: BODY -->
</html>