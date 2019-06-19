package org.fkjava.shopping.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.fkjava.shopping.domain.Article;
import org.fkjava.shopping.domain.ArticleType;
import org.fkjava.shopping.page.PageNumb;

import java.util.List;

public interface ActicleMapper {

    @Select("select * from ec_article_type where length(code)=4")
    List<ArticleType> oneFindConde();
    @Select("select * from ec_article_type where code like '${selectCode}%' and length(code)>4 ")
    List<ArticleType> towFindCode(@Param("selectCode") String selectCode);
//    @Select("select * from ec_article where type_code like '${typeCode}%'")
    List<Article> shoppingFind(@Param("typeCode") String typeCode ,@Param("pageNumb") PageNumb pageNumb);
    //查询符合条件的商品总条数
    @Select("select count(*) from ec_article where type_code like '${typeCode}%'")
    Integer allShoppingData(@Param("typeCode")String typeCode);

    @Select("select * from ec_article where id=#{articleId}")
    Article selectArticle(@Param("articleId") Integer articleId);

}
