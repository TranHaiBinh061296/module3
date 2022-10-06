package com.codegym;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/form-nano-dung"})
public class FormPerson extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter printWriter = resp.getWriter();
        printWriter.println("<form action='/demoseervlet/them-nguoi-dung' method='post'");
        printWriter.println("Ten:<input type='text' name='ten'>");
        printWriter.println("Tuoi: <input type='text' name='tuoi'>");
        printWriter.println("Dia Chi: <input type='text' name='diachi'>");
        printWriter.println("<input type='submit' value='submit'>");
        printWriter.println("</from>");
    }
}
