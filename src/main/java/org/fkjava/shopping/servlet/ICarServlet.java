package org.fkjava.shopping.servlet;

import org.fkjava.shopping.domain.ShopCarData;
import org.fkjava.shopping.domain.User;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ICarServlet {
    //用于查询该用户购物车信息
    List<ShopCarData> carData(User user);

    //用于添加数据到购物车中
    String createCarData(Integer number, Integer id, User user);

    //用于对购物车做商品数量的修改和删操作
    String updateShopCarImpl(Integer articleId,Integer shopNumb,User user);

    //用于计算用户选中的购物车商品的总价
    String calculateArticlePrice(String articleIds,User user);

    //用于购物车商品删除操作
    void deleteCarArticleImpl(Integer articleId,User user);
}
