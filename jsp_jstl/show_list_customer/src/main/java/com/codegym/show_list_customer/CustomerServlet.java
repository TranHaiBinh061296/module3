package com.codegym.show_list_customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Customer> customers = new ArrayList<>();
        customers.add(new Customer("Bach Cong Khanh", LocalDate.parse("1990-02-12"),"Ha Noi","https://icdn.dantri.com.vn/thumb_w/660/2021/11/28/anh-hai-huoc-1-1638041886923.jpg"));
        customers.add(new Customer("Dao Ba Loc", LocalDate.parse("2002-10-29"),"Hue","https://demoda.vn/wp-content/uploads/2022/02/anh-hai-huoc.jpg"));
        customers.add(new Customer("Ly Thanh Tung", LocalDate.parse("1997-09-12"),"Hue","https://working24.net/wp-content/uploads/2019/09/su-dung-tinh-tiet-gay-go-mo-1.png"));
        customers.add(new Customer("Nguyen Minh Hieu", LocalDate.parse("1999-12-12"),"Quang Tri","https://working24.net/wp-content/uploads/2019/09/su-dung-tinh-tiet-gay-go-mo-1.png"));

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
        req.setAttribute("customers",customers);
        requestDispatcher.forward(req,resp);
    }
}
