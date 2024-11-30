package com.ecommerce.controller;

import com.ecommerce.entity.Product;
import com.ecommerce.repository.CommerceDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/productList")
public class ProductListController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CommerceDAO dao = new CommerceDAO();
        List<Product> list = dao.getProductList();
        req.setAttribute("list", list);
        // forward
        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/productList.jsp");
        rd.forward(req, resp);
    }
}
