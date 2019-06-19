package org.fkjava.shopping.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.fkjava.shopping.domain.Order;
import org.fkjava.shopping.domain.OrderItem;

import java.util.List;

public interface OrderMapper {
    //写入订单信息
    @Insert("insert ce_order values(null,#{OrderServletImp},#{createDate},#{sendDate},#{status},#{amount},${userId})")
    void insertOrder(@Param("OrderServletImp") String orderCode,@Param("createDate") String  createDate,@Param("sendDate") String sendDate,@Param("status") String status,@Param("amount") Double amount,@Param("userId") Integer userId);

    @Insert("insert ec_order_item values(#{orderId},#{articleId},#{articleNumb})")
    void insertOrderItem(@Param("orderId")Integer orderId,@Param("articleId")Integer articleId,@Param("articleNumb")Integer articleNumb);

    @Select("select id from ce_order where order_code=#{orderCode}")
    Integer findOrderId(@Param("orderCode") String orderCode);

    List<Order> findOrder(@Param("userId") Integer userId);

    //查询订单详情
    List<OrderItem> findOrderItem(@Param("orderId") Integer orderId);

    @Delete("delete from ec_order_item where order_id=#{orderId} and article_id=#{articleId}")
    void deleteOrderItem(@Param("orderId") Integer orderId,@Param("articleId") Integer articleId);

    @Delete("delete from ce_order where id=#{orderId} and user_id=${userId}")
    void deleteOrder(@Param("orderId")Integer orderId,@Param("userId") Integer userId);

}
