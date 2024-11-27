package com.ecommerce.repository;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class ConnectionDAO {
    // DB 연결 -> config.xml (환경설정파일) -> API read 연결작업을 대신 해주면 된다.
    private static SqlSessionFactory sqlSessionFactory; // Connection(SqlSession) Pool
    static {
        try {
            String resource = "mybatis-config/config.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.fillInStackTrace();
        }
    }
}
