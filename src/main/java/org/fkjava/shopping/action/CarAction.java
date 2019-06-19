package org.fkjava.shopping.action;

import com.google.gson.Gson;
import org.fkjava.shopping.domain.Car;
import org.fkjava.shopping.domain.ShopCarData;
import org.fkjava.shopping.domain.User;
import org.fkjava.shopping.servlet.impl.CarServletImpl;
import org.fkjava.shopping.util.GetBeanUtil;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/car")
public class CarAction {

    @RequestMapping("/usercar")
    //展示用户的购物车信息
    public String userCarData(HttpSession session, Model model) {
        User users = (User) session.getAttribute("LOGIN_SESSION_IN");
        System.out.println("user1" + users);

            CarServletImpl carServletImpl = GetBeanUtil.getBeanPlus("carServletImpl", CarServletImpl.class);
            System.out.println("user2" + users);
            List<ShopCarData> shopCarData = carServletImpl.carData(users);
            System.out.println("shopCarData"+shopCarData);
            model.addAttribute("userCar", shopCarData);

        return "shopcar";
    }

//    @RequestMapping("/createCarData")
//    //操作用户额购物车信息：如商品数量的加减
//    public String creatECar(Integer number,Integer articleId,HttpSession session,Model model){
//        System.out.println("articleId:"+articleId);
//        System.out.println("number:"+number);
//        User user = (User) session.getAttribute("LOGIN_SESSION_IN");
//        if (user==null){
//            return "forward:/user/login";
//        }else {
//            CarServletImpl carServletImpl = GetBeanUtil.getBeanPlus("carServletImpl", CarServletImpl.class);
//            String carData = carServletImpl.createCarData(number, articleId, user);
//            if (!"success".equals(carData)){
//                model.addAttribute("carError",carData);
//                return "forward:/user/detail";
//            }else{
//                return "forward:/car/usercar";
//            }
//        }
//    }

    //该action用于购物车的添加操作
    @RequestMapping("/shopCarData")
    @ResponseBody
    public String shopCarData(Integer shopnumb, Integer shopId,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("LOGIN_SESSION_IN");
        CarServletImpl carServletImpl = GetBeanUtil.getBeanPlus("carServletImpl", CarServletImpl.class);
        String carData = carServletImpl.createCarData(shopnumb, shopId, user);
        return carData;
    }

    //用于购物车商品数量的添加与商品的删除操作
    @RequestMapping("/updateShopCar")
    @ResponseBody
    public String updateShopCar(Integer articleId,Integer shopNumb,HttpSession session){
        System.out.println("进入updateShopCar");
        CarServletImpl carServletImpl = GetBeanUtil.getBeanPlus("carServletImpl", CarServletImpl.class);
        User user =(User) session.getAttribute("LOGIN_SESSION_IN");
        String updateData = carServletImpl.updateShopCarImpl(articleId, shopNumb, user);
        return updateData;
    }


    //计算用户选中的购物车商品的总价
    @RequestMapping("/calculatePrice")
    @ResponseBody
    public String calculatePrice(String articleIds,HttpSession session){
        System.out.println(articleIds);
        User user =(User) session.getAttribute("LOGIN_SESSION_IN");
//        System.out.println(articleIds.length);
        CarServletImpl carServletImpl = GetBeanUtil.getBeanPlus("carServletImpl", CarServletImpl.class);
        String s = carServletImpl.calculateArticlePrice(articleIds, user);
        return s;
    }

    @RequestMapping("/deleteCarArticle")
    public String deleteCarArticle(Integer articleId,HttpSession session){
        System.out.println("deleteCarArticle"+articleId);
        User user =(User) session.getAttribute("LOGIN_SESSION_IN");
        CarServletImpl carServletImpl = GetBeanUtil.getBeanPlus("carServletImpl", CarServletImpl.class);
        carServletImpl.deleteCarArticleImpl(articleId,user);
        return "redirect:/car/usercar";
    }
}