<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>商品详情</title>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="${ctx}/resources/css/taobao.css" rel="stylesheet"/>
    <script src="${ctx}/resources/jquery/jquery-3.3.1.js"></script>
    <script src="${ctx}/resources/jquery/jquery-migrate-1.4.1.min.js"></script>
    <script src="${ctx}/resources/bootstrap/js/bootstrap.js"></script>

    <script type="text/javascript">
        var popup = function(orderId,articleId,title,image){
            $('#orderId').val(orderId);
            $('#articleId').val(articleId);
            $('#shopImg').attr("src","${ctx}/article/"+image);
            $('#shopTitle').html(title);
        }
    </script>
</head>

<body>
<!-- 横幅导航条开始 -->
<jsp:include page="navigationBar.jsp"/>

<!--弹窗内容开始-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">确认删除</h4>
            </div>
            <form action="${ctx}/order/deleteOrderItem">
                <div class="modal-body">
                    <table class="table table-bordered">

                        <input id="orderId" type="hidden" name="orderId" value="">
                        <input id="articleId" name="articleId" type="hidden" value=""/>
                        <tr>
                            <td style="height: 100px;width: 100px;"><img id="shopImg" src="" style="height: 100px;width: 100px;"></td>
                            <td><a id="shopTitle" style="display:block;"></a></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button id="deleteShop" type="submit" class="btn btn-danger">删除</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>

        </div>
    </div>
</div>
<!--弹窗内容结束-->

<!--  横幅下方的主体开始 -->
<div class="container">
    <c:forEach items="${orderData}" var="order">
        <div class="table-responsive">
            <p style="display: block;text-align: left;color: #9d9d9d; font-size: 12px">订单编号：${order.order.orderCode}</p>
            <table class="table table-hover table-bordered table-striped">
                <thead>
                <tr>
                    <th style="width: 15%">图片</th>
                    <th style="width: 50%">名称</th>
                    <th style="width: 10%">价格</th>
                    <th style="width: 8%">数量</th>
                    <th style="width: 7%">操作</th>
                </tr>
                </thead>
                <c:forEach items="${order.orderItems}" var="orderItem">
                    <tbody>
                    <tr>
                        <td>
                            <img style="height: 200px; width: 200px;" alt="商品图片"
                                 src="${ctx}/article/${orderItem.article.image}">
                        </td>
                        <td>
                                ${orderItem.article.title}
                        </td>
                        <td>
                            <span>${orderItem.article.price}</span>

                        </td>
                        <td>
                                ${orderItem.orderNum}
                        </td>
                        <td>
                            <input type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"
                                   value="删除" onclick="popup(${orderItem.orderId},${orderItem.articleId},'${orderItem.article.title}','${orderItem.article.image}')"/>
                        </td>
                    </tr>
                    </tbody>
                </c:forEach>

            </table>
        </div>
    </c:forEach>
    <footer>
        <p>&copy; 版权所有，欢迎借鉴</p>
    </footer>

</div>
</body>
</html>