<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<style type="text/css">
	body{
	   background: url("${pageContext.request.contextPath}/images/bg.jpg") repeat;
	}
	#login-box {
		width:450px;
		border:1px solid #808080;
		padding: 70px;
		border-radius:30px;
		color: #000000;
		opacity: 0.9;
		background: #00FFFF;
	}
	</style>
</head>
<body>
	<div class="container" id="top">
		<div class="row" style="margin-top: 200px; ">
			<div class="col-md-4"></div>
			<div class="col-md-4" id="login-box">
				<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/login" id="from1" method="post">
				  <div class="form-group">
				    <label for="firstname" class="col-sm-3 control-label">用户ID</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="userID" placeholder="请输入用户ID" name="username">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-3 control-label">密码</label>
				    <div class="col-sm-9">
				      <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password">
				    </div>
				  </div>
				  <br/>
				  <div class="form-group pull-left">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button disabled="disabled" type="button" class="btn btn-default btn-info">注册</button>
				    </div>
				  </div>
				  <div class="form-group pull-right" >
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default btn-info">登录</button>
				    </div>
				  </div>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>		
	</div>
</body>
</html>