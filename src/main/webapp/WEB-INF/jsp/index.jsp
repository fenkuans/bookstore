<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>
<html>
<head>
    <title>商品首页</title>
    <link href="${ctx}/resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="${ctx}/resources/css/taobao.css" rel="stylesheet"/>
</head>
<script src="${ctx}/resources/jquery/jquery-3.3.1.js"></script>
<script src="${ctx}/resources/bootstrap/js/bootstrap.js"></script>
<body>

<jsp:include page="navigationBar.jsp"/>
<!--  横幅下方的主体开始 -->
<div class="container">
    <div class="row row-offcanvas row-offcanvas-right">
        <!-- 侧边导航开始 -->
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar"
             role="navigation">
            <div class="list-group">
                <c:forEach items="${IndexData.oneCodeData}" var="oneType">
                    <a href="${ctx}/user/index?parameterIndex=${oneType.code}" class="list-group-item ${ParameterIndex eq oneType.code ?'active':'' or empty ParameterIndex ?'':(ParameterIndex.substring(0,4) eq oneType.code?'active':'')}">${oneType.name}</a>
                </c:forEach>
            </div>
        </div>
        <!--  侧边导航结束 -->
        <!-- 内容主体开始 -->
        <div class="col-xs-12 col-sm-9">
            <p class="pull-right visible-xs">
                <button type="button" class="btn btn-primary btn-xs"
                        data-toggle="offcanvas">显示导航条
                </button>
            </p>
            <div class="alert alert-info" role="alert">
                <c:if test="${IndexData.towCOdeData!=null}">
                    <c:forEach var="towType" items="${IndexData.towCOdeData}">
                        <a href="${ctx}/user/index?parameterIndex=${towType.code}"
                           class="btn btn-default ${ParameterIndex eq towType.code?'active':''}">${towType.remark}</a>
                    </c:forEach>
                </c:if>
                <div>
                    <form action="shop/index.action" method="get">
                        <!-- 如果当前选择了商品的类型，仅在该类型下面进行搜索 -->
                        <input type="hidden" name="typeCode" value="0001"/> <input
                            name="keyword" value=""/>
                        <button type="submit">搜索</button>
                    </form>
                </div>
            </div>

            <div class="row">
                <c:forEach var="articleData" items="${IndexData.articleData}">
                    <div class="col-xs-6 col-lg-4">
						<span class="thumbnail">
                            <a href="${ctx}/user/detail?id=${articleData.id}" target="_blank">
								<img height="100%" width="100%" src="${ctx}/article/${articleData.image}" alt="...">
								<p style="height: 20px; overflow: hidden;">${articleData.title}</p>
                            </a>
							<p>
								<span>${articleData.price}</span>
							</p>
						</span>
                    </div>
                </c:forEach>
            </div>
            <!--  分页开始 -->

            <div class="row">
                <nav/>
                <ul class="pagination">
                    <div>
                        <a href="${ctx}/user/index">首页</a>
                        <a href="${ctx}/user/index?page=${pageNumb.upNumb}&parameterIndex=${ParameterIndex}">上一页</a>
                        <a href="${ctx}/user/index?page=${pageNumb.nextNumb}&parameterIndex=${ParameterIndex}">下一页</a>
                        <a href='${ctx}/user/index?page=${pageNumb.allNumb}&parameterIndex=${ParameterIndex}'>尾页</a> &nbsp;
                        <span>第&nbsp;${pageNumb.numb}&nbsp;页/共&nbsp; ${pageNumb.allNumb}页 ，共 ${pageNumb.allDataNumb} 条数据 </span>
                    </div>
                </ul>
            </div>
            <!-- 分页结束 -->
        </div>
        <!--/.col-xs-12.col-sm-9-->
        <!-- 内容主体结束 -->
    </div>
    <!--/row-->
    <hr>
    <footer>
        <p>&copy; 版权所有，欢迎借鉴</p>
    </footer>
</div>
</body>
</html>