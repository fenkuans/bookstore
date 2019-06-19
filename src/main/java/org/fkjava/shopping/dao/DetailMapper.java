package org.fkjava.shopping.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.fkjava.shopping.domain.Article;

public interface DetailMapper {

    @Select("select * from ec_article where id=#{id}")
    Article findDetail(@Param("id") Integer id);
}
