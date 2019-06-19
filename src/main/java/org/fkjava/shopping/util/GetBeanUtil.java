package org.fkjava.shopping.util;

        import org.springframework.context.ApplicationContext;
        import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GetBeanUtil {
    private static ApplicationContext ctx;

    //使用泛型作为返回值
    public static <T> T getBeanPlus(String name,Class<T> t){

        if (ctx!=null) {
            return ctx.getBean(name, t);
        }else{
            ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
            return ctx.getBean(name, t);
        }
    }

}
