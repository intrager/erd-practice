package com.ecommerce.controller;

import com.ecommerce.entity.Customer;
import com.ecommerce.repository.CommerceDAO;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/orders")
public class OrdersController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String line = readLines(req);

        JsonObject parsedParameter = JsonParser.parseString(line).getAsJsonObject();
        String customerId = parsedParameter.get("customerId").getAsString();
        int cartSize = parsedParameter.get("cartSize").getAsInt();
        long totalAmount = parsedParameter.get("totalAmount").getAsLong();

        CommerceDAO dao = new CommerceDAO();
        boolean resultState = dao.orders(customerId, cartSize, totalAmount);

        PrintWriter out = resp.getWriter();
        out.print(resultState);
        out.flush();
        out.close();

        if(resultState) {
            HttpSession session = req.getSession();

            Customer sessionInfo = (Customer) session.getAttribute("loginInfo");
            Customer updatedCustomerInfo = new Customer(sessionInfo.getCustomerId(), sessionInfo.getPassword());
            CommerceDAO loginDao = new CommerceDAO();

            Customer loginInfo = loginDao.login(updatedCustomerInfo);
            session.setAttribute("loginInfo", loginInfo);
            session.setMaxInactiveInterval(30000000);
            req.setAttribute("loginInfo", loginInfo);

            resp.sendRedirect("/ecommerce/cartList");
        }
    }

    private String readLines(HttpServletRequest req) {
        StringBuffer buffer = new StringBuffer();
        String line = "";
        try {
            BufferedReader reader = req.getReader();
            while((line = reader.readLine()) != null)
                buffer.append(line);
        } catch (IOException e) {
            e.fillInStackTrace();
        }
        return buffer.toString();
    }
}
