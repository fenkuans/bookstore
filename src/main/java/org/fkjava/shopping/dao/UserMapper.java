package org.fkjava.shopping.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.fkjava.shopping.domain.User;


public interface UserMapper {
    @Select("select * from ec_user where username=#{userName}")
    User loginSelect(@Param("userName") String userName);

    //查询用户是否存在
    @Select("select count(*) from ec_user where username=#{loginName}")
    Integer findLoginName(@Param("loginName") String loginName);

    //注册用户
    @Insert("insert ec_user values(null,#{user.username},#{user.password},#{user.name},#{user.sex},#{user.email},#{user.phone},#{user.address},#{user.role},#{user.createDate},#{user.disabled},#{user.active})")
    void insertUser(@Param("user") User user);

    @Select("select * from ec_user where active=#{uuid}")
    User findEmailUser(@Param("uuid") String uuid);

    @Update("update ec_user set role=#{role} where id=#{userId}")
    void updateUserDisabled(@Param("role") Integer role,@Param("userId") Integer userId);
}
