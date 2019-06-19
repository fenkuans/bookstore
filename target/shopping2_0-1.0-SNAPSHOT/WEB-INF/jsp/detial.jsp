<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>商品详情</title>
<link href="${ctx}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="${ctx}/resources/css/taobao.css" rel="stylesheet" />
<script src="${ctx}/resources/jquery/jquery-3.3.1.js"></script>
<script src="${ctx}/resources/bootstrap/js/bootstrap.js"></script>
<%--<script src="${ctx}/resources/js/taobao.js"></script>--%>

</head>
<script type="text/javascript">
	window.onload=function () {
		console.log("文档加载完成后执行!");
			//获取input便签中的value值，该便签用来显示添加商品的数量
			var numb = parseInt(document.getElementById("number").value);
            $('#number').keyup(function(){
                numb = parseInt(document.getElementById("number").value);
            });
			//为添加商品和减少商品两个按钮绑定点击事件
			 document.getElementById("down").onclick=function () {
				 numb = numb-1>0?numb-1:numb;
                 $('#number').val(numb);
				 console.log("down"+numb);
			 };
			 document.getElementById("up").onclick=function () {
				 numb = numb+1 != ${detailData.storage}?numb+1:numb;
				 //将计算好的商品数量写会到input标签的value中
				 $('#number').val(numb);
				 console.log("up"+numb);
			 };

	    //为加入购物车操作绑定点击事件
        $("#submits").click(function () {
            console.log('触发加入购物车事件');
            console.log("shopnumb"+numb);
            $.ajax({
                //该请求地址是做数据库添加操作
                url:'${ctx}/car/shopCarData',
                data:{shopnumb:numb,shopId:${detailData.id}},
                dataType:'text',
                async:true,
                success:function(datas){
                    console.log("datas"+datas);
                    if("success"==datas){
                        $('#addShop,#addUrl').remove();
                        $('#submits').after('<a id="addShop" style="color:red;">商品添加成功!快去购物车看看吧！</a>' +
                            '<a id="addUrl" href="${ctx}/car/usercar">点我前往购物车</a>')
                    }else{
                        alert("添加购物车失败："+datas);
                    }


                },
                complete:function(XMLHttpRequest){
                    //获取response中的指定参数
                    var responseVerify = XMLHttpRequest.getResponseHeader("ResponseVerify")
                    if("TIMEOUT"==responseVerify){
                       var returnUrl =  XMLHttpRequest.getResponseHeader("ReturnUrl")
                        window.location.href=returnUrl;
                    }
                }
            });

        });

	}

</script>
<body>
	<!-- 横幅导航条开始 -->
	<jsp:include page="navigationBar.jsp"/>
	<!--  横幅下方的主体开始 -->
	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<!-- 内容主体开始 -->

				<div class="col-xs-12 col-sm-12">
					<div class="col-xs-12 col-sm-6">
						<img alt="商品的图片" src="${ctx}/article/${detailData.image}">
					</div>
					<div class="col-xs-12 col-sm-6">
						<p>${detailData.title}</p>
						<p>${detailData.supplier}</p>
						<p>${detailData.locality}</p>
						<p>
							<span class="price">${detailData.price}</span>

						</p>
						<p>
							库存量：<span id="storage">${detailData.storage}</span>
						</p>
						<p>
<%--						<form method="get" action="${ctx}/car/createCarData">--%>
<%--							<input type="hidden" name="articleId" value="${detailData.id}"/>--%>
							<span id="down" style="font-weight: bold; font-size: 18px; cursor: pointer; margin-left: 10px; margin-right: 10px;">-</span>
							<input id="number" name="number" value="${shopNumb==null?'1':shopNumb}"  style="width: 50px;" />
							<span id="up" style="font-weight: bold; font-size: 18px; cursor: pointer; margin-left: 10px; margin-right: 10px;">+</span>
							<button id="submits">

                                <%--使用ajax来做购物车添加动作。添加成功返回商品添加成功信息（弹窗形式）--%>
							<span class="glyphicon glyphicon-shopping-cart"
								  style="color: red;"></span>加入购物车
							</button>

<%--						</form>--%>
						</p>
					</div>
					<div class="col-xs-12">
						<fieldset>
							<legend>介绍</legend>
							${detailData.description}
						</fieldset>
					</div>
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
	<!--/.container-->
	<!--  横幅下方的主体结束 -->

</body>
</html>