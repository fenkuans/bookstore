package org.fkjava.shopping.util;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class GetMapperUtil {
    private static SqlSession sqlSession;
    private static SqlSessionFactory sqlSessionFactory;
    public static <T> T getMapperObject(Class<T> t) {
        sqlSessionFactory = GetBeanUtil.getBeanPlus("sqlSession", SqlSessionFactory.class);
        sqlSession= sqlSessionFactory.openSession();
        return sqlSession.getMapper(t);
    }
    public static void sqlSessionClose(){
        if (sqlSession!=null){
            sqlSession.close();
        }
    }

    public static void sqlRollback(){
        if (sqlSession!=null){
            sqlSession.rollback();
        }
    }

    public static void sqlCommit(){
        if (sqlSession!=null){
            sqlSession.commit();
        }
    }

}
