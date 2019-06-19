package org.fkjava.shopping.servlet.impl;

import org.fkjava.shopping.dao.ActicleMapper;
import org.fkjava.shopping.dao.OrderMapper;
import org.fkjava.shopping.dao.ShopCarMapper;
import org.fkjava.shopping.domain.*;
import org.fkjava.shopping.page.OrderData;
import org.fkjava.shopping.servlet.IOrderServlet;
import org.fkjava.shopping.util.CalculateCarPrice;
import org.fkjava.shopping.util.GetMapperUtil;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class OrderServletImp implements IOrderServlet {


    @Override
    public void createOrder(String articleIds, User user) {
        try {
            if (user != null && !"".equals(articleIds) && articleIds != null) {
                String orderCode = UUID.randomUUID().toString();
                Date date = new Date();
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String format = df.format(date);
                OrderMapper orderMapper = GetMapperUtil.getMapperObject(OrderMapper.class);
                ShopCarMapper shopCarMapper = GetMapperUtil.getMapperObject(ShopCarMapper.class);
                String s = CalculateCarPrice.calculatePrices(articleIds, user);
                orderMapper.insertOrder(orderCode, format, format, "1", Double.valueOf(s), user.getId());
                //创建订单详情表
                Integer orderId = orderMapper.findOrderId(orderCode);
                List<ShopCarData> shopCarData = shopCarMapper.finalCarData(user.getId());
                for (ShopCarData shopCarDatas : shopCarData) {
                    if (articleIds.indexOf(String.valueOf(shopCarDatas.getArticleId())) != -1) {
                        orderMapper.insertOrderItem(orderId, shopCarDatas.getArticleId(), shopCarDatas.getArticleNumb());
                        shopCarMapper.deleteUserCarArticle(shopCarDatas.getArticleId(), user.getId());
                    }
                }
            } else {
                throw new RuntimeException();
            }
        } catch (Exception e) {
            GetMapperUtil.sqlRollback();
            e.printStackTrace();
        } finally {
            GetMapperUtil.sqlSessionClose();
        }
    }

    @Override
    public List<OrderData> orderDataAll(User user) {
        if(user!=null){
            OrderMapper orderMapper = GetMapperUtil.getMapperObject(OrderMapper.class);
            List<Order> order = orderMapper.findOrder(user.getId());
            List<OrderData> orderData = new ArrayList<OrderData>();
            ActicleMapper acticleMapper = GetMapperUtil.getMapperObject(ActicleMapper.class);
            for(Order orders:order){
                List<OrderItem> orderItem = orderMapper.findOrderItem(orders.getId());
                for (OrderItem orderItems:orderItem){
                    Article article = acticleMapper.selectArticle(orderItems.getArticleId());
                    orderItems.setArticle(article);
                }
                OrderData orderData1 = new OrderData();
                orderData1.setOrder(orders);
                orderData1.setOrderItems(orderItem);
                orderData.add(orderData1);
            }
            GetMapperUtil.sqlSessionClose();
            return orderData;
        }else{
            throw new RuntimeException("用户未登录！");
        }
    }

    @Override
    public void deleteOrderShop(Integer orderId, Integer articleId,User user) {

        if(user!=null){
            OrderMapper orderMapper = GetMapperUtil.getMapperObject(OrderMapper.class);
            orderMapper.deleteOrderItem(orderId,articleId);
            List<OrderItem> orderItem = orderMapper.findOrderItem(orderId);
            if (orderItem.size()==0){
                orderMapper.deleteOrder(orderId,user.getId());
            }
            GetMapperUtil.sqlSessionClose();
        }else{
            throw new RuntimeException("用户未登录");
        }

    }


}
