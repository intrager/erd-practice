package com.ecommerce.controller;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/")
public class TemplateController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // forward
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/template.jsp");
        dispatcher.forward(req, resp);
    }
}