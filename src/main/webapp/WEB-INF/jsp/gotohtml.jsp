<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>页面跳转</title>
    <link href="${ctx}/resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="${ctx}/resources/css/taobao.css" rel="stylesheet"/>
    <script src="${ctx}/resources/jquery/jquery-3.3.1.js"></script>
    <script src="${ctx}/resources/jquery/jquery-migrate-1.4.1.min.js"></script>
    <script src="${ctx}/resources/bootstrap/js/bootstrap.js"></script>

    <script type="text/javascript">
        $(function(){
            var i = 0;
            var timer = function(){
                if(i<5){
                    console.log(i);
                    $('#goto').html("验证成功，页面5秒后跳转........"+i+"秒");
                    i++;
                }else{
                    clearInterval(t);
                    window.location.href="${ctx}/user/index";
                }
            };
            //注：定时器中调用函数方法没有括号。
            var t = setInterval(timer,1000);
        })

    </script>
</head>
<body>
<jsp:include page="navigationBar.jsp"/>
<div align="center">
    <%--<p style="text-align: center"><h4 style="color: crimson;">注册失败</h4></p>--%>
    <%--<img style="height: 60%;" src="${ctx}/image/342ac65c1038534331d83f1d9813b07eca8088f3.jpg"><br/>--%>
    <p id="goto"></p>

</div>
</body>
</html>
