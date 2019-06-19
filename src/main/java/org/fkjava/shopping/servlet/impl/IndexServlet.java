package org.fkjava.shopping.servlet.impl;

import org.fkjava.shopping.dao.ActicleMapper;
import org.fkjava.shopping.dao.DetailMapper;
import org.fkjava.shopping.dao.UserMapper;
import org.fkjava.shopping.domain.Article;
import org.fkjava.shopping.domain.ArticleType;
import org.fkjava.shopping.domain.User;
import org.fkjava.shopping.page.IndexData;
import org.fkjava.shopping.page.PageNumb;
import org.fkjava.shopping.servlet.IIndexServlet;
import org.fkjava.shopping.util.EmailUtil;
import org.fkjava.shopping.util.GetMapperUtil;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class IndexServlet implements IIndexServlet {
    @Override
    public String loginServlet(String userName, String password, HttpSession session) {
        //调用dao层组件，去数据库中查询是否该用户数据
        UserMapper mapperObject = GetMapperUtil.getMapperObject(UserMapper.class);
        User user = mapperObject.loginSelect(userName);
        System.out.println(user.getDisabled());
        if (user==null){
            return "该用户名不存在！";
        }else if (!user.getPassword().equals(password)){
            return "密码不正确!";
        }else if(user.getRole()==0){
            System.out.println("loginServlet:进入user.getDisabled()");
            return "该用户为激活！请前往您的邮箱激活账户！";
        }else{
            session.setAttribute("LOGIN_SESSION_IN",user);
            return "success";
        }
    }

    @Override
    public IndexData indexData(String parameterIndex,Integer page) {
        ActicleMapper acticleMapper = GetMapperUtil.getMapperObject(ActicleMapper.class);
        IndexData indexData = new IndexData();
        //一级查询
        List<ArticleType> articleTypes = acticleMapper.oneFindConde();
        indexData.setOneCodeData(articleTypes);

        //二级查询
        if (parameterIndex!=null && !"".equals(parameterIndex)) {
            String towTypeCode=parameterIndex;
            if(parameterIndex.length()>4){
                towTypeCode=parameterIndex.substring(0,4);
            }
            List<ArticleType> towFindCode = acticleMapper.towFindCode(towTypeCode);
            indexData.setTowCOdeData(towFindCode);
        }

        //商品查询
//        List<Article> shoppingFind = acticleMapper.shoppingFind(parameterIndex);
//        indexData.setArticleData(shoppingFind);
        Integer integer = acticleMapper.allShoppingData(parameterIndex);
        PageNumb pageNumb = new PageNumb(integer,page);
        List<Article> shoppingFind = acticleMapper.shoppingFind(parameterIndex, pageNumb);
        indexData.setArticleData(shoppingFind);
        indexData.setPageNumb(pageNumb);
        GetMapperUtil.sqlSessionClose();
        //页面查询

        return indexData;
    }

    @Override
    public Article getDetail(Integer id) {
        DetailMapper mapperObject = GetMapperUtil.getMapperObject(DetailMapper.class);
        Article detail = mapperObject.findDetail(id);
        GetMapperUtil.sqlSessionClose();
        return detail;
    }

    //验证登录名是否被注册
    @Override
    public String verificationLoginName(String userLoginName) {
        if(!"".equals(userLoginName) && userLoginName!=null){
            UserMapper userMapper = GetMapperUtil.getMapperObject(UserMapper.class);
            Integer loginName = userMapper.findLoginName(userLoginName);
            if(loginName==0){
                return "true";
            }else{
                return "false";
            }
        }else{
            throw new RuntimeException();
        }

    }

    //用户注册逻辑
    @Override
    public String userRegister(User user) {
        try{
            if (user!=null){
                UserMapper userMapper = GetMapperUtil.getMapperObject(UserMapper.class);
                Integer loginName = userMapper.findLoginName(user.getUsername());
                if(loginName==0){
                    String uuid = UUID.randomUUID().toString();
                    Date date = new Date();
                    DateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
                    String format = df.format(date);
                    user.setCreateDate(format);
                    user.setActive(uuid);
                    user.setRole(0);
                    userMapper.insertUser(user);
                    GetMapperUtil.sqlCommit();
                    String url = "http://localhost:8080/shopping2_0_war/user/email?id="+uuid;
                    EmailUtil.email(user,url);
                    return "success";
                }else{
                    return "error";
                }
            }else{
                throw new RuntimeException();
            }
        }catch(Exception e){
            GetMapperUtil.sqlRollback();
            e.printStackTrace();
            return "error";
        }finally {
            GetMapperUtil.sqlSessionClose();
        }
    }

    @Override
    public String emailRegister(String uuid,HttpSession session) {
        try{
            UserMapper userMapper = GetMapperUtil.getMapperObject(UserMapper.class);
            User user = userMapper.findEmailUser(uuid);
            if(user!=null){
                userMapper.updateUserDisabled(1,user.getId());
                session.setAttribute("LOGIN_SESSION_IN",user);
                GetMapperUtil.sqlCommit();
                return "success";
            }else{
                return "error";
            }
        }catch(Exception e){
            GetMapperUtil.sqlRollback();
            throw new RuntimeException();
        }finally{
            GetMapperUtil.sqlSessionClose();
        }
    }


}
