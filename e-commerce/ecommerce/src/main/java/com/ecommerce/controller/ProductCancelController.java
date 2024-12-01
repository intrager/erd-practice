package com.ecommerce.controller;

import com.ecommerce.repository.CommerceDAO;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/cancelProduct")
public class ProductCancelController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String line = readLines(req);

        JsonObject parsedParameter = JsonParser.parseString(line).getAsJsonObject();
        String ordersCode = parsedParameter.get("ordersCode").getAsString();
        String customerId = parsedParameter.get("customerId").getAsString();
        String productCode = parsedParameter.get("productCode").getAsString();
        System.out.println(ordersCode);
        System.out.println(customerId);
        System.out.println(productCode);
        CommerceDAO dao = new CommerceDAO();
        int canceled = dao.cancelProductInCart(ordersCode, customerId, productCode);
        PrintWriter out = resp.getWriter();
        out.print(canceled == 1);
        out.flush();
        out.close();
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
