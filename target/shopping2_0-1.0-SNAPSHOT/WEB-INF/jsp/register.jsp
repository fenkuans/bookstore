<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>注册页面</title>
<!-- Bootstrap core CSS -->
	<link href="${ctx}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
	<link href="${ctx}/resources/css/taobao.css" rel="stylesheet" />
	<script src="${ctx}/resources/jquery/jquery-3.3.1.js"></script>
	<script src="${ctx}/resources/jquery/jquery-migrate-1.4.1.min.js"></script>
	<script src="${ctx}/resources/bootstrap/js/bootstrap.js"></script>
	<script src="${ctx}/resources/bootstrap/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript">
		$(function(){

		})
	</script>
</head>
<body>
	<!-- 横幅导航条开始 -->
	<jsp:include page="navigationBar.jsp"/>
	<!--  横幅下方的主体开始 -->
	<div class="container">
		<div class="row info-content">
			<form id="registerForm" class="form-horizontal" method="post"
				action="${ctx}/user/userRegister" style="margin-top: 20px;">
				<div class="form-group">
					<label class="col-sm-2 control-label">登录名称</label>
					<div class="col-sm-3">
						<input type="text" value="" id="loginName" name="username"
							class="form-control" placeholder="请输入您的登陆名称">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">真实姓名</label>
					<div class="col-sm-3">
						<input type="text" id="name" value="" name="name"
							class="form-control" placeholder="请输入您的真实姓名">
					</div>

				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">登陆密码</label>
					<div class="col-sm-3">
						<input type="password" id="password" name="password"
							class="form-control" placeholder="请输入您的密码">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">确认密码</label>
					<div class="col-sm-3">
						<input type="password" id="okPassword" name="okpassword"
							class="form-control" placeholder="请输入您的确认密码">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">性别</label>
					<div class="col-sm-3">
						<label>男:</label><input name="sex" value="1" type="radio"
							checked="checked"> <label>女:</label><input
							name="user.sex" value="2" type="radio">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">联系电话</label>
					<div class="col-sm-3">
						<input type="text" id="phone" value="" name="phone"
							class="form-control" placeholder="请输入您的电话">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">地址</label>
					<div class="col-sm-8">
						<textarea id="address" name="address" rows="4" cols="30"
							class="form-control" placeholder="请输入您的地址信息"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">电子邮箱:</label>
					<div class="col-sm-3">
						<input type="text" id="email" value="" name="email"
							class="form-control" placeholder="请输入您的邮箱">
					</div>
					<div class="col-sm-3">
						<span style="color: red;"></span>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-3">
						<input type="submit" class="glyphicon glyphicon-user btn btn-success" value="注册" id="btn_submit">
					</div>
				</div>
			</form>
		</div>
		<footer>
			<p>&copy; 版权所有，欢迎借鉴</p>
		</footer>

		<script>

			$('#registerForm').bootstrapValidator({
				//       live: 'disabled',
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					"name" : {
						validators : {
							notEmpty : {
								message : '真实姓名不能为空'
							}
						}
					},
					"username" : {
						message : '用户名验证失败',
						validators : {
							notEmpty : {
								message : '用户名不能为空'
							},
							stringLength : {
								min : 5,
								max : 30,
								message : '用户名长度5到30位'
							},
							remote:{
							    message:'该用户名已被注册',
								url:'${ctx}/user/usernameVerification',
								data:'',
								delay:2000

							}
						}
					},
					"email" : {
						validators : {
							notEmpty : {
								message : '邮箱不能为空'
							},
							emailAddress : {
								message : '邮箱格式不正确'
							}
						}
					},
					"phone" : {
						validators : {
							notEmpty : {
								message : '电话不能为空'
							},
							phone : {
								message : '电话号码错误',
								country : 'CN'
							}
						}
					},
					"password" : {
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
							different : {
								field : 'user.loginName',
								message : '用户名和密码不能相同'
							}
						}
					},
					"okpassword" : {
						validators : {
							notEmpty : {
								message : '确认密码不能为空'
							},
							identical : {
								field : 'user.password',
								message : '两次密码不相同'
							},
							different : {
								field : 'user.loginName',
								message : '用户名和密码不能相同'
							}
						}
					},
					"address" : {
						validators : {
							notEmpty : {
								message : '地址不能为空'
							}
						}
					}
				}
			});

			// $('#btn_submit').click(function() {
			// 	$('#registerForm').bootstrapValidator('validate');
			// });
		</script>
	</div>
	<!--  横幅下方的主体结束 -->
</body>
</html>