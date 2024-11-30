package com.ecommerce.controller;

import com.ecommerce.entity.Customer;
import com.ecommerce.repository.CommerceDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String customerId = req.getParameter("customerId");
        String password = req.getParameter("password");

        Customer requestLoginInfo = new Customer(customerId, password);
        CommerceDAO dao = new CommerceDAO();
        Customer loginInfo = dao.login(requestLoginInfo);
        if(loginInfo != null) {
            HttpSession session = req.getSession();
            session.setAttribute("loginInfo", loginInfo);
            session.setMaxInactiveInterval(30000000);
        }

        resp.sendRedirect("/ecommerce/productList");
    }
}