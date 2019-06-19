package org.fkjava.shopping.servlet;

import org.fkjava.shopping.domain.Article;
import org.fkjava.shopping.domain.User;
import org.fkjava.shopping.page.IndexData;

import javax.servlet.http.HttpSession;

public interface IIndexServlet {

    String loginServlet(String userName, String password, HttpSession session);

    IndexData indexData(String parameterIndex,Integer page);

    Article getDetail(Integer id);

    //验证登录名是否被注册
    String verificationLoginName(String userLoginName);

    //用户注册
    String userRegister(User user);

    //邮箱验证
    String emailRegister(String uuid,HttpSession session);
}
