package org.fkjava.shopping.util;

import org.fkjava.shopping.dao.ShopCarMapper;
import org.fkjava.shopping.domain.ShopCarData;
import org.fkjava.shopping.domain.User;

import java.text.DecimalFormat;
import java.util.List;

public class CalculateCarPrice {

    public static String calculatePrices(String articleIds, User user){
        ShopCarMapper shopCarMapper = GetMapperUtil.getMapperObject(ShopCarMapper.class);
        List<ShopCarData> userCarData = shopCarMapper.finalCarData(user.getId());
        //初始值不能为NULL,在计算时会报空指针异常
        Double totalArticlePrice=0D;
        System.out.println(articleIds);
        for (ShopCarData userCar : userCarData){
            if(articleIds.indexOf(String.valueOf(userCar.getArticleId()))!=-1){
                totalArticlePrice = userCar.getPrice()*userCar.getArticleNumb()+totalArticlePrice;
            }
        }
        System.out.println(totalArticlePrice);
        DecimalFormat df = new DecimalFormat( "0.00");
        GetMapperUtil.sqlSessionClose();
        return df.format(totalArticlePrice);
    }

}
