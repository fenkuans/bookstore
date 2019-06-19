package org.fkjava.shopping.servlet;

import org.fkjava.shopping.page.OrderData;
import org.fkjava.shopping.domain.User;

import java.util.List;

public interface IOrderServlet {

    //需要接收user信息,商品id，商品总价
    void createOrder(String articleIds, User user);

    //用于查询商品详情
    List<OrderData> orderDataAll(User user);

    //用于删除商品详情中的商品
    void deleteOrderShop(Integer orderId,Integer articleId,User user);
}
