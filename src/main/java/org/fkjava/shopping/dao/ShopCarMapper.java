package org.fkjava.shopping.dao;

import org.apache.ibatis.annotations.*;
import org.fkjava.shopping.domain.Car;
import org.fkjava.shopping.domain.ShopCarData;

import java.util.List;

public interface ShopCarMapper {
    //查询该用户的购物查数据
    List<Car> getUserCarData(@Param("userId") Integer userId);

    //该商品添加到购物车中
    @Insert("insert ec_car(article_id,article_numb,user_id) values(#{articleId},#{number},#{userId})")
    void createShopCarData(@Param("articleId")Integer articleId,@Param("number") Integer number,@Param("userId") Integer userId);

    //查询购物车是否已有该商品的数据
    Car selectUserCarArticle(@Param("articleId") Integer articleId,@Param("userId")Integer userId);

    //更新用户购物车数据(需要用户数据，)
    @Update("update ec_car set article_numb=#{number} where article_id=#{articleId} and user_id=#{userId}")
    void updateUserCarData(@Param("articleId") Integer articleId,@Param("number") Integer number,@Param("userId") Integer userId);


//    @Select("select a.image,a.title,a.price,c.article_numb,c.user_id,a.id from ec_article a inner join ec_car c where a.id=c.article_id and c.user_id=#{userId}")
    List<ShopCarData> finalCarData(@Param("userId") Integer userId);

    ShopCarData finalCarDataOne(@Param("userId")Integer userId,@Param("articleId")Integer articleId);

    @Delete("delete from ec_car where article_id=#{articleId} and user_id=#{userId}")
    void deleteUserCarArticle(@Param("articleId")Integer articleId,@Param("userId") Integer userId);


}
