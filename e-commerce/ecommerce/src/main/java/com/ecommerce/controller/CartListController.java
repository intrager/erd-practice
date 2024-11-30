package com.ecommerce.controller;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Customer;
import com.ecommerce.repository.CommerceDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/cartList")
public class CartListController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Customer loginInfo = (Customer) session.getAttribute("loginInfo");

        String customerId = loginInfo.getCustomerId();
        CommerceDAO dao = new CommerceDAO();
        List<Cart> cartList = dao.getCartList(customerId);
        req.setAttribute("cartList", cartList);

        // forward
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/cartList.jsp");
        dispatcher.forward(req, resp);
    }
}