package com.codegym.product_discount_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      double price = Double.parseDouble(request.getParameter("price"));
      double discount = Double.parseDouble(request.getParameter("discount"));


      double discountAmount = price * discount * 0.01;
      double discountPrice = price - discountAmount;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1> Product Description:  </h1><br>");
        writer.println("<h2>Price: " + price + "</h2>");
        writer.println("<h2>Discount Percent: "+ discount +   "</h2>");
        writer.println("<h2>Discount Amount: " + Double.toString(discountAmount) + "</h2>");
        writer.println("<h2>Discount Price: " + Double.toString(discountPrice) + "</h2>");

        writer.println("</html>");

    }
}
