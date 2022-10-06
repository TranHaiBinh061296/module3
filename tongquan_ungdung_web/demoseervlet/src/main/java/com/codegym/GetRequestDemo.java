package com.codegym;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(urlPatterns = {"/get-request"})
public class GetRequestDemo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter printWriter = resp.getWriter();
        printWriter.println("Hai Binh");
      String ten =  req.getParameter("ten");
      String khoaHoc = req.getParameter("khoahoc");
        printWriter.println("Xin chao " + ten + " khoahoc " + khoaHoc);
    }
    //Đọc dữ liệu gửi lên từ client qua URL trong Java Web
}
