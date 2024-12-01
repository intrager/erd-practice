package com.ecommerce.repository;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Customer;
import com.ecommerce.entity.Product;
import org.apache.commons.lang3.StringUtils;
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
        Cart idAndProductCode = new Cart(customerId, productCode);

        String ordersCode = session.selectOne("getOrdersCode", idAndProductCode);
        int existingPurchaseQuantity = 1;
        int successCount = 0;
        if(StringUtils.equals(ordersCode, null)) {
            String existingMaxOrdersCode = session.selectOne("findMaxNumber");
            ordersCode = collectToMax(existingMaxOrdersCode);
            Cart cartItem = new Cart(ordersCode, customerId, productCode, existingPurchaseQuantity);
            successCount = session.insert("addProductToCart", cartItem);
        } else {
            Cart candidateCartItem = new Cart(ordersCode, customerId, productCode);
            existingPurchaseQuantity = session.selectOne("getCountAlreadyAddedProductToCart", candidateCartItem);
            existingPurchaseQuantity++;
            Cart cartItem = new Cart(ordersCode, customerId, productCode, existingPurchaseQuantity);
            successCount = session.update("updateQuantityAlreadyExists", cartItem);
        }

        session.commit();
        session.close();
        return successCount;
    }

    private String collectToMax(String ordersCode) {
        String year = ordersCode.substring(0, 4);
        String domainCode = ordersCode.substring(4).replaceAll("[0-9]", "");
        long temporaryCount = Long.parseLong(ordersCode.substring(4).replaceAll("[A-z]", "")) + 1;
        return year + domainCode + temporaryCount;
    }

    public List<Cart> getCartList(String customerId) {
        SqlSession session = sqlSessionFactory.openSession();
        List<Cart> cartList = session.selectList("getCartList", customerId);
        session.close();
        return cartList;
    }

    public int cancelProductInCart(String ordersCode, String customerId, String productCode) {
        SqlSession session = sqlSessionFactory.openSession();
        Cart productInfo = new Cart(ordersCode, customerId, productCode);
        int canceled = session.update("cancelProductInCart", productInfo);
        System.out.println(canceled);
        session.commit();
        session.close();

        return canceled;
    }
}
