package com.codegym;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
//@WebServlet(urlPatterns = {"/text-cofig"},
//        initParams = {@WebInitParam(name ="name", value = "Tran Hai Binh")})

public class ServletCofigDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String name =   super.getServletConfig().getInitParameter("name");
         resp.setContentType("text/html");
        PrintWriter printWriter = resp.getWriter();
        printWriter.println("Xin chao " + name);

        printWriter.println(getServletConfig().getServletName());

    }
}
