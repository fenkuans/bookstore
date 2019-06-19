package org.fkjava.shopping.servlet.impl;


import com.google.gson.Gson;
import org.fkjava.shopping.dao.ActicleMapper;
import org.fkjava.shopping.dao.ShopCarMapper;
import org.fkjava.shopping.domain.Article;
import org.fkjava.shopping.domain.Car;
import org.fkjava.shopping.domain.ShopCarData;
import org.fkjava.shopping.domain.User;
import org.fkjava.shopping.servlet.ICarServlet;
import org.fkjava.shopping.util.CalculateCarPrice;
import org.fkjava.shopping.util.GetMapperUtil;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.List;

@Service
public class CarServletImpl implements ICarServlet {


    @Override
    public List<ShopCarData> carData(User user) {
        //该方法用来展示用户的购物车数据
        ShopCarMapper shopCarMapper = GetMapperUtil.getMapperObject(ShopCarMapper.class);
        List<ShopCarData> shopCarData = shopCarMapper.finalCarData(user.getId());
        for (ShopCarData shopPlus:shopCarData){
            shopPlus.setTotalPrices(shopPlus.getTotalPrice(shopPlus.getArticleNumb(),shopPlus.getPrice()));
        }
        GetMapperUtil.sqlSessionClose();
        return shopCarData;
    }

    @Override
    public String createCarData(Integer number, Integer id,User user) {
        //该方法用于添加购物车操作
        //先去数据库中查该用户是否已经添加过该商品
        try {
            ActicleMapper acticleMapper = GetMapperUtil.getMapperObject(ActicleMapper.class);
            Article article = acticleMapper.selectArticle(id);
            ShopCarMapper shopCarMapper = GetMapperUtil.getMapperObject(ShopCarMapper.class);
            Car car = shopCarMapper.selectUserCarArticle(id, user.getId());
            if (article.getStorage()<number){
                shopCarMapper.updateUserCarData(id, article.getStorage(), user.getId());
                return "库存不足！";
            }else {
                if (car == null) {
                    shopCarMapper.createShopCarData(id, number, user.getId());
                    return "success";
                } else {
                    //如果已经存在先获取购物车商品的数量，在加上用户传的数量
                    Integer newNumb = car.getArticleNumb()+number;
                    System.out.println("newNumb:"+number);
                    if (article.getStorage()<newNumb){
                        shopCarMapper.updateUserCarData(id, article.getStorage(), user.getId());
                        return "库存不足！";
                    }else {
                        shopCarMapper.updateUserCarData(id, newNumb, user.getId());
                        System.out.println("createCarData进入");
                        return "success";
                    }
                }
            }
        }catch(Exception e){
            GetMapperUtil.sqlRollback();
            throw new RuntimeException();
        }finally {
            GetMapperUtil.sqlSessionClose();
        }

    }

    @Override
    public String updateShopCarImpl(Integer articleId, Integer shopNumb, User user) {
        try{
            ShopCarMapper shopCarMapper = GetMapperUtil.getMapperObject(ShopCarMapper.class);
            Car car = shopCarMapper.selectUserCarArticle(articleId, user.getId());
            ActicleMapper acticleMapper = GetMapperUtil.getMapperObject(ActicleMapper.class);
            Article article = acticleMapper.selectArticle(articleId);
            Integer state = null;
            if(car!=null){
                if(article.getStorage()>shopNumb){
                    shopCarMapper.updateUserCarData(articleId,shopNumb,user.getId());
                    state=1;
                }else{
                    shopCarMapper.updateUserCarData(articleId,article.getStorage(),user.getId());
                    state=2;
                }
                ShopCarData cars = shopCarMapper.finalCarDataOne(user.getId(),articleId);
                cars.setTotalPrices(cars.getTotalPrice(cars.getArticleNumb(),cars.getPrice()));
                cars.setState(state);
                Gson gson = new Gson();
                String s = gson.toJson(cars);
                return s;
            }else{
                throw new RuntimeException("操作失败！");
            }
        }catch(Exception e){
            GetMapperUtil.sqlRollback();
            throw new RuntimeException();
        }finally {
            GetMapperUtil.sqlSessionClose();
        }
    }

    @Override
    public String calculateArticlePrice(String articleIds,User user) {
        return CalculateCarPrice.calculatePrices(articleIds,user);
    }

    @Override
    public void deleteCarArticleImpl(Integer articleId, User user) {
        try{
            if(user!=null){
                ShopCarMapper shopCarMapper = GetMapperUtil.getMapperObject(ShopCarMapper.class);
                shopCarMapper.deleteUserCarArticle(articleId,user.getId());
            }
        }catch(Exception e){
            e.printStackTrace();
            GetMapperUtil.sqlRollback();
        }

    }
}
