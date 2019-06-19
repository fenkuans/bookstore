<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>购物车</title>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="${ctx}/resources/css/taobao.css" rel="stylesheet"/>
    <script src="${ctx}/resources/jquery/jquery-3.3.1.js"></script>
    <script src="${ctx}/resources/jquery/jquery-migrate-1.4.1.min.js"></script>
    <script src="${ctx}/resources/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        //文档加载完成以后
        $(function () {
            //商品选中与不选中函数
            $('#checkAll').click(function(){
                if($('#checkAll').prop('checked')==true){
                    $('input[type="checkbox"]').prop('checked',true);
                    calculatePrice();
                }else{
                    $('input[type="checkbox"]').prop('checked',false);
                    $("#totalMoney").html(0+'元');
                }
                $('#shopSubmit').html($('input[type="checkbox"]:not([id="checkAll"]):checked').size());
            });

            //单点选中函数
            $('input[type="checkbox"]:not([id="checkAll"])').click(function(){
                if($('input[type="checkbox"]:not([id="checkAll"]):checked').size()==$('input[type="checkbox"]:not([id="checkAll"])').size()){
                    $('#checkAll').prop('checked',true);
                }else{
                    $('#checkAll').prop('checked',false);
                }
                $('#shopSubmit').html($('input[type="checkbox"]:not([id="checkAll"]):checked').size());
                calculatePrice();
            });

            //商品提交
            $('#commitOrder').click(function () {
                console.log("商品提交订单触发！")
                var calculateArticleId = $('input[type="checkbox"]:checked:not([id="checkAll"])').map(function(){
                    return this.value;
                });
                if (calculateArticleId==null){
                    alert("请选择需要购买的商品！亲！！")
                }else{

                    console.log("commitOrder"+calculateArticleId.get());
                    // var calculateArticleJson = JSON.stringify(calculateArticleId.get());
                    // console.log(calculateArticleJson);
                    window.location.href="${ctx}/order/userOrder?articleIds="+calculateArticleId.get();
                }
            });
        });
    </script>
</head>
<body>
<!-- 横幅导航条开始 -->
<jsp:include page="navigationBar.jsp"/>
<!--  横幅下方的主体开始 -->
<div class="container">
    <div class="row row-offcanvas row-offcanvas-right">
        <!--弹窗内容开始-->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">确认删除</h4>
                    </div>
                    <form action="${ctx}/car/deleteCarArticle">
                    <div class="modal-body">
                        <table class="table table-bordered">


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
        <!-- 内容主体开始 -->
        <div class="col-xs-12 col-sm-12">
            <div>当前位置：我的购物车</div>
            <div class="table-responsive">
                <c:if test="${userCar.size()==0}">
                    <div align="center">
                        <img style="height: 60%;" src="${ctx}/image/shopCartEmpty.jpg"><br/>
                        <p style="text-align: center"><a href="${ctx}/user/index">购物车空空如也！快去选购吧！</a></p>
                    </div>

                </c:if>

                <c:if test="${userCar.size()!=0}">
                <table class="table table-hover table-bordered table-striped">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="checkAll"></th>
                        <th style="width: 15%">图片</th>
                        <th style="width: 50%">名称</th>
                        <th style="width: 10%">价格</th>
                        <th style="width: 10%">数量</th>
                        <th style="width: 8%">小计</th>
                        <th style="width: 7%">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userCar}" var="carData">
                    <tr>
                            <td style="vertical-align: middle;">
                                <input type="checkbox" value="${carData.articleId}" name="box" id="box_${carData.articleId}"/>
                                <span id="total_1" style="display: none;">${carData.totalPrices}</span></td>
                            <td><img style="height: 200px;width: 200px;" alt="商品图片" src="${ctx}/article/${carData.image}"></td>
                            <td><a href="${ctx}/user/detail?id=${carData.articleId}">${carData.title}</a></td>
                            <td><span>${carData.price}</span></td>
                            <td>
                                <span id="up" class="glyphicon glyphicon-minus" onclick="shopNumber(parseInt(document.getElementById('${carData.articleId}').value)-1,${carData.articleId},document.getElementById('box_'+${carData.articleId}).checked)"></span>
                                <input id="${carData.articleId}" value="${carData.articleNumb}" style="width: 40px; text-align: center;"
                                       onkeyup="shopNumber($('#${carData.articleId}').val(),${carData.articleId})"/>
                                <span id="down" class="glyphicon glyphicon-plus" onclick="shopNumber(parseInt(document.getElementById('${carData.articleId}').value)+1,${carData.articleId},document.getElementById('box_'+${carData.articleId}).checked)"></span>
                            </td>
                            <td id="totalPrices">${carData.totalPrices}</td>
                            <td>
                                <input type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" value="删除" onclick="popup('${carData.image}','${carData.title}',${carData.articleId})" />
                            </td>
                    </tr>
                    </c:forEach>

                    <script type="text/javascript">
                        function shopNumber(numberData,articleId,checkState){
                            console.log("shopNumber Test"+numberData);
                            console.log(articleId );
                            if (numberData==0){
                                console.log(numberData);
                                $.ajax({
                                    //请求地址
                                    url:"${ctx}/car/updateShopCar",
                                    data:{articleId:articleId,shopNumb:1},
                                    async:true,
                                    dataType:"json",
                                    success:function(shopCarData){
                                        document.getElementById(shopCarData.articleId).value = shopCarData.articleNumb;
                                        $('#totalPrices').html(shopCarData.totalPrices);
                                        if(checkState){
                                            calculatePrice();
                                        }
                                    }
                                });
                                alert("商品数量不能小于0");
                            } else{
                                $.ajax({
                                    //请求地址
                                    url:"${ctx}/car/updateShopCar",
                                    data:{articleId:articleId,shopNumb:numberData},
                                    async:true,
                                    dataType:"json",
                                    success:function(shopCarData){
                                        if(shopCarData.state==1){
                                            document.getElementById(shopCarData.articleId).value = shopCarData.articleNumb;
                                            $('#totalPrices').html(shopCarData.totalPrices);
                                        }else{
                                            alert("库存不足！");
                                            document.getElementById(shopCarData.articleId).value = shopCarData.articleNumb;
                                            $('#totalPrices').html(shopCarData.totalPrices);

                                        }
                                        //文档加载完成后才能获得input元素
                                        // console.log($('input[type="checkbox"][value=articleId]:checked').prop('checked'));
                                        if(checkState){
                                            calculatePrice();
                                        }
                                    },
                                    complete:function(){
                                        console.log($('input[type="checkbox"][value=articleId]:checked').prop('checked'));
                                    }
                                });
                            }
                        }

                        var calculatePrice = function(){
                            console.log("商品计算触发！");
                            var calculateArticleId = $('input[type="checkbox"]:checked:not([id="checkAll"])').map(function(){
                                return this.value;
                            });
                            console.log("cal"+calculateArticleId.get());
                            var calculateArticleJson = JSON.stringify(calculateArticleId.get());
                            console.log(calculateArticleJson);
                            $.ajax({
                                url:'${ctx}/car/calculatePrice',
                                data:{articleIds:calculateArticleJson},
                                dataType:'text',
                                async:true,
                                success:function(msg){
                                    console.log("msg："+msg);
                                    $("#totalMoney").html(msg+'元');
                                }
                            })
                        };

                        //操作弹窗
                        var popup = function(image,titles,articleId) {
                            console.log(articleId);
                            console.log(image);

                            $('#shopImg').attr('src','${ctx}/article/'+image);
                            $('#shopTitle').html(titles);
                            $('#articleId').val(articleId);
                        }

                    </script>
                    </tbody>
                </table>

            </div>
        </div>
        <!-- 内容主体结束 -->
    </div>
    <!--/row-->

    <div align="right">
        总金额:<span id="totalMoney" style="color: red;">0元</span>&nbsp;&nbsp;&nbsp;&nbsp;
        <button id="commitOrder" class="btn btn-danger" type="button">
            提交订单 <span id="shopSubmit" class="badge">0</span>
        </button>
    </div>
    </c:if>
    <hr>
    <footer>
        <p>&copy; 版权所有，欢迎借鉴</p>
    </footer>
</div>
<!--/.container-->
<!--  横幅下方的主体结束 -->
</body>
</html>