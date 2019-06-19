<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>登录页面</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/taobao.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">

	</script>
</head>


<body>
	<!-- 横幅导航条开始 -->
<jsp:include page="navigationBar.jsp"/>
	<!--  横幅下方的主体开始 -->
	<div class="container">
		<!-- 入门-->
		<!-- 登录界面 -->
		<div class="page-header">
			<h1>用户登录</h1>
		</div>
		<form class="form-horizontal" method="post" action="${ctx}/user/loginVerification">
            <input type="hidden" name="contextUrl" value="${contextUrl}"/>
			<div class="form-group">
				<div class="col-sm-4">
					<span style="color: red;">${mags}
					<input class="form-control" value="${userName}" placeholder="用户名/邮箱"
						type="text" id="userName" name="userName" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-4">
					<input class="form-control" placeholder="密码" id="password"
						type="password" name="password" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-4">
					<span style="color: red;"></span>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-4">
					<div class="btn-group btn-group-justified" role="group"
						aria-label="...">
						<div class="btn-group" role="group">
							<button type="submit" id="loginBtn" class="btn btn-success">
								<span class="glyphicon glyphicon-log-in"></span>&nbsp;登录
							</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-danger">
								<span class="glyphicon glyphicon-edit"></span>注册
							</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<hr>

		<!-- 彈出框-->
		<div id="myModal" class="modal bs-example-modal-sm fade">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">登录提示</h4>
					</div>
					<div class="modal-body">
						<p id="tip"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="sure" type="button" class="btn btn-primary"
							data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>

		<footer>
			<p>&copy; 版权所有，欢迎借鉴</p>
		</footer>

	</div>
	<!--/.container-->
	<!--  横幅下方的主体结束 -->
</body>
</html>