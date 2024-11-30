package com.ecommerce.repository;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Orders;
import com.ecommerce.entity.Customer;
import com.ecommerce.entity.Product;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class CommerceDAO {
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

    public List<Product> getProductList() {
        SqlSession session = sqlSessionFactory.openSession();
        List<Product> list = session.selectList("getProductList");
        session.close();
        return list;
    }

    public Customer login(Customer loginInfo) {
        SqlSession session = sqlSessionFactory.openSession();
        Customer customerInfo = session.selectOne("login", loginInfo);
        session.close();
        return customerInfo;
    }

    public int addProductToCart(String customerId, String productCode) {
        SqlSession session = sqlSessionFactory.openSession();
        String ordersCode = session.selectOne("findMaxNumber");
        String collectedOrdersCode = countToMax(ordersCode);

        Orders cartItem = new Orders(collectedOrdersCode, customerId, productCode);

        int successCount = session.insert("addProductToCart", cartItem);
        session.commit();
        session.close();
        return successCount;
    }

    private String countToMax(String ordersCode) {
        String domainCode = ordersCode.substring(4).replace("[0-9]", "");
        long temporaryCount = Long.parseLong(ordersCode.substring(4).replaceAll("[A-z]", "")) + 1;
        return domainCode + temporaryCount;
    }

    public List<Cart> getCartList(String customerId) {
        SqlSession session = sqlSessionFactory.openSession();
        List<Cart> cartList = session.selectList("getCartList", customerId);
        session.close();
        return cartList;
    }
}
