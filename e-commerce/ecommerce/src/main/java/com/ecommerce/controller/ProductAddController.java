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

@WebServlet("/addProduct")
public class ProductAddController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String line = readLines(req);

        JsonObject parsedParameter = JsonParser.parseString(line).getAsJsonObject();
        String customerId = parsedParameter.get("customerId").getAsString();
        String productCode = parsedParameter.get("productCode").getAsString();

        CommerceDAO dao = new CommerceDAO();
        int successAddCount = dao.addProductToCart(customerId, productCode);
        PrintWriter out = resp.getWriter();
        out.print(successAddCount);
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