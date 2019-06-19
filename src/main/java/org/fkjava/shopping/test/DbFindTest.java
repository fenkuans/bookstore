package org.fkjava.shopping.test;

import org.fkjava.shopping.dao.*;
import org.fkjava.shopping.domain.*;
import org.fkjava.shopping.page.OrderData;
import org.fkjava.shopping.page.PageNumb;
import org.fkjava.shopping.util.GetMapperUtil;
import org.junit.Test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class DbFindTest {
    @Test
    public void test1(){
//        try(InputStream in = Resources.getResourceAsStream("mybatis_config.xml")) {
//            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(in);
//            SqlSession sqlSession = sqlSessionFactory.openSession();
//            UserMapper mapper = sqlSession.getMapper(UserMapper.class);
////            List<User> userAll = mapper.findUserAll();
////            for (User user:userAll){
////                System.out.println(user.getName());
////            }
//
////            User alls = mapper.findAlls(1);
////            System.out.println(alls.getName());
//        }catch(Exception e){
//            e.printStackTrace();
//        }
    }

    @Test
    public void test2(){
        ActicleMapper mapperObject = GetMapperUtil.getMapperObject(ActicleMapper.class);
        List<ArticleType> articleTypes = mapperObject.oneFindConde();
        for(ArticleType articleType:articleTypes){
            System.out.println(articleType.getRemark());
        }


//        List<Article> articles = mapperObject.shoppingFind("");
//        System.out.println(articles.size());
//        for(Article article:articles){
//            System.out.println("aa"+article.getTypeCode());
//            System.out.println("aa"+article.getCreateDate());
//        }


        List<ArticleType> articleTypes1 = mapperObject.towFindCode("");
        System.out.println(articleTypes1.size());
        for(ArticleType articleType:articleTypes1){
            System.out.println("bb"+articleType.getRemark());
        }
        GetMapperUtil.sqlSessionClose();
    }

    @Test
    public void test3(){
        ActicleMapper mapperObject = GetMapperUtil.getMapperObject(ActicleMapper.class);
        Integer integer = mapperObject.allShoppingData("");
        PageNumb pageNumb = new PageNumb(integer,2);
        List<Article> shoppingFind = mapperObject.shoppingFind("", pageNumb);
        for (Article shopping:shoppingFind){
            System.out.println(shopping.getId());
        }
        System.out.println("next"+pageNumb.getNextNumb());
    }

    @Test
    public void test4(){
        DetailMapper mapperObject = GetMapperUtil.getMapperObject(DetailMapper.class);
        Article detail = mapperObject.findDetail(1);
        System.out.println(detail.getTitle());
        GetMapperUtil.sqlSessionClose();
    }

    @Test
    public void test5(){
        ShopCarMapper shopCarMapper = GetMapperUtil.getMapperObject(ShopCarMapper.class);
        Car car = shopCarMapper.selectUserCarArticle(2,2);
        System.out.println(car);
    }

    @Test
    public void test6(){
        ShopCarMapper mapperObject = GetMapperUtil.getMapperObject(ShopCarMapper.class);
        List<ShopCarData> shopCarData = mapperObject.finalCarData(1);
        for(ShopCarData shop:shopCarData){
            System.out.println(shop);
            System.out.println(shop.getTotalPrice(shop.getArticleNumb(),shop.getPrice()));
        }
    }


    @Test
    public void test7(){
        String s = "1,5";
        System.out.println(s.indexOf(String.valueOf(1)));
    }

    @Test
    public void test8(){
        OrderMapper orderMapper = GetMapperUtil.getMapperObject(OrderMapper.class);
        UUID uuid = UUID.randomUUID();
        String s = uuid.toString();
        System.out.println(s.length());
        Date date = new Date();
        DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = dFormat.format(date);
        System.out.println(format.length());
        orderMapper.insertOrder(s,format,format,"1",223.2,1);
    }

    @Test
    public void test9(){
        OrderMapper orderMapper = GetMapperUtil.getMapperObject(OrderMapper.class);
        Integer orderId = orderMapper.findOrderId("363096e2-82ab-42e8-a9e4-a55f43e17ee5");
        System.out.println(orderId);
    }

    @Test
    public void test10(){
        OrderMapper orderMapper = GetMapperUtil.getMapperObject(OrderMapper.class);

//        List<OrderData> order = orderMapper.findOrder(1);
//        System.out.println(order.size());
//        for (OrderData orders : order){
//            System.out.println(orders);
//        }
    }

    @Test
    public void test11(){
        UserMapper userMapper = GetMapperUtil.getMapperObject(UserMapper.class);
        Integer fenkuan = userMapper.findLoginName("fenkuan");
        System.out.println(fenkuan);
    }

    @Test
    public void test12(){
        UserMapper userMapper = GetMapperUtil.getMapperObject(UserMapper.class);
//        Integer fenkuan = userMapper.findLoginName("fenkuan");
//        System.out.println(fenkuan);
        User user = new User();
        user.setUsername("fenkuan");
        user.setPassword("2521263");
        user.setName("abc");
        user.setEmail("fenkuan@gmail.com");
        user.setPhone("13262000000");
        user.setSex(1);
        userMapper.insertUser(user);
    }

    @Test
    public void test13(){
        UserMapper userMapper = GetMapperUtil.getMapperObject(UserMapper.class);
        User emailUser = userMapper.findEmailUser("91218a27-e1c8-4d9b-8325-268bc00b2a60");
        System.out.println(emailUser.getDisabled());

    }
}
