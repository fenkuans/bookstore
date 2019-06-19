package org.fkjava.shopping.test;

import org.fkjava.shopping.dao.UserMapper;
import org.fkjava.shopping.domain.User;
import org.fkjava.shopping.util.GetMapperUtil;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class indexServletTest {
    @Test
    public void test1(){
        User user = new User();
        user.setUsername("admin");
        user.setPassword("123456");
        //调用dao层组件，去数据库中查询是否该用户数据
        UserMapper mapperObject = GetMapperUtil.getMapperObject(UserMapper.class);
        User users = mapperObject.loginSelect(user.getUsername());
//        System.out.println(users);
        if (users==null){
            System.out.println("用户名不正确！");
        }else if (!users.getPassword().equals(user.getPassword())){
            System.out.println("密码不正确!");
        }else{
            System.out.println("session");
        }
    }

    @Test
    public void test2(){
        List<String> list1 = new ArrayList<String>();
        list1.add("1");
        list1.add("2");
        List<String> list3 = new ArrayList<String>();
        list3.add("3");
        list3.add("4");
        List<List<String>> list2 = new ArrayList<List<String>>();
        list2.add(list1);
        list2.add(list3);
//        System.out.println(list2.size());
        for (List<String> list2s:list2){
//            System.out.println(list2s);
            for (String list:list2s){
                System.out.println(list);
            }

        }
    }

    @Test
    public void test3(){
        String s = "/user/detail";
        String substring = s.substring(0, s.lastIndexOf("/")+1);
        System.out.println(substring);


    }
}
