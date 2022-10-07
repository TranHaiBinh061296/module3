package com.codegym.simple_dictionary;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TranslationServlet", value = "/translate")
public class TranslationServlet extends HttpServlet {
    Map<String,String> dictionary;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void init() throws ServletException {
        dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "The nào");
        dictionary.put("book", "Quyen vo");
        dictionary.put("computer", "Máy tính");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("txtSearch");

        PrintWriter printWriter = response.getWriter();
        printWriter.println("<html>");
        String result = dictionary.get(search);
        if (result != null) {
            printWriter.println("Word: " + search);
            printWriter.println("Result: " + result);
        } else {
            printWriter.println("Not found");
        }

        printWriter.println("</html>");

    }

}
