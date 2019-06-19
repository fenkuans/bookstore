package org.fkjava.shopping.action;

import org.fkjava.shopping.page.OrderData;
import org.fkjava.shopping.domain.User;
import org.fkjava.shopping.servlet.impl.OrderServletImp;
import org.fkjava.shopping.util.GetBeanUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderAction {
    //该Action用于处理用户订单
    //前台将出入购物车的id

    //处理我的订单显示操作
    @RequestMapping("/showOrder")
    public String showOrder(Model model,HttpSession session){
        OrderServletImp orderServletImp = GetBeanUtil.getBeanPlus("orderServletImp", OrderServletImp.class);
        User user =(User) session.getAttribute("LOGIN_SESSION_IN");
        List<OrderData> orderData = orderServletImp.orderDataAll(user);
        model.addAttribute("orderData",orderData);
        return "order";
    }


    //处理提交订单操作
    @RequestMapping("/userOrder")
    public String userOrder(String articleIds, HttpSession session) {
        System.out.println("===================订单===================");
        System.out.println("articleIds" + articleIds);
//        System.out.println("calculatePrice"+calculatePrice);
        User user = (User) session.getAttribute("LOGIN_SESSION_IN");
        //订单总价不能由前台传入
        OrderServletImp orderServletImp = GetBeanUtil.getBeanPlus("orderServletImp", OrderServletImp.class);
        orderServletImp.createOrder(articleIds, user);
        return "redirect:/order/showOrder";
    }

    //处理用户订单详情删除操作
    @RequestMapping("/deleteOrderItem")
    public String deleteOrderItemShop(Integer orderId,Integer articleId,HttpSession session){
        User user =(User) session.getAttribute("LOGIN_SESSION_IN");
        OrderServletImp orderServletImp = GetBeanUtil.getBeanPlus("orderServletImp", OrderServletImp.class);
        orderServletImp.deleteOrderShop(orderId,articleId,user);
        return "redirect:/order/showOrder";
    }
}
