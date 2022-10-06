package com.codegym;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/them-nano-dung"})
public class PersonServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter printWriter = resp.getWriter();

        String ten = req.getParameter("ten");
        String tuoi = req.getParameter("tuoi");
        String diachi = req.getParameter("diachi");

        printWriter.println("ten" + ten + " , tuoi " + tuoi + " , diachi " + diachi);
    }
}
