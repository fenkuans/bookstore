package org.fkjava.shopping.test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.fkjava.shopping.domain.OrderItem;
import org.fkjava.shopping.page.OrderData;
import org.fkjava.shopping.domain.User;
import org.fkjava.shopping.dao.UserMapper;
import org.fkjava.shopping.servlet.impl.CarServletImpl;
import org.fkjava.shopping.servlet.impl.IndexServlet;
import org.fkjava.shopping.servlet.impl.OrderServletImp;
import org.fkjava.shopping.util.EmailUtil;
import org.fkjava.shopping.util.GetBeanUtil;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;
import java.util.UUID;

public class SpringTest {

    @Test
    public void test1() {
        try {

            ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//            SqlSession sqlSession = ctx.getBean("sqlSession", SqlSession.class);
//            UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//            List<User> userAll = mapper.findUserAll();
//            for (User user : userAll) {
//                System.out.println(user.getName());
//            }
        }catch(Exception e){
            e.printStackTrace();
        }

    }

    @Test
    public void test2() throws Exception {
//        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
////        SqlSessionFactory sqlSession = ctx.getBean("sqlSession", SqlSessionFactory.class);
////        System.out.println(sqlSession);
//        DataSource c3p0 = ctx.getBean("c3p0", DataSource.class);
////        System.out.println(c3p0);
//        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
//        sqlSessionFactoryBean.setDataSource(c3p0);
//        SqlSessionFactory object = sqlSessionFactoryBean.getObject();
//        SqlSession sqlSession = object.openSession();
//        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//        List<User> userAll = mapper.findUserAll();
//        for (User user:userAll){
//            System.out.println(user.getName());
//        }
    }

    @Test
    public void test3(){
//        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//        SqlSessionFactory sqlSession = ctx.getBean("sqlSession", SqlSessionFactory.class);
//        SqlSession sqlSession1 = sqlSession.openSession();
//        UserMapper mapper = sqlSession1.getMapper(UserMapper.class);
//        List<User> userAll = mapper.findUserAll();
////        System.out.println(userAll);
//        for (User user:userAll){
//            System.out.println(user.getName());
//        }
//
//        User alls = mapper.findAlls(1);
//        System.out.println(alls.getName());
    }
    @Test
    public void test4(){
//        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//        SqlSessionFactory sqlSession = ctx.getBean("sqlSession", SqlSessionFactory.class);
//        SqlSession sqlSession1 = sqlSession.openSession();
//        UserMapper mapper = sqlSession1.getMapper(UserMapper.class);
//        User alls = mapper.findAlls(1);
//        System.out.println(alls.getName());
    }

    @Test
    public void test5(){
//        UserMapper mapperObject = GetMapperUtil.getMapperObject(UserMapper.class);
//        List<User> userAll = mapperObject.findUserAll();
//        for(User user:userAll){
//            System.out.println(user.getName());
//        }
    }

    @Test
    public void test6(){
        SqlSessionFactory sqlSessionFactory = GetBeanUtil.getBeanPlus("sqlSession", SqlSessionFactory.class);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//        List<User> userAll = mapper.findUserAll();
//        for (User user:userAll){
//            System.out.println(user.getName());
//        }
    }

    @Test
    public void test7() throws Exception{
        IndexServlet indexServlet = GetBeanUtil.getBeanPlus("indexServlet", IndexServlet.class);
//        System.out.println(indexServlet.loginServlet());
    }

    @Test
    public void test8(){
        CarServletImpl carServletImpl = GetBeanUtil.getBeanPlus("carServletImpl", CarServletImpl.class);
        User user = new User();
        user.setId(1);
        String s = carServletImpl.calculateArticlePrice("['1','5']", user);
        System.out.println(s);
    }

    @Test
    public void test9(){
        OrderServletImp orderServletImp = GetBeanUtil.getBeanPlus("orderServletImp", OrderServletImp.class);
        User user = new User();
        user.setId(1);
//        String s = carServletImpl.calculateArticlePrice("['1','5']", user);
        orderServletImp.createOrder("6,3",user);
//        System.out.println(s);

    }

    @Test
    public void test10(){
        OrderServletImp orderServletImp = GetBeanUtil.getBeanPlus("orderServletImp", OrderServletImp.class);
        User user = new User();
        user.setId(1);
        List<OrderData> orderData = orderServletImp.orderDataAll(user);
        System.out.println(orderData.size());
        for(OrderData orderDatas:orderData){
            System.out.println(orderDatas);
            for (OrderItem item:orderDatas.getOrderItems()){
                System.out.println(item);
            }
        }
    }


    @Test
    public void test11(){
//        OrderServletImp orderServletImp = GetBeanUtil.getBeanPlus("orderServletImp", OrderServletImp.class);
//        User user = new User();
//        user.setId(1);
//        List<OrderData> orderData = orderServletImp.orderDataAll(user);
//        System.out.println(orderData.size());
//        for(OrderData orderDatas:orderData){
//            System.out.println(orderDatas);
//        }
    }

    @Test
    public void test12() throws Exception{
        User user = new User();
        user.setEmail("1033684763@qq.com");
        String uuid = UUID.randomUUID().toString();
        String url = "http://localhost:8080/shopping2_0_war/user/email?id="+uuid;
        EmailUtil.email(user,url);
    }
}
