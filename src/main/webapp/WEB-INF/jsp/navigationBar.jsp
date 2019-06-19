<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- 横幅导航条开始 -->
<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                    aria-controls="navbar">
                <span class="sr-only">显示导航条</span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${ctx}/user/index">疯狂购物</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="${urI eq '/user/index'?'active':''}"><a href="${ctx}/user/index">首页</a></li>
                <li class="${urI eq '/car/usercar'?'active':''}"><a href="${ctx}/car/usercar">购物车</a></li>
                <li class="${urI eq '/order/showOrder'?'active':''}"><a href="${ctx}/order/showOrder">我的订单</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"> <span style='color: red;'></span>
                </a></li>
                <c:if test="${sessionScope.LOGIN_SESSION_IN!=null}">
                    <li><a>欢迎:</a></li>
                    <li><a style="color: red;">${sessionScope.LOGIN_SESSION_IN.name}</a></li>
                </c:if>
                <c:if test="${sessionScope.LOGIN_SESSION_IN==null}">
                    <li><a href="${ctx}/user/login">登录</a></li>
                    <li><a href="${ctx}/user/registration">免费注册</a></li>
                </c:if>
            </ul>
        </div>
        <!-- /.nav-collapse -->
    </div>
    <!-- /.container -->
</nav>
<!-- 横幅导航条结束 -->